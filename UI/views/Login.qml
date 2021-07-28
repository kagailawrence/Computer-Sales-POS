import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Lib 1.0
import "Clock"

Item {
    id: name



        Rectangle{
            id:rectroot
            anchors.fill: parent
            Clock{
                id:id_root
            }
            Image {
                id: myimg
                source: "../images/hotel.png"
                anchors.fill: parent
                height: 200
                width:rectroot.width/2+10
                Label{
                    anchors.right: parent.right
                    anchors.topMargin: 100
                    anchors.top: parent.top
                    anchors.rightMargin: 100
                    text:Qt.formatTime(id_root.currentDate,"h:m.s ap")
                    color:"Black"
                    font.pixelSize:16
                }
            }
            }
            Column{
                id:columnid
                spacing: 10
                y:rectroot.height/3.5
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width/4
                Label {
                    color: "#565758"
                    text: "User Name   "
                    anchors.left: parent.left
                    font.pixelSize: 14
                    font.italic: true
                }
                TextField {
                    id:usernametxt
                    width: parent.width
                    focus: true
                    placeholderText: "User Name..."
                    KeyNavigation.backtab:passwordtxt
                    Keys.onEnterPressed:passwordtxt

                }
                Label {
                    color: "#565758"
                    text: "Password "
                    anchors.left: parent.left
                    font.italic: true
                    font.pixelSize: 14
                }
                TextField {
                    id: passwordtxt
                    width: parent.width
                    focus: true

                    echoMode: TextInput.Password
                    placeholderText: "Enter Password..."
                    inputMethodHints: Qt.ImhNoAutoUppercase | Qt.ImhPreferLowercase | Qt.ImhSensitiveData | Qt.ImhNoPredictiveText
                    onAccepted: enterbtn.activeFocus
                    KeyNavigation.backtab: usernametxt
                    Keys.onEnterPressed:enterbtn
                }

                RowLayout {
                    id:buttons
                    spacing: 5
                    Button {
                        id:enterbtn
                        text: "Login "
                        focus: true
                        contentItem: Text {
                            text: enterbtn.text
                            font: enterbtn.font
                            opacity: enabled ? 1.0 : 0.3
                            color: enterbtn.down ? "#17a81a" : "#21be2b"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                        background: Rectangle{
                            implicitHeight: 30
                            implicitWidth: columnid.width/2
                            opacity: enabled ? 1 : 0.7
                            border.color: enterbtn.down ? "#17a81a" : "#21be2b"
                            border.width: 1
                            radius: 4
                        }
                        onClicked: {
                            masterController.onLogin(usernametxt.text.toLowerCase(),passwordtxt.text.toLowerCase())
                            passwordtxt.clear()
                            usernametxt.clear()
                        }
                    }
                    Button {
                        id:clockbtn
                        text: "Clear"
                        focus: true
                        onClicked: {
                            passwordtxt.clear()
                            usernametxt.clear()
                        }
                        contentItem: Text {
                            text: clockbtn.text
                            font: clockbtn.font
                            opacity: enabled ? 1.0 : 0.7
                            color: clockbtn.down ? "#17a81a" : "#21be2b"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                        background: Rectangle{
                            implicitHeight: 30
                            implicitWidth: columnid.width/2
                            opacity: enabled ? 1 : 0.3
                            border.color: clockbtn.down ? "#17a81a" : "#21be2b"
                            border.width: 1
                            radius: 4
                        }
                    }

}
}
}


