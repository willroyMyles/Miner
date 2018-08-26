import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

Pane {
    id: btn
    property string imageSource: ""
    property string textValue: ""
    property string bgcolor: Literals.darkBackgroundColor
    padding: 0

    signal clicked()

    Behavior on bgcolor {

        ColorAnimation {
            from: "white"
            to: "black"
            duration: 200
        }
    }


    implicitWidth: 100
    //implicitHeight: parent.height
    background: Rectangle{
        color: Literals.transparent
    }



    MouseArea {
        anchors.fill: parent

        onClicked: btn.clicked()
    }

    Layout.fillHeight: true
    RowLayout {
        anchors.fill: parent

        Rectangle{
            Layout.fillHeight: true
            implicitWidth: 1
            implicitHeight: parent.height
            border.color: Literals.borderColor
            anchors.left: parent.left
            color: Literals.borderColor
        }
        Image {
            id: name
            source: "../" + imageSource
            sourceSize.width: 20
        }
        Text {
            text: textValue
            color: Literals.fontcolor
        }
    }
}
