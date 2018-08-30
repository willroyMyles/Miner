import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

Rectangle {
    id: btn
    property string imageSource: ""
    property string textValue: ""
    property string bgcolor: Literals.transparent

    signal clicked()

    Behavior on bgcolor {

        ColorAnimation {
            duration: 200
        }
    }

    implicitWidth: 100
    color: bgcolor

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onEntered: {
            bgcolor = Literals.buttonColorHovered
        }

        onExited: {
            bgcolor = Literals.transparent
        }

        onPressed: {
            bgcolor = Literals.buttonColorPressed
        }
        onReleased: {
            bgcolor = Literals.transparent
        }
        onClicked: {
            btn.clicked()
        }
    }

    Layout.fillHeight: true
    RowLayout {
        anchors.fill: parent

//        Rectangle {
//            Layout.fillHeight: true
//            implicitWidth: 1
//            implicitHeight: parent.height
//            border.color: Literals.borderColor
//            anchors.left: parent.left
//            color: Literals.borderColor
//        }

        CustomBorder{
            commonBorder: false
            borderColor: Literals.borderColor
            bBorderwidth: 1
        }

        Image {
            id: name
            source: "../" + imageSource
            sourceSize.width: 20
        }
        Label {
            id: textval
            text: textValue
            color: Literals.fontcolor
            font.weight: Literals.fontWeight
        }
    }
}
