import QtQuick 2.14
import QtQuick.Controls 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
Item {
    id:root
    property string com_logo:"C:\Users\Admin\Downloads\test.png"
    Button{
        x:5
        y:5
        text: "Home"
        onClicked: {
            masterController.ui_navigation.goCreatedashboardView()
        }
    }
    Item{
        id: name
        anchors.fill: parent


        TabView {
            id: frame
            anchors.fill: parent
            anchors.margins: 4
            anchors.topMargin: 30
            /*
               company name {label,input }

               company logo
               company address

               mobile number
               email
               return policy
            */

            //the information part
            Tab {
                title: "Information "
                Item
                {
                    anchors.fill: parent
                    Frame{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.margins: parent.width/60
                        width: parent.width/4
                        Label{
                            id:comp_name_id
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            height: 20
                            text: "Company Name:"

                        }
                        TextField{
                            id:txtcompany_name
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: comp_name_id.bottom
                            height: 30

                        }
                        //company logo

                        Item {
                            id: logo_root
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: txtcompany_name.bottom
                            anchors.topMargin: 10
                            height: 200

                            Label{
                                id:lblname
                                text: "Company Logo"

                            }
                            Frame{
                                id:rctlogo
                                anchors.top:lblname.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                                width: parent.width/1.5
                                height: 100

                                Image{
                                    anchors.fill: parent

                                    source:"/test.png"

                                }

                            }
                            Row{
                                spacing: 10
                                anchors.top:rctlogo.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.topMargin: parent.height/10
                                Button{
                                    id:change_id
                                    text: "Change Logo"
                                }
                                Button{
                                    text: "Remove Logo"
                                    onClicked: {
                                        root.com_logo=""
                                    }
                                }
                            }

                        }

                        //address

                        Label{
                            id:comp_address_id
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: logo_root.bottom
                            height: 20
                            text: "Company Address:"

                        }
                        TextField{
                            id:txtaddress
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: comp_address_id.bottom
                            height: 30

                        }
                        //number


                        Label{
                            id:comp_number_id
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: txtaddress.bottom
                            height: 20
                            text: "Company Number:"

                        }
                        TextField{
                            id:txtnumber
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: comp_number_id.bottom
                            height: 30

                        }

                        //  email
                        Label{
                            id:comp_email_id
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: txtnumber.bottom
                            height: 20
                            text: "Company Email:"

                        }
                        TextField{
                            id:txtemail
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: comp_email_id.bottom
                            height: 30

                        }


                        //policy
                        Label{
                            id:comp_policy_id
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: txtemail.bottom
                            height: 20
                            text: "Return Policy:"

                        }
                        TextField{
                            id:txtpolicy
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: comp_policy_id.bottom
                            height: 30

                        }
                        Row{
                            id:btn_info_id
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: txtpolicy.bottom
                            anchors.margins: parent.width/20
                            height: 30
                            spacing: parent.width/2-(discard_id.width*2)
                            Button{
                                id:discard_id
                                text: "Discard"
                            }
                            Button{
                                text: "Save"
                            }

                        }



                    }

                }

            }
            //color of the sysyem
            /*

                home page color
                home page image

                default color

              */
            Tab { title: "Themes"
                Item
                {
                    anchors.fill: parent
                    Frame
                    {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.margins: parent.width/60
                        width: parent.width/4


                    }
                }

            }
            /*
                export database
                backup
            */
            Tab { title: "Database"

                Item
                {
                    anchors.fill: parent
                    Frame
                    {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.margins: parent.width/60
                        width: parent.width/4
                        Column{
                            spacing: 50
                            Column{
                                spacing: 10
                                Row{
                                    Label{
                                        text: "DataBase Name :"

                                    }
                                    TextField{
                                        id:input
                                    }

                            }
                                Button{
                                    text:"Save"
                                }
                            }
                            Button{
                                text: "BackUP database"
                            }
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
