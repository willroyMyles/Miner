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
    property int myIndex: 0

    //property QtObject dataprovder: 0
    property DataProvider provider: null

    onProviderChanged: {
        console.log(provider)
    }


    property real average: provider.getAverage()
    property string cardname: provider.getCardName()
    property string status: provider.getStatus()
    property real high: provider.getHigh()
    property real low: provider.getLow()
    property double mean: provider.getMean()
    property real latest: provider.getLatest()
    property bool armed: provider.armed();


    Connections{
        target : provider
        onMaxValueChanged: {  high = value   }
        onCardNameChanged: {  cardname = value }
        onLatestChanged: { latest = value }
        onLowChanged: {low = value}
        onStatusChanged: {status = value }
        onMeanChanged: {mean = value}
        onDataAdded: {
            areaChart.labels= provider.getLabels()
            areaChart.values= provider.getValues()
        }
        onArmedChanged:{ armed = value}
    }

    Layout.fillHeight: true
    Layout.fillWidth: true

    background: Rectangle {
        color: Literals.transparent
    }
    smooth: true

    MouseArea {
        anchors.fill: parent
        id: area

        onClicked: {
            provider.randomSeries();
            areaChart.repaint()

            average = provider.getAverage()
            areaChart.chartOptions = ({
                                                          scaleStepWidth: provider.maxValue/10,
                                                          pointDotRadius: 0,

                                                      })
        }
    }

    RowLayout {
        anchors.fill: parent

        ColumnLayout {

            Rectangle {
                id: hashLegend

              //  anchors.fill: parent
                Layout.leftMargin: areaChart.width - hashLayout.width
                Layout.topMargin: -40

                RowLayout {
                    id: hashLayout
                    Rectangle {
                        implicitHeight: 20
                        implicitWidth: implicitHeight+5
                        border.width: 3
                        border.color: "white"
                        color: Literals.chartBackgroundColor
                    }

                    Label {
                        text: "Hashes"
                        color: Literals.fontcolor
                        font.weight: Literals.fontWeight
                    }
                }
            }

            Rectangle {
                //grapg background rectangle
                anchors {
                    left: areaChart.left
                    right: areaChart.right
                    top: areaChart.top
                    bottom: areaChart.bottom
                    leftMargin: 50
                    rightMargin: 17
                    topMargin: 9
                    bottomMargin: 17
                }
                color: Literals.transparent
            }
            MChart {
                id: areaChart

                Layout.fillWidth: true
                Layout.fillHeight: true
                chartType: Charts.ChartType.LINE

            fillColor: Literals.chartBackgroundColor
            labels: provider.getLabels()
            values: provider.getValues()
            strokeColor: "#72c4e8"
            pointColor: "#ffffff"

                chartAnimated: false
                chartOptions: ({
                                   "scaleLineWidth": 2,
                                   "barShowStroke": false,
                                   "scaleFontSize": 10,
                                   "scaleFontFamily": "sans-serif",
                                   "barValueSpacing": 10,
                                   "scaleFontColor": "#444444",
                                   "pointDotRadius": 0,
                                   "bezierCurve": false,
                                   "scaleGridLineColor": "rgba(220,220,220,1)",
                                   "scaleLineColor": "rgba(220,220,220,1)",
                                   "scaleShowLabels": true,
                                   "scaleShowGridLines": true,
                                   "scaleSteps"//needed to override x-asix
                                   //draws 10 lines, incremented by 100
                                   : 5,
                                   "scaleStepWidth": dataprovider.maxValue / 5,
                                   "scaleOverride": true
                               })
                onValuesChanged: {
                    requestPaint()
                }
            }
        }
        Item {
            width: 20
        }

        ColumnLayout {
            Rectangle {
                id: averageBar
                border.color: Literals.borderColor
                border.width: Literals.borderWidth
                implicitWidth: 25
                Layout.fillHeight: true
                color: Literals.transparent
               // rotation: 180

                Component.onCompleted: {

                }

                Rectangle{
                    anchors.fill: parent
                    Layout.fillWidth: true
                    implicitHeight: parent.height * .6
                    color: Literals.buttonColorHovered
                }
            }

            Label {
                id: avg
                text: "Avg"
                color: Literals.fontcolor
                horizontalAlignment: Text.horizontalCenter
                Layout.preferredWidth: 25
                // Layout.alignment: Text.horizontalCenter
                background: Rectangle {
                    color: Literals.transparent
                }
            }
        }
    }
    //        Component.onCompleted: {
    //            chartData = [4,6,3,6,9,4,9,3,6]
    //        }
}
