import QtCharts 2.2
import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import "charts"
import "charts/Chart.js" as Charts



Pane {
    property string accentColor: "#21a2ff"
    property string primaryColor: "#253856"

    Layout.fillHeight: true
    Layout.fillWidth: true

    background: Rectangle{
        color: primaryColor
    }
        smooth: true

        ColumnLayout{
            anchors.fill: parent


        MChart {
            id: chartBar3

            Layout.fillWidth: true
            Layout.fillHeight: true
            chartType: Charts.ChartType.LINE

            fillColor: "#345678"
            labels: dataProvider.getLabels()
            values: dataProvider.getValues()
            strokeColor: "#72c4e8"
            pointColor: "#ffffff"
        }
}
//        Component.onCompleted: {
//            chartData = [4,6,3,6,9,4,9,3,6]
//        }
}
