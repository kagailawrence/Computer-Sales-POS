import QtQuick 2.0
import QtQuick.Controls 2.5
import 'Clock'

Item {
    // 578 800
    id:root
    property int smallscreensizesize:root.height/2
    property int largescreensize:root.width/3-root.width/13

   Frame{
        padding: 30
        height: 100
        width: root.width
        background: Rectangle{
            color: "gray"
        }

        Clock{
            id:id_root
        }

        Row{
            spacing: 10
            Label{
                text:"Welcome "+masterController.ui_title.toString().toUpperCase()// the name of the user
                font.bold: true;
                font.pixelSize: 16;
                font.italic: true
            }
            Column{
                id:datetime
                spacing: 3
                Text{
                    text:Qt.formatDate(id_root.currentDate,"MMM/dd/yyyy")
                    font.pixelSize:16
                }
                Text{
                    text:Qt.formatTime(id_root.currentDate,"h:mm.s ap")
                    font.pixelSize:16
                }
            }
        }
    }

    Item{
        anchors.horizontalCenter:parent.horizontalCenter
        y:200
        height:400
        width: maingride.width+50


        Grid{
            id:maingride
            clip: true
            anchors.centerIn: parent
            anchors.margins: 20
            spacing: 10
            columns:3
            Rectangle{
                id:report
                height: 160
                width: root.height>700 ? root.largescreensize:root.smallscreensize
                color:"#1B4166"
                radius: 4

                Text{
                    id:txtreport
                    anchors.left: parent.left
                    anchors.margins:90
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr(" Report")
                    font.pointSize: 18
                    color: "white"
                    font.bold:true

                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        masterController.ui_navigation.goCreateReport()
                    }
                }
            }

            Rectangle{
                id:sales
                height: 160
                width:root.largescreensize
                color: "#1B4166"
                radius: 4

                Text{
                    id:txtsales
                    anchors.left: parent.left
                    anchors.margins:90
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Sales")
                    font.pointSize: 18
                    color: "white"
                    font.bold:true
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        masterController.ui_navigation.goCreateSales()
                    }
                }
            }



            Rectangle{
                id:stock
                height: 160
                width:root.largescreensize
                color: "#1B4166"
                radius: 4

                Text{
                    id:txtstock
                    anchors.left: parent.left
                    anchors.margins:90
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Stock")
                    font.pointSize: 18
                    color: "white"
                    font.bold:true
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        masterController.ui_navigation.goCreateStock();
                    }
                }
            }

            Rectangle{
                id:setting
                height: 160
                width: root.height>700 ?root.largescreensize:root.smallscreensize
                color: "#1B4166"
                radius: 4

                Text{
                    id:txtsetting
                    anchors.left: parent.left
                    anchors.margins:90
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Setting")
                    font.pointSize: 18
                    color: "white"
                    font.bold:true
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        masterController.ui_navigation.goCreateSettings()()
                    }
                }
            }

            Rectangle{
                id:logout
                height: 160
                width:root.largescreensize
                color: "#1B4166"
                radius: 4

                Text{
                    id:txtlogout
                    anchors.left: parent.left
                    anchors.margins:90
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Logout")
                    font.pointSize: 18
                    color: "white"
                    font.bold:true
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                      masterController.ui_navigation.goCreateLoginView();
                    }
                }
            }

            Rectangle{
                id:quit
                height: 160
                width:root.largescreensize
                color: "#1B4166"
                radius: 4
                Text{
                    id:txtquit
                    anchors.left: parent.left
                    anchors.margins:90
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("close")
                    font.pointSize: 18
                    color: "white"
                    font.bold:true
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                      Qt.quit();
                    }
                }
            }
        }}

}

