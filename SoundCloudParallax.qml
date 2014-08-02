import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Window 2.0

Window {
    id: superRoot
    visible: true
    width: 320
    height: 568

    //# qt5
    Loader {
        id: _Loader
        width: parent.width*2
        height: parent.height*2
        anchors.left: parent.left;
        anchors.top: parent.top
        Scale {
            id: _Scale_iOS
            xScale: 0.5; yScale: 0.5
            origin.x: 0; origin.y: 0
        }
        state: "scaled"
        states: [
            State {
                name: "scaled"
                PropertyChanges {
                    target: _Loader
                    transform: _Scale_iOS
                }
            }
        ]
        source: "home.qml"
    }
}
