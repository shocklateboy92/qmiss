import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Window 2.0
import QtGraphicalEffects 1.0

Rectangle {
    width: 640
    height: 480
    color: "#e8e8e8"

    ListView {
        id: baseList
        anchors.fill: parent
        model: mockModel
        spacing: 20

        delegate: Item {
            height: column.height
            width: baseList.width
            Rectangle {
                id: postBackground
                width: baseList.width - 30
                height: column.height
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

            Column {
                id: column
                spacing: 10

                Repeater {
                    id: repeater
                    model: properties

                    delegate:  Row {
                        id: postRow
                        Text {
                            id: keyLabel
                            text: model.name
                            horizontalAlignment: Text.AlignRight
                            width: baseList.width < 300 ? baseList.width : 200
                            wrapMode: Text.Wrap
                        }

                        Item {
                            id: spacer
                            width: 10
                            height: keyLabel.height
                        }

                        Text {
                            id: valueLabel
                            text: model.value
                            width: baseList.width - keyLabel.width - spacer.width - 30
                            wrapMode: Text.Wrap
                        }
                    }
                }
            }
        }
    }
}
