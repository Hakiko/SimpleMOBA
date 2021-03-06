import QtQuick 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
    property Item menu
    property int fontSize
    property color textColor

    id: settings

    anchors.centerIn: parent
    anchors.horizontalCenterOffset: -column.width * 0.5

    Text {
        font.pixelSize: 1.2 * fontSize
        text: "Settings"
        color: textColor
        anchors.bottom: column.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 0.5 * column.width
    }

    Column {
        id: column

        Row {
            Text {
                font.pixelSize: fontSize
                text: "Login: "
                color: textColor
            }
            TextField {
                width: 200
                font.pixelSize: fontSize
                style: TextFieldStyle {
                    textColor: settings.textColor
                    selectionColor: "black"
                    selectedTextColor: textColor
                    background: Rectangle {
                        border.width: 0
                        color: "transparent"
                        border.color: "transparent"
                    }
                }
            }
        }

        Row {
            height: Math.max(colorText.height, colorSelection.height + colorText.height / 2)
            clip:true

            Text {
                id: colorText
                text: "Color: "
                font.pixelSize: fontSize
                color: textColor
                anchors.top: parent.top
            }

            ColorComboBox {
                id: colorSelection
                anchors.top: parent.top
                anchors.topMargin: colorText.height / 4
                colors: [ "red", "yellow", "blue", "orange" ]
            }
        }

        Text {
            font.pixelSize: fontSize
            text: "Minimap location:"
            color: textColor
        }

        GroupBox {
            anchors.left: column.left
            anchors.leftMargin: 25
            Row {
                ExclusiveGroup { id: minimapLocation }
                RadioButton {
                    id: minimapLeft
                    text: "left "
                    checked: true
                    exclusiveGroup: minimapLocation
                    style: RadioButtonStyle {
                        label: Text {
                            text: control.text
                            font.pixelSize: fontSize
                            color: textColor
                            horizontalAlignment: Text.center
                        }
                    }
                    onClicked: {
                        world.minimapOnLeft = true
                    }
                }
                RadioButton {
                    id: minimapRight
                    text: "right"
                    exclusiveGroup: minimapLocation
                    style: RadioButtonStyle {
                        label: Text {
                            text: control.text
                            font.pixelSize: fontSize
                            color: textColor
                            horizontalAlignment: Text.center
                        }
                    }
                    onClicked: {
                        world.minimapOnLeft = false
                    }
                }
            }
        }

        Text {
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    settings.visible = false
                    menu.visible = true
                    menu.forceActiveFocus()
                }
            }

            anchors.horizontalCenter: parent.horizontalCenter
            text: "Back"
            font.pixelSize: fontSize
            color: textColor
        }

    }
}
