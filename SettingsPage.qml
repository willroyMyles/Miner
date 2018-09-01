import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import "subclass"

//import "settings"
BasePage {

    padding: 10

    background: Rectangle {
        color: Literals.darkBackgroundColor
    }

    ScrollView {
        id: scroll
        width: parent.width
        height: parent.height
        Layout.fillWidth: true
        Layout.fillHeight: true
        background: Rectangle {
            color: Literals.darkBackgroundColor
        }

        ColumnLayout {
            id: col
            spacing: 1
            //anchors.fill: scroll
            width: scroll.width

            Item {
                Layout.fillHeight: true
            }

            SettingsNode {
                labeld: "Walled ID"
                textfieldd: "Enter wallet ID here"
            }

            SettingsNode {
                labeld: "Pool Address"
                textfieldd: "Enter Pool Address"
            }

            SettingsNode {
                labeld: "Identifier"
                textfieldd: "Enter Identifier"
            }

            SettingsNode {
                labeld: "Password"
                textfieldd: "Enter Password"
            }

            Item {
                Layout.fillHeight: true
            }

//            RowLayout {
//                Button {
//                    Layout.fillWidth: true
//                    text: "cancel"
//                }
//                Button {
//                    text: "confirm"
//                    Layout.fillWidth: true
//                }
//            }
        }
    }
}
