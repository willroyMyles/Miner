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
    id: app

    background: Rectangle {
        color: Literals.darkBackgroundColor
    }

    header: ToolBar {
        id: toolbar

        //padding : 5
        background: Rectangle {
            color: Literals.darkBackgroundColor
            border.color: Literals.borderColor
            border.width: Literals.borderWidth
        }
        RowLayout {
            anchors.fill: parent
            spacing: 0
            Banner {
            }

            HorizontalSpacer {
            }

            ToolBarButton {
                id: chartBtn
                textValue: "Charts"
                imageSource: "images/chart-40.png"
                onClicked: {
                    swipe.state = "graph"
                    bottonButtonPane.state = ""
                }
            }
            ToolBarButton {
                id: poolBtn
                textValue: "Pool"
                imageSource: "images/settings-40.png"
                onClicked: {
                    swipe.state = "settings"
                    bottonButtonPane.state = "settings"
                }
            }

            ToolBarButton {
                id: accountBtn
                textValue: "Account"
                imageSource: "images/lock-40.png"
                onClicked: {

                }
            }
            Item {
                //width: 15
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        Rectangle {
            anchors.fill: parent

            id: swipe
            Layout.fillHeight: true
            Layout.fillWidth: true

            border.color: Literals.borderColor
            border.width: Literals.borderWidth

            //color: "red"
            SettingsPage {
                id: settings_page
                anchors.fill: parent
                z: 0
                scale: 0.0
                opacity: 0.0
            }

            GraphicsCardPage {
                id: graph_page
                anchors.fill: parent
                z: 0
                scale: 0.0
                opacity: 0.0
              onPoolurlChanged: {settings_page.poolurl = graph_page.poolurl}
              onPasswordChanged: {settings_page.password = graph_page.password}
              onWalletidChanged: {settings_page.walletid = graph_page.walletid}
              onIdentifierChanged: {settings_page.identifier = graph_page.identifier}
            }



            state: "graph"

            states: [

                State {
                    name: "settings"
                    PropertyChanges {
                        target: settings_page
                        scale: 1.0
                        z: 3
                        opacity: 1.0
                    }
                },
                State {
                    name: "graph"
                    PropertyChanges {
                        target: graph_page
                        scale: 1.0
                        z: 3
                        opacity: 1.0
                    }
                }
            ]
        }

        Pane {
            id: bottonButtonPane
            Layout.fillWidth: true
            background: Rectangle {
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
                    onClicked: {
                        graph_page.startMining = true
                        console.log("start button clicked")
                    }
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
                    onClicked: {
                        console.log("help button")
                    }
                }
            }

            states: [
                State {
                    name: "settings"
                    PropertyChanges {
                        target: startBtn
                        textValue: "Confirm"

                    }

                    PropertyChanges {
                        target: helpBtn
                        textValue: "Canel"
                        onClicked:{
                            console.log("cancel button")
                        }

                    }
                }

            ]
        }
    }
}
