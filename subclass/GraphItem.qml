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
    property string currentTime: ""

    function getCurrentTime(){
        currentTime = provider.time();
    }

    Connections{
        target : provider
        onMaxValueChanged: {  high = value   }
        onCardNameChanged: {  cardname = value }
        onLatestChanged: { latest = value }
        onLowChanged: {low = value}
        onStatusChanged: {status = value }
        onMeanChanged: {mean = value}
        onDataAdded: {
            getCurrentTime();
            areaChart.labels= provider.getLabels()
            areaChart.values= provider.getValues()
        }
        onArmedChanged:{ armed = value}
        onAverageChanged: {average = value}
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

            //average = provider.getAverage()
//            areaChart.chartOptions = ({
//                                                          scaleStepWidth: provider.maxValue/10,
//                                                          pointDotRadius: 0,

//                                                      })
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
                        implicitHeight: 15
                        implicitWidth: implicitHeight+3
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

            Rectangle {
                id: graphBackground
                //grapg background rectangle
                anchors {
                    left: areaChart.left
                    right: areaChart.right
                    top: areaChart.top
                    bottom: areaChart.bottom
                    leftMargin: 0
                    rightMargin: 0
                    topMargin: 0
                    bottomMargin: 20
                }
                color: "#11eeeeee"
                border.width: Literals.borderWidth
                border.color: Literals.borderColor
                //opacity: .2
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
                implicitHeight: graphBackground.height

                color: "#11eeeeee"
                rotation: 180

                Component.onCompleted: {

                }

                Rectangle{

                    implicitHeight: (parent.height-Literals.borderWidth*2) * average
                    implicitWidth: 21
                    x:Literals.borderWidth
                    y:Literals.borderWidth

                    anchors{
                       // centerIn: parent
                        bottomMargin: 0
                    }

                    color: Literals.blueButtonColor
                    //anchors.fill: parent


                }
            }

            Label {
                id: avg
                text: "Avg"
                horizontalAlignment: Text.AlignHCenter
                color: Literals.fontcolor
                Layout.preferredWidth: averageBar.width

            }
        }
    }
    //        Component.onCompleted: {
    //            chartData = [4,6,3,6,9,4,9,3,6]
    //        }
}
