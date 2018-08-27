import QtCharts 2.2
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
    property string accentColor: "#21a2ff"
    property string primaryColor: "#253856"
    property double average: dataprovider.getAverage()


    DataProvider{
        id:dataprovider
    }

    Layout.fillHeight: true
    Layout.fillWidth: true

    background: Rectangle {
        color: Literals.transparent
    }
    smooth: true

    MouseArea{
        anchors.fill: parent
        id: area

        onClicked: {
            dataprovider.addToSeries();
            areaChart.labels= dataprovider.getLabels()
            areaChart.values= dataprovider.getValues()
            average = dataprovider.getAverage()
            areaChart.repaint()
        }
    }



    RowLayout {
        anchors.fill: parent

        Rectangle{

            //grapg background rectangle
            anchors{
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

            //fillColor: Literals.chartBackgroundColor
            labels: dataprovider.getLabels()
            values: dataprovider.getValues()
            strokeColor: "#72c4e8"
            pointColor: "#ffffff"

            chartAnimated: true
            chartOptions: ({
                scaleLineWidth: 2,
                barShowStroke: false,
                scaleFontSize: 10,
                scaleFontFamily: "sans-serif",
                barValueSpacing: 10,
                scaleFontColor: "#444444",
                pointDotRadius: 0,
                bezierCurve: false,
                               scaleGridLineColor: "rgba(220,220,220,1)",
                               scaleLineColor: "rgba(220,220,220,1)",
                               scaleShowLabels: true,
                               scaleShowGridLines: true,

                               //needed to override x-asix
                               //draws 10 lines, incremented by 100
                               scaleSteps : 10,
                               scaleStepWidth: 100,
                               scaleOverride: true,


            })
            onValuesChanged: {
                requestPaint()
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
                rotation: 180

                Component.onCompleted: {
                    console.log(dataprovider.getAverage())
                }

                gradient: Gradient{
                    GradientStop{position: 0.0; color: Literals.blueButtonColor}
                    GradientStop{position: average; color: Literals.darkBackgroundColor}
                    GradientStop{position: average; color: Literals.blueButtonColorPressed}
                }
            }

            Label {
                id: avg
                text: "Avg"
                color: Literals.fontcolor
            }
        }
    }
    //        Component.onCompleted: {
    //            chartData = [4,6,3,6,9,4,9,3,6]
    //        }
}
