import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls 1.4

Item {
    id: root_recite
    anchors.fill: parent
   property alias phone_number:customerPhonetxt.text
    property alias customer_name:customernametxt.text
    property alias totalcost:totalCost_id.text
//   property alias item_number:0
    property alias rendard_amount:rendered_id.text
    property alias change:change_id.text
    property date currentDate: new Date()

    Frame{
        id:printitem
        anchors.fill: parent
        rightPadding: parent.width/5
        background: Rectangle{
            border.color: 'transparent'
        }
        Item {
            id: header_id
            anchors.top: parent.top
            anchors.topMargin: parent.height/40
            anchors.horizontalCenter: parent.horizontalCenter

            Label{
                id:lblcompany_name
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                font.bold: true
                text: "BRIGHT TECHNOLOGY"
                font.pixelSize: 18
            }
            Label{
                id:lblstreet_name
                anchors.top: lblcompany_name.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                font.bold: true
                text: "Kimathi Street"
                font.pixelSize: 14
            }
            Label{
                id:lbltype_name
                anchors.top: lblstreet_name.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                font.bold: true
                text: "Sales RECITE"
                font.pixelSize: 12
                anchors.topMargin:printitem.height/60
            }

            Row{
                spacing: 20
                anchors.top:lbltype_name.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                Label{
                    id:customernametxt
                    text:"customer name"
                    font.pixelSize: 12
                    font.bold: true

                }
                Label{
                    id:date_id

                    font.bold: true
                    text: root_recite.currentDate.toLocaleDateString(locale, Locale.ShortFormat)+'  '+ root_recite.currentDate.toLocaleTimeString(locale, Locale.ShortFormat)
                    font.pixelSize: 12
                    anchors.topMargin:printitem.height/60
                }

                Label{
                    id:customerPhonetxt
                    text:"phone number"
                    font.pixelSize: 12
                    font.bold: true

                }

            }

        }
        Rectangle{
            id:top_border
            anchors.top: header_id.bottom
            anchors.topMargin:printitem.height/40+(4*lblcompany_name.height)+10
            width:printitem.width
            height: 2
            border.color: 'gray'
            border.width: 2
        }
        Item {
            id: table_id
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: top_border.bottom
            height:24*view_.count
            anchors.topMargin: parent.height/60
            anchors.bottomMargin: parent.height/7
            anchors.leftMargin: parent.width/3

            Rectangle{
                width: printitem.width
                height:10*view_.count+10
                ListView{
                    id:view_header
                    anchors{
                        top: parent.top
                        left: parent.left
                        right: parent.right
                    }
                    height:20
                    model:1
                    delegate: delegatetitle
                    clip: true

                }
                ListView{
                    id:view_
                    anchors{
                        top: view_header.bottom
                        left: parent.left
                        right: parent.right
                    }
                    height:view_.count*20
                    model:masterController.ui_Cart
                    delegate: delegate
                    clip: true

                }

            }

        }
        Component{
            id:delegate
            Rectangle{
                height:20
                width: parent.width
                Row{
                    anchors.fill: parent
                    spacing:parent.width/16
                    Text {
                        text: qsTr(model.name)
                        width: 50
                    }
                    Text {

                        text:model.cost
                        width: 50
                    }
                    Text {

                        text:model.quantity
                        width: 50
                    }
                    Text {

                        text:model.total
                    }
                }
            }
        }
        Component{
            id:delegatetitle
            Rectangle{
                height:25
                width: parent.width
                Row{
                    anchors.fill: parent
                    spacing: parent.width/16
                    Text {
                        width: 50
                        font.bold: true
                        font.pixelSize: 14
                        font.family: 'Times New Roman'
                        text: qsTr("Item Name")
                    }
                    Text {
                        width: 50
                        font.bold: true
                        font.pixelSize: 14
                        font.family: 'Times New Roman'

                        text: qsTr("item Cost")
                    }
                    Text {
                        font.bold: true
                        font.pixelSize: 14
                        font.family: 'Times New Roman'
                        text: qsTr("item Quantity")
                        width: 50
                    }
                    Text {
                        font.bold: true
                        font.pixelSize: 14
                        font.family: 'Times New Roman'
                        text: qsTr("Total Cost")
                        width: 50
                    }
                }
            }
        }
        Rectangle{
            id:footer_border
            anchors.top: table_id.bottom
            anchors.topMargin:parent.height/70
            width:printitem.width
            height: 2
            border.color: 'gray'
            border.width: 2
        }
        Item {
            id: total_id
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: footer_border.bottom
            height: parent.height/16
            anchors.leftMargin: parent.width/2
            anchors.topMargin: parent.height/60
            Column{
                spacing: 5
              Row{
                  Label{
                      text: "GRAND TOTAL: "
                      font.bold: true
                      font.pixelSize: 14
                      font.family: 'Times New Roman'
                  }
                  Label{
                      id:totalCost_id
                      text: ""
                      font.bold: true
                      font.pixelSize: 14
                      font.family: 'Times New Roman'
                  }
              }
               Row{
                   Label{
                       text: "Cash:  "
                       font.bold: true
                       font.pixelSize: 14
                       font.family: 'Times New Roman'
                   }

                   Label{
                       id:rendered_id
                       text:""
                       font.bold: true
                       font.pixelSize: 14
                       font.family: 'Times New Roman'
                   }
               }
                Row{
                    Label{
                        text: "CHANGE:  "
                        font.bold: true
                        font.pixelSize: 14
                        font.family: 'Times New Roman'
                    }
                    Label{
                        id:change_id
                        text: ""
                        font.bold: true
                        font.pixelSize: 14
                        font.family: 'Times New Roman'
                    }
                }

            }
        }
    }

}
