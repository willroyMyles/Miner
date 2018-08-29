import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import "subclass"
import MinerManager 1.0
import DataProvider 1.0

Page {

    MinerManager{
        id: manager
        Component.onCompleted: {
            manager.initialize();
        }

        onProcessCreated: {
            console.log(provider)
            addGraphicsCard(provider);
        }
    }


    padding: 0
    background: Rectangle{
        //border.color: Literals.borderColor
      //  border.width: Literals.borderWidth
        color: Literals.transparent

        Rectangle{
            border.color: Literals.borderColor
            border.width: Literals.borderWidth
            anchors.left: parent.left
            width: 1
            Layout.fillHeight: true
        }
        Rectangle{
            border.color: Literals.borderColor
            border.width: Literals.borderWidth
            anchors.right: parent.right
            width: 1
            Layout.fillHeight: true
        }

    }


        ScrollView {
            id: scrollview
            width: parent.width
            height: parent.height
            Layout.fillWidth: true
            Layout.fillHeight: true

            clip: true
            padding: 10





            background: Rectangle {
                color: Literals.darkBackgroundColor
             //   border.color: Literals.borderColor
             //   border.width: Literals.borderWidth

            }


            ColumnLayout {

                id: col
                spacing:5
                width: scrollview.width- scrollview.padding * 2

                // Layout.fillWidth: true
//                GraphicsCard {
//                    id: card1
//                    cardName: "card1"
//                }

//                GraphicsCard {
//                    id: card2
//                    cardName: "card2"
//                }
            }
        }

        function addGraphicsCard(provider){
            var comp;
            var card;

            //create cards and pass info
            comp = Qt.createComponent("subclass/GraphicsCard.qml")

            if (comp.status == Component.Ready)
                card = comp.createObject(col,{"cardName" : "createdCard", "cardIndex":1, "provider" : provider })
            else
                comp.statusChanged.connect( card = comp.createObject(col,{"cardName" : "createdCard"}));

        }


}
