import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11

Item {
    id: root
    width: root.size; height: root.size
    property int size: 75
    property alias source: image.source
    signal clicked

    Button {
        id: button
        width: root.width; height: root.height
        onClicked: root.clicked()
        background: Rectangle {
            anchors.fill: parent
            color: button.down ? "#4dbcff" : "#008fe6"
        }

        Image {
            id: image
            width: Math.floor(0.70 * root.size); height: Math.floor(0.70 * root.size)
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }

        ColorOverlay {
                anchors.fill: image; source: image
                color: "#ffffff"  // make image white
        }
    }
}

