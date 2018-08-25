import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
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

    TextMetrics{
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

            Switch {
                id: switchBtn
            }

            Text {
                id: minerIndex
                text: "Miner index"
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

            ColumnLayout {
                id: columnLeft
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
                            textValue: "CardOne"
                        }
                        SimpleLabel {
                            id: status
                            textValue: "status"
                        }
                        Label {
                            Layout.fillWidth: true
                            horizontalAlignment: Text.AlignRight
                            Layout.fillHeight: true
                            font: textMetrics.font
                        }
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
                    }
                }
            }

            ColumnLayout {
                id: columnRight
                Layout.fillWidth: true

                Rectangle {
                    width: 0
                    Layout.fillWidth: true
                    color: "red"
                    Layout.preferredWidth: 300
                }
            }
        }
    }
}
