import QtQuick 2.1
import QtQuick.Window 2.0
import QtGraphicalEffects 1.0

Rectangle {
    color: "#e8e8e8"
    ListView {
        id: baseList
        anchors.fill: parent
        model: notesModel
        spacing: 20

        delegate: Item {
            height: title_text.height + desc_text.height
            width: baseList.width
            Rectangle {
                id: postBackground
                width: baseList.width - 30
                height: parent.height
                anchors.horizontalCenter: parent.horizontalCenter

                color: "White"
                border.color: "#dadada"
            }

            DropShadow {
                source: postBackground
                anchors.fill: source
                cached: true
                horizontalOffset: 1
                verticalOffset: 1
                spread: 0.0
                radius: 8.0
                samples: 16
                color: "#c4c4c4"
            }

            Text {
                anchors {
                    top: postBackground.top
                    left: postBackground.left
                    right: postBackground.right
                }
                id: title_text
                text: model.title
                font.bold: true
            }

            Text {
                anchors {
                    top: title_text.bottom
                    left: postBackground.left
                    right: postBackground.right
                }
                id: desc_text
                text: model.description
                wrapMode: Text.Wrap
                font.pointSize: 8

            }
        }
    }
}
