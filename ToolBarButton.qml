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
            color: "#eee"
            implicitWidth: 100
            implicitHeight: btn.height
        }

        Layout.fillHeight: true
        Layout.fillWidth: true
        RowLayout{
            anchors.fill: parent
            Image {
                id: name
                source: imageSource
                sourceSize.width: 20
            }
            Text{
                text:textValue
                color: Literals.fontcolor
            }
        }
    }
}

/*##^## Designer {
    D{i:5;anchors_height:100;anchors_width:100}
}
 ##^##*/
