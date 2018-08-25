import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    header: ToolBar{
        id : toolbar
        RowLayout{
            anchors.fill: parent
            spacing: 0
            Item{
                id : logo
                Rectangle{
                    id : icon
                }
                Label{
                    id : title
                    width: 68
                    height: 39
                    color: "#2a2626"
                    Layout.fillHeight: true
                    verticalAlignment: Text.AlignVCenter
                    text: qsTr("JAHMINER")
                    font.weight: Literals.fontWeight
                }
            }

            Item{
                Layout.fillWidth: true
            }
            ToolSeparator{}

            ToolBarButton{
                id : chartBtn
                textValue: "Charts"
                imageSource: "images/chart-40.png"

            }
            ToolSeparator{ bottomPadding: 0; topPadding: 0; padding: 0}
            ToolBarButton{
                id : poolBtn
                textValue:  "Pool"
                imageSource: "images/settings-40.png"
                onClicked: {

                }
            }
            ToolSeparator{}

            ToolBarButton{
                id : accountBtn
                textValue:  "Account"
                imageSource: "images/lock-40.png"
                onClicked: {

                }
            }
        }
    }

    ColumnLayout{
        anchors.fill: parent
        SwipeView{
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        Pane{
            Layout.fillWidth: true
            padding: 10
        RowLayout{
            anchors.left: parent.left
            anchors.right: parent.right


            Button{
                id : startBtn
                text : "Start"
            }
            Label{
                Layout.fillWidth: true
                text : "Support Jahshaka\nwww.jahshaka.com"
                horizontalAlignment: Text.AlignHCenter

            }
            Button{
                id:helpBtn
                text: "Help"
            }
        }
    }
}
}
