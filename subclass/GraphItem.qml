import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import DataProvider 1.0

import "charts"
import "charts/Chart.js" as Charts

Pane {
    id: pane
    property int myIndex: 0

    property DataProvider provider: null

    onProviderChanged: {
        console.log(provider, "graph item")
        cg.provider = provider
    }

    property real average: provider.getAverage()
    property string cardname: provider.getCardName()
    property string status: provider.getStatus()
    property real high: provider.getHigh()
    property real low: provider.getLow()
    property double mean: provider.getMean()
    property real latest: provider.getLatest()
    property bool armed: provider.armed()
    property string currentTime: ""

    function getCurrentTime() {
        currentTime = provider.time()
    }

    Connections {
        target: provider
        onMaxValueChanged: {
            high = value
        }
        onCardNameChanged: {
            cardname = value
        }
        onLatestChanged: {
            latest = value
        }
        onLowChanged: {
            low = value
        }
        onStatusChanged: {
            status = value
        }
        onMeanChanged: {
            mean = value
        }
        onDataAdded: {
            getCurrentTime()
            //  cg.reDraw()
        }
        onArmedChanged: {
            armed = value
        }
        onAverageChanged: {
            average = value
        }
    }

    Layout.fillHeight: true
    Layout.fillWidth: true

    background: Rectangle {
        color: Literals.transparent
    }
    smooth: true

    RowLayout {
        anchors.fill: parent

        ColumnLayout {

            Rectangle {
                id: hashLegend

                //  anchors.fill: parent
                Layout.leftMargin: cg.width - hashLayout.width - 10
                Layout.topMargin: -40

                RowLayout {
                    id: hashLayout
                    Rectangle {
                        implicitHeight: 15
                        implicitWidth: implicitHeight + 3
                        border.width: 2
                        border.color: Literals.buttonColorHovered
                        color: Literals.chartBackgroundColor
                    }

                    Label {
                        text: "Hashes"
                        color: Literals.fontcolor
                        font.weight: Literals.fontWeight
                        font.pixelSize: Qt.application.font.pixelSize * 1.2
                    }

                }
            }

            Item {
                width: 20
            }

            CustomGraph {
                id: cg
                provider: provider
                Layout.fillHeight: true
                Layout.fillWidth: true

                numOfValues: provider.chartMaxAmount()
                //  graphAxisColor: "#99000000"
                //  graphFillColor: "#99000000"
                //  graphLineColor: "#99000000"
                max: high
                xAxisMaxMultiplier: 2
                skipgraph: false
                backgroundColor: "#777"
            }

            //            MChart {
            //                id: areaChart

            //                Layout.fillWidth: true
            //                Layout.fillHeight: true
            //                chartType: Charts.ChartType.LINE
            //                chartWidth: areaChart.width

            //            fillColor: Literals.chartBackgroundColor
            //            labels: provider.getLabels()
            //            values: provider.getValues()
            //            strokeColor: "#0072c4e8"
            //            pointColor: "#ffffff"

            //                chartAnimated: false

            //                onValuesChanged: {
            //                    requestPaint()
            //                }
            //            }
        }
        Item {
            width: 20
        }

        ColumnLayout {
            id: colL
            spacing: 0

		

                    Label {

					Layout.topMargin : -height-15

                        id: avg
                        text: "Avg"
                        horizontalAlignment: Text.AlignHCenter
                        color: Literals.fontcolor
                        Layout.preferredWidth: averageBar.width
                   //     Layout.topMargin: -height - (height / 3)
                        font.weight: Literals.fontWeight
                        font.pixelSize: Qt.application.font.pixelSize * 1
                    }

            Rectangle {
                id: averageBar
                border.color: Literals.borderColor
                border.width: Literals.borderWidth
                implicitWidth: 25
                Layout.fillHeight: true
                // Layout.topMargin: 20
                implicitHeight: +avg.height

                color: "#11eeeeee"
                rotation: 180

                Component.onCompleted: {

                }

                Rectangle {
                    onImplicitHeightChanged: {

                    }
                    implicitHeight: (parent.height - Literals.borderWidth * 2) * average / 2
                    implicitWidth: 21
                    x: Literals.borderWidth
                    y: Literals.borderWidth

                    anchors {
                        // centerIn: parent
                        bottomMargin: 0
                    }

                    color: Literals.blueButtonColor
                    //anchors.fill: parent
                }
            }
        }
    }
}
