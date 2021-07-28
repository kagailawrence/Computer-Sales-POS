import QtQuick 2.0

Item {
    id:id_root
    property int value: 0
    property int granularity:12
    property int valueminutes: 0
    Rectangle{
        width: 3
        height: id_root.height*0.3
        color: "blue"
        anchors{
            horizontalCenter: id_root.horizontalCenter
            bottom: id_root.verticalCenter
        }
        antialiasing: true
    }
    rotation:360/granularity*(value % granularity)+360/granularity*(valueminutes/60)
    antialiasing: true

}
