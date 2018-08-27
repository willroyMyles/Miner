import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Page {
    property alias cardName: cardName.text
    property alias status: status.text
    property alias high: high.text
    property alias low: low.text
    property alias mean: mean.text
    property alias latest: latest.text




    padding: 15
    topPadding: 10
    Layout.fillWidth: true
    background: Rectangle {
        color: "#00000000"
        border.color: "#555555"
        border.width: 2
    }

    TextMetrics {
        id: textMetrics
        font.weight: Literals.fontWeight
        font.pixelSize: Qt.application.font.pixelSize * 1.2
    }

    ColumnLayout {
        id: colLayout
        anchors.fill: parent
        ////////////////////////////////////////////////////////////////////////// top row
        RowLayout {
            anchors {
                left: parent.left
                right: parent.right
            }

           CustomSwitch{

           }

            Text {
                id: minerIndex
                text: "Miner index"
                font.pixelSize: Qt.application.font.pixelSize * 1.5
                color: Literals.fontcolor

            }

            HorizontalSpacer {
            }

            Button {
                background: Rectangle {
                    implicitHeight: 5
                    implicitWidth: 5
                    color: "red"
                }
                text: "hello"
            }
        }
        ///////////////////////////////////////////////////////////////////////////////  top row
        ///////////////////////////////////////////////////////////////////////////////  card Content
        RowLayout {

            Layout.fillWidth: true

            Pane {
                padding: 0
                Layout.preferredWidth: 120
                background: Rectangle {
                    color: "transparent"
                }

                ColumnLayout {
                    id: columnLeft
                    anchors.fill: parent
                    Layout.preferredWidth: 100
                    Layout.fillWidth: true
                    Pane {
                        padding: 0
                        Layout.fillWidth: true
                        background: Rectangle {
                            color: "#00000000"
                        }
                        ColumnLayout {
                            anchors.fill: parent
                            SimpleLabel {
                                id: cardName
                                Layout.fillWidth: true
                                textValue: "CardOne"
                            }
                            SimpleLabel {
                                id: status
                                textValue: "status"
                            }
                            Label {
                                /*space*/ }
                            SimpleLabel {
                                id: high
                                textValue: "high"
                            }
                            SimpleLabel {
                                id: low
                                textValue: "low"
                            }
                            SimpleLabel {
                                id: mean
                                textValue: "mean"
                            }
                            SimpleLabel {
                                id: latest
                                textValue: "latest"
                            }
                            Label {
                                /*space*/ }
                            Label {
                                /*space*/ }
                        }
                    }
                }
            }
            ColumnLayout {
                id: columnRight
                Layout.fillWidth: true

                GraphItem {
                }
            }
        }
    }
}