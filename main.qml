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


//    background: Rectangle{
//        border.color: Literals.borderColor
//        color: Literals.darkBackgroundColor
//        border.width: 12
//    }

    header: ToolBar {
        id: toolbar
        //padding : 5

        background: Rectangle{
            color: Literals.darkBackgroundColor
            border.color: Literals.borderColor
            border.width: Literals.borderWidth
        }
        RowLayout {
            anchors.fill: parent
            spacing: 0
            Banner{

            }

           HorizontalSpacer{}

            ToolBarButton {
                id: chartBtn
                textValue: "Charts"
                imageSource: "images/chart-40.png"
                onClicked: {
                    console.log("textValue")
                    swipe.setCurrentIndex(0)
                }
            }
            ToolBarButton {
                id: poolBtn
                textValue: "Pool"
                imageSource: "images/settings-40.png"
                onClicked: {
                    swipe.setCurrentIndex(1)
                }
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
        spacing: 0
        SwipeView {

            id : swipe
            Layout.fillHeight: true
            Layout.fillWidth: true

            background: Rectangle{
                border.color: Literals.borderColor
                border.width: Literals.borderWidth
                color: Literals.transparent
            }
            currentIndex: 0

            GraphicsCardPage{
                id : graph_page
            }

            SettingsPage{
                id: settings_page
            }

        }

        Pane {
            Layout.fillWidth: true
            //padding: 10
            background: Rectangle{
                color: Literals.darkBackgroundColor
                border.color: Literals.borderColor
                border.width: Literals.borderWidth
            }

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
                    color: Literals.fontcolor
                    font.pixelSize: Qt.application.font.pixelSize * .8
                    font.weight: Literals.fontWeight
                }
                BlueButton {
                    id: helpBtn
                    textValue: "Help"
                }
            }
        }
    }
}
