import QtQuick 2.14
import QtQuick.Controls 2.5
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import Lib 1.0

Item {
    id: rootreport
    Button{
        x:5
        y:5
        text: "Home"
        onClicked: {
            masterController.ui_navigation.goCreatedashboardView()
        }
    }


    Item{
        id: root_sale_id
        anchors.fill: parent
        property int col:7
        TabView {
            id: frame
            anchors.fill: parent
            anchors.margins: 4
            anchors.topMargin: 30
            Tab {
                title: "Sales "
                Rectangle{
                    id:sales_id
                    anchors.fill:parent
                    anchors{
                        leftMargin:parent.width/60
                        rightMargin:parent.width/60
                        topMargin: parent.height/60

                    }

                    SubHeaderReport{
                        id:subh_sales
                        height: 50
                        width: parent.width
                            root_id: "sales"
                    }
                    Rectangle {
                        id:sales_tabler_id
                        color: "black"
                        anchors.top: subh_sales.bottom;
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: parent.height/60
                        TableView{
                            id:salestable
                            anchors.fill: parent
                            model:masterController.ui_Sales
                            TableViewColumn{
                                role:'id'
                                title: "ReciteNo"
                                width: sales_tabler_id.width/root_sale_id.col
                            }
                            TableViewColumn{
                                role:'name'
                                title: "item Name"
                                width: sales_tabler_id.width/root_sale_id.col
                            }
                            TableViewColumn{
                                role:'category'
                                title: "Item Category"
                                width: sales_tabler_id.width/root_sale_id.col
                            }
                            TableViewColumn{
                                role:'cost'
                                title: "Cost per Item"
                                width: sales_tabler_id.width/root_sale_id.col
                            }

                            TableViewColumn{
                                role:'quantity'
                                title: "quantity"
                                width: sales_tabler_id.width/root_sale_id.col
                            }
                            TableViewColumn{
                                role:'total'
                                title: "Total Amount"
                                width:sales_tabler_id.width/root_sale_id.col
                            }
                            TableViewColumn{
                                role:'date'
                                title: "Date Of Sale"
                                width:sales_tabler_id.width/root_sale_id.col
                            }

                        }

                    }
                }
            }
            Tab { title: "Returns"
                Rectangle{
                    id:returns_id
                    anchors.fill:parent
                    anchors{
                        leftMargin:parent.width/60
                        rightMargin:parent.width/60
                        topMargin: parent.height/60
                    }

                    SubHeaderReport{
                        id:subh_returns
                        height: 50
                        width: parent.width
                         root_id: "returns"
                    }
                    Rectangle {
                        id:returns_tabler_id

                        anchors.top: subh_returns.bottom;
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: parent.height/60
                        TableView{
                            id:returnstable
                            anchors.fill: parent
                            TableViewColumn{
                                role:'id'
                                title: "ReciteNo"
                                width: returns_id.width/root_sale_id.col
                            }
                            TableViewColumn{
                                role:'name'
                                title: "item Name"
                                width: returns_id.width/root_sale_id.col
                            }
                            TableViewColumn{
                                role:'category'
                                title: "Item Category"
                                width: returns_id.width/root_sale_id.col
                            }
                            TableViewColumn{
                                role:'cost'
                                title: "Cost per Item"
                                width: returns_id.width/root_sale_id.col
                            }

                            TableViewColumn{
                                role:'quantity'
                                title: "quantity"
                                width: returns_id.width/root_sale_id.col
                            }
                            TableViewColumn{
                                role:'total'
                                title: "Total Amount"
                                width:returns_id.width/root_sale_id.col
                            }
                            TableViewColumn{
                                role:'date'
                                title: "Date Of return"
                                width:returns_id.width/root_sale_id.col
                            }
                            model:masterController.ui_Returns
                        }

                    }
                }
            }
            Tab { title: "Most Sold"
                Rectangle{
                    id:mostsold_id
                    anchors.fill:parent
                    anchors{
                        leftMargin:parent.width/60
                        rightMargin:parent.width/60
                        topMargin: parent.height/60
                    }
                    SubHeaderReport{
                        id:mostsold_header_id
                        height: 50
                        width: parent.width
                          root_id: "most sold"
                    }
                    Rectangle {
                        id:stdsold_tabler_id

                        anchors.top: mostsold_header_id.bottom;
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: parent.height/60
                        TableView{
                            id:mstdsoldstable
                            anchors.fill: parent
                            TableViewColumn{
                                role:'id'
                                title: "ReciteNo"
                                width: stdsold_tabler_id.width/root_sale_id.col
                            }
                            TableViewColumn{
                                role:'name'
                                title: "item Name"
                                width: stdsold_tabler_id.width/root_sale_id.col
                            }
                            TableViewColumn{
                                role:'category'
                                title: "Item Category"
                                width: stdsold_tabler_id.width/root_sale_id.col
                            }
                            TableViewColumn{
                                role:'cost'
                                title: "Cost per Item"
                                width: stdsold_tabler_id.width/root_sale_id.col
                            }

                            TableViewColumn{
                                role:'quantity'
                                title: "quantity"
                                width: stdsold_tabler_id.width/root_sale_id.col
                            }
                            TableViewColumn{
                                role:'total'
                                title: "Total Amount"
                                width:stdsold_tabler_id.width/root_sale_id.col
                            }
                            TableViewColumn{
                                role:'date'
                                title: "Date Of Sale"
                                width:stdsold_tabler_id.width/root_sale_id.col
                            }
                            model:masterController.ui_MostSold
                        }

                    }
                }
            }

            style: TabViewStyle {
                frameOverlap: 1
                tabsAlignment : Qt.AlignHCenter
                tabsMovable:false
                tab: Rectangle {
                    color: "transparent"
                    border.color:  "transparent"
                    implicitWidth: Math.max(text.width + 4, 80)
                    implicitHeight: 30


                    radius: 4
                    Text {
                        id: text
                        font.pixelSize: 16
                        anchors.centerIn: parent
                        text: styleData.title
                        color: styleData.selected ? "white" : "#20c997"
                    }
                }
                frame: Rectangle { }
            }
        }
    }


}
