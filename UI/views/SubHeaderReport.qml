import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
    id:headerroot
    property alias root_id: headerroot.myid
    property string myid
    Frame{
        id:fram_id
        anchors.fill: parent
        background: Rectangle{
           border.color: 'transparent'
        }

        Rectangle{
            id:serch_id
            border.color:'green'
            radius: 4
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.rightMargin: 10
            width:200
            height: parent.height

            focus: true
            TextInput{
                id:serch_text
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 5
                text: ""
                focus: true
                cursorVisible: true

                onTextChanged: {
                     masterController.onSearch(headerroot.myid,serch_text.text)

                }
            }

        }
        ComboBox{
            id:days_id
            model: ["month","Todays"]
            anchors{
                left: serch_id.right
                leftMargin: 10
            }
            height: parent.height
            width: 200
            onCurrentIndexChanged: {
                masterController.onSearchChanged(days_id.currentText)
                console.log(days_id.currentText)
            }
        }

            ComboBox{
               id:print_report_id
                model:["--Print--","Sales","Return","Most sold"]
                implicitWidth: 90
                implicitHeight: 30
                anchors{
                    right: parent.right
                    rightMargin: 20

                }
                style: ComboBoxStyle{
                    background:Rectangle{
                        color:"skyblue"
                        radius: 5
                    }
                    textColor: 'black'
                    font.bold: true
                }
                onCurrentIndexChanged: {
                    const cur=print_report_id.currentText
                    print_report_id.currentIndex=0
                    console.log("Selected one=> "+cur)
                }
            }
            ComboBox{
               id:export_id
                model:["--Export--","Sales","Return","Most sold"]
                anchors{
                    right: print_report_id.left
                    rightMargin: 20

                }
                implicitWidth: 90
                implicitHeight: 30
                style: ComboBoxStyle{
                    background:Rectangle{
                        color:"skyblue"
                        radius: 5
                    }
                    textColor: 'black'
                    font.bold: true
                }
                onCurrentIndexChanged: {
                    const cur=export_id.currentText
                    export_id.currentIndex=0
                    console.log("Selected one=> "+cur)
                }
            }
    }

}
