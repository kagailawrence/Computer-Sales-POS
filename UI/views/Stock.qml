import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.2
import Lib 1.0

Item {
    id:root
    property string category:''
    Button{
        x:5
        y:5
        iconSource:'./images/home.PNG'
        onClicked: {
            masterController.ui_navigation.goCreatedashboardView()
        }
    }
    Item{
        id:add_id
        height: 50
        anchors{
            left: parent.left
            right: parent.right
            top: parent.top
            leftMargin:root.width/60
            rightMargin: root.width/60
            topMargin: 20
        }
        Row{
            spacing: 10
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin:parent.width/20

            Button{
                id:addcatelogy_id
                Text{
                    anchors.centerIn: parent
                    color: 'white'
                    text: "New Category"
                    font.bold: true
                }
                style: ButtonStyle {

                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 30
                        border.width: control.activeFocus ? 2 : 1
                        border.color: "#117a8b"
                        radius: 4
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: control.pressed ? "#138496" : "#17a2b8" }
                            GradientStop { position: 1 ; color: control.pressed ? "#138496" : "#17a2b8" }
                        }
                    }
                }
                onClicked: {
                    addcategoly_dialog_id.open()
                }
            }
            Button{
                id:additem_id
                Text{
                    anchors.centerIn: parent
                    color: 'white'
                    text: "New Item"
                    font.bold: true
                }
                style: ButtonStyle {

                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 30
                        border.width: control.activeFocus ? 2 : 1
                        border.color: "#117a8b"
                        radius: 4
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: control.pressed ? "#138496" : "#17a2b8" }
                            GradientStop { position: 1 ; color: control.pressed ? "#138496" : "#17a2b8" }
                        }
                    }
                }
                onClicked: {
                    additem_dialog_id.open()
                }
            }
            Button{
                id:importitem_id

                Text{
                    anchors.centerIn: parent
                    color: 'white'
                    text: "CSV import"
                    font.bold: true
                }
                style: ButtonStyle {

                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 30
                        border.width: control.activeFocus ? 2 : 1
                        border.color: "#888"
                        radius: 4
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: control.pressed ? "#138496" : "#17a2b8" }
                            GradientStop { position: 1 ; color: control.pressed ? "#138496" : "#17a2b8" }
                        }
                    }
                }
                onClicked: {
                    fileDialog.open()
                }
            }


        }
    }

    Frame{
        id:search_id
        height: 50
        anchors{
            left: parent.left
            right: parent.right
            top: add_id.bottom
            leftMargin:root.width/60
            rightMargin: root.width/60
            bottomMargin: 20
        }


        Rectangle{
            id:serch_id
            border.color:'gray'
            radius: 4
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: export_id.left
            anchors.rightMargin: 10
            width: 200
            height: 30
            focus: true
            TextInput{
                id:serch_text
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.right: parent.right
                text: ""
                focus: true
                font.bold: true
                cursorVisible: true
                onTextChanged: {
                    masterController.onStock_search(serch_text.text)
                    returnstable.model=masterController.ui_Stocks
                }


            }

        }
        Button{
            id:export_id
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin:parent.width/30

            Text{
                anchors.centerIn: parent
                color: 'white'
                text: "CSV export"
                font.bold: true
            }
            style: ButtonStyle {
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 30
                    border.width: control.activeFocus ? 2 : 1
                    border.color: "#888"
                    radius: 4
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: control.pressed ? "#138496" : "#17a2b8" }
                        GradientStop { position: 1 ; color: control.pressed ? "#138496" : "#17a2b8" }
                    }
                }
            }
            onClicked: {
                masterController.onExport_to_csv("category","")
            }

        }

    }

    Frame{
        id:table_id
        property int col:5
        anchors{
            left: parent.left
            right: parent.right
            top: search_id.bottom
            leftMargin:root.width/60
            rightMargin: root.width/60
            bottom: parent.bottom
            bottomMargin:root.height/60
            topMargin:5 }
            TableView{
                id:returnstable
                anchors.fill: parent
                TableViewColumn{
                    role:'id'
                    title: "ReciteNo"
                    width: table_id.width/table_id.col
                }
                TableViewColumn{
                    role:'name'
                    title: "item Name"
                    width: table_id.width/table_id.col
                }
                TableViewColumn{
                    role:'amount'
                    title: "Amount if items"
                    width: table_id.width/table_id.col
                }
                TableViewColumn{
                    role:'price'
                    title: "Cost per Item"
                    width: table_id.width/table_id.col
                }

                TableViewColumn{
                    role:'category'
                    title: "Item Category"
                    width: table_id.width/table_id.col
                }
                model:masterController.ui_Stocks
            }


    }
    FileDialog {
        id: fileDialog
        title: "Please choose a file"

        onAccepted: {
            masterController.onImport("stock",fileUrl)
        }
        onRejected: {
            console.log("Canceled")

        }

    }
    Dialog{
        id:additem_dialog_id
        modality:Qt.WindowModal
        title: "Add Item"

        contentItem: Rectangle{
            implicitHeight: root.height/1.5
            implicitWidth: root.width/3
            IAdditem{
                anchors.fill: parent
            }
        }

    }
    Dialog{
        id:addcategoly_dialog_id
        modality:Qt.WindowModal
        title: "Add Category"
        contentItem:Frame{
            anchors.margins: 50
            implicitHeight:  root.height/2
          implicitWidth: root.width/4
          padding:20

         Column{
             spacing: 20
             anchors.fill: parent
             Column{
                 spacing: 5
                 height: parent.width/2
                 width: parent.width
                 Label{
                     text: "Enter Category"
                    width: parent.width
                    height:20

                 }
                 TextField{
                     id:categorytxt
                     focus: true
                     text: ""
                     onTextChanged:root.category=categorytxt.text
                      width: parent.width
                      height: 40

                 }
             }
           Row{
               spacing:parent.width-(submit_id.width*2)
               Button{
                   id:submit_id
                   Text{
                       anchors.centerIn: parent
                       color: 'white'
                       text:  "Discard "
                       font.bold: true
                   }
                   style: ButtonStyle {

                       background: Rectangle {
                           implicitWidth: 100
                           implicitHeight: 30
                           border.width: control.activeFocus ? 2 : 1
                           border.color: "#28a745"
                           radius: 4
                           gradient: Gradient {
                               GradientStop { position: 0 ; color: control.pressed ?"#20bb44" : "#28a745" }
                               GradientStop { position: 1 ; color: control.pressed ?"#20bb44" : "#28a745" }
                           }
                       }
                   }
                   onClicked: {

                       categorytxt.text="";
                       addcategoly_dialog_id.close()
                   }
               }
               Button{

                   Text{
                       anchors.centerIn: parent
                       color: 'white'
                       text:  "Submit"
                       font.bold: true
                   }
                   style: ButtonStyle {

                       background: Rectangle {
                           implicitWidth: 100
                           implicitHeight: 30
                           border.width: control.activeFocus ? 2 : 1
                           border.color: "#28a745"
                           radius: 4
                           gradient: Gradient {
                               GradientStop { position: 0 ; color: control.pressed ?"#20bb44" : "#28a745" }
                               GradientStop { position: 1 ; color: control.pressed ?"#20bb44" : "#28a745" }
                           }
                       }
                   }
                   onClicked: {
                      console.log(root.category.toString())
                       masterController.onAddcategry(root.category.toString())
                       addcategoly_dialog_id.close()
                       categorytxt.text="";

                   }
               }
           }
         }
        }

    }

}
