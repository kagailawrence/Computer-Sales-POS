import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


Item {

    Rectangle{
        id:field_id
        anchors.fill: parent

        Rectangle{
            id:name_id
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top:parent.top
            height: 50
            Column{
                anchors.fill: parent
                spacing:2
                Label{
                    id:price_lblid
                    font.pixelSize: 15
                    anchors{
                        left: parent.left
                        right:parent.right
                    }
                    anchors.leftMargin:field_id.width/20
                    anchors.rightMargin:field_id.width/20
                    text: "Item Name"
                }
                TextField{
                    id:nametxt
                    text:""
                    anchors{
                        left: parent.left
                        right:parent.right
                    }
                    anchors.leftMargin:field_id.width/20
                    anchors.rightMargin:field_id.width/20
                    placeholderText: "Item Name"
                }

            }
        }
        ComboBox{
            id:category_id
            height: 40
            model: masterController.ui_data_array
            anchors{
                left: parent.left
                right: parent.right
                top: name_id.bottom
                topMargin: 20
                leftMargin: field_id.width/20
                rightMargin: field_id.width/20
            }


        }

        Rectangle{
            id:price_id
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top:category_id.bottom
            anchors.topMargin: 20
            height: 50
            Column{
                anchors.fill: parent
                spacing:2
                Label{
                    id:name_lblid
                    font.pixelSize: 15
                    anchors{
                        left: parent.left
                        right:parent.right
                    }
                    anchors.leftMargin:field_id.width/20
                    anchors.rightMargin:field_id.width/20
                    text: "Price"
                }
                TextField{
                    id:pricetxt
                    text: ""
                    anchors{
                        left: parent.left
                        right:parent.right
                    }
                    anchors.leftMargin:field_id.width/20
                    anchors.rightMargin:field_id.width/20
                    placeholderText: "Price"
                }

            }
        }

        Rectangle{
            id:quantity_id
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top:price_id.bottom
            anchors.topMargin: 20
            height: 50
            Column{
                anchors.fill: parent
                spacing:2
                Label{
                    id:quantity_lblid
                    font.pixelSize: 15
                    anchors{
                        left: parent.left
                        right:parent.right
                    }
                    anchors.leftMargin:field_id.width/20
                    anchors.rightMargin:field_id.width/20
                    text: "Item Quantity"
                }
                TextField{
                    id:quantitytxt
                    text: ""
                    anchors{
                        left: parent.left
                        right:parent.right
                    }
                    anchors.leftMargin:field_id.width/20
                    anchors.rightMargin:field_id.width/20
                    placeholderText: "Item's Quantity"
                }

            }
        }


        Item{
            id:btnframe_id
            height: 100
            anchors{
                left: parent.left
                right: parent.right
                top:quantity_id.bottom
                topMargin:100
                leftMargin: field_id.width/20
                rightMargin: field_id.width/20
            }

            Row{
                anchors.centerIn: parent
                spacing: btnframe_id.width/2-newitem_id.width
                Button{
                    id:newitem_id

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
                            border.color: "#17a2b8"
                            radius: 4


                            gradient: Gradient {
                                GradientStop { position: 0 ; color: control.pressed ? "#138496" : "#17a2b8" }
                                GradientStop { position: 1 ; color: control.pressed ? "#138496" : "#17a2b8" }
                            }
                        }
                    }
                }
                Button{
                    id:submit_id

                    Text{
                        anchors.centerIn: parent
                        color: 'white'
                        text:  "Submit Item"
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
                        additem_dialog_id.close()
                        // name, const QString category, const int quantity, const int price
                        masterController.onAdd_items(nametxt.text,category_id.currentText,quantitytxt.text,pricetxt.text);
                        nametxt.text=""
                        quantitytxt.text=""
                        pricetxt.text=""

                    }
                }

            }

        }
    }


}
