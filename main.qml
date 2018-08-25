import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "subclass"

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("JahMiner")
    minimumHeight: 350
    minimumWidth: 450

    header: ToolBar {
        id: toolbar
        RowLayout {
            anchors.fill: parent
            spacing: 0
            Banner{

            }

            Item {
                Layout.fillWidth: true
            }
            ToolSeparator {
            }

            ToolBarButton {
                id: chartBtn
                textValue: "Charts"
                imageSource: "images/chart-40.png"
            }
            ToolSeparator {
                bottomPadding: 0
                topPadding: 0
                padding: 0
            }
            ToolBarButton {
                id: poolBtn
                textValue: "Pool"
                imageSource: "images/settings-40.png"
                onClicked: {

                }
            }
            ToolSeparator {
            }

            ToolBarButton {
                id: accountBtn
                textValue: "Account"
                imageSource: "images/lock-40.png"
                onClicked: {

                }
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        SwipeView {
            Layout.fillHeight: true
            Layout.fillWidth: true

            background: Rectangle{
                color: "blue"

            }

            currentIndex: 1

            GraphicsCardPage{
            }

        }

        Pane {
            Layout.fillWidth: true
            padding: 10
            RowLayout {
                anchors.left: parent.left
                anchors.right: parent.right

                BlueButton {
                    id: startBtn
                    textValue: "Start"
                }
                Label {
                    Layout.fillWidth: true
                    text: "Support Jahshaka\nwww.jahshaka.com"
                    horizontalAlignment: Text.AlignHCenter
                }
                BlueButton {
                    id: helpBtn
                    textValue: "Help"
                }
            }
        }
    }
}
