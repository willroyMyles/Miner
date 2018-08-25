import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
Button {
    id: btn
    property string imageSource: ""
    property string textValue: ""

    Pane{
        background: Rectangle{
            color: Literals.blueButtonColor
            implicitWidth: 100
           // implicitHeight:  parent.height
        }

        Layout.fillHeight: true
        Layout.fillWidth: true
        RowLayout{
            anchors.fill: parent
            Image {
                id: name
                source: imageSource==""? "":"../"+imageSource
                sourceSize.width: imageSource==""? 0:20
            }
            Text{
                text:textValue
                font.weight: Literals.fontWeight
                color: Literals.fontcolor
                horizontalAlignment: Text.AlignHCenter
                Layout.fillWidth: true
            }
        }
    }
}

