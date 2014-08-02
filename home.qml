import QtQuick 2.0

Rectangle {
    id: root
    width: 640
    height: 562*2
    clip: true
    color: "#f6f6f6"

    ListView {
        id: _ListView
        anchors.fill: parent
        model: AlbumModel { }
        cacheBuffer: 10*root.height
        delegate: Rectangle {
            id: _Rectangle_Delegate
            property string title : model.title
            width: ListView.view.width
            height: 400
            color: "#ffffff"
            Rectangle {
                anchors.fill: parent
                anchors.margins: 35
                color: "#F5F7FA"
                Flickable {
                    id: _Flickable
                    anchors.fill: parent
                    contentWidth: width
                    contentHeight: _Image.height
                    boundsBehavior: Flickable.StopAtBounds
                    interactive: false
                    property int distanceFromTop : Math.min(Math.max(0, _Rectangle_Delegate.y - _ListView.contentY), 800)
                    property int amplifier : 7
                    contentY:  amplifier * (8 - (distanceFromTop / 100))
                    Image {
                        id: _Image
                        width: 600
                        height: 340
                        fillMode: Image.PreserveAspectFit
                        source: model.image.replace("170x170","340x340")
                        scale: 2
                        smooth: true
                        cache: true
                        asynchronous: true
                        opacity: 0.0
                        onStatusChanged: if(status === Image.Ready) _Image.opacity = 1.0
                        Behavior on opacity { NumberAnimation { duration: 150 } }
                    }
                }
                Flow {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 20; anchors.rightMargin: anchors.leftMargin
                    anchors.bottomMargin: 50
                    Repeater {
                        model: _Rectangle_Delegate.title.split("")
                        delegate: Rectangle {
                            width: _Text.paintedWidth
                            height: _Text.paintedHeight + 4
                            color: "#000000"
                            Text {
                                id: _Text
                                anchors.verticalCenter: parent.verticalCenter
                                font.pixelSize: 32
                                color: "#ffffff"
                                text: modelData
                            }
                        }
                    }
                }
                border { width: 2; color: "#f6f6f6" }
                clip: true
            }
            Rectangle {
                width: parent.width; height: 4;
                anchors.bottom: parent.bottom
                color: "#f6f6f6"
            }
        }
    }
}
