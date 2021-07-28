import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Lib 1.0
ApplicationWindow {
    id:root
    visible: true
    width:1920
    height:1080
    color: '#999999'
Mastercontroller{
    id:masterController
}

    title: masterController.ui_title
    menuBar:MenuBar{
        id: menuBar
        Menu {
            id: help
            title: qsTr("Help")
        }
        Menu {
            id:about
            title: qsTr("About")
             MenuItem{
                text: "built with QT"
                onTriggered: bultbyqt.open()
            }
        }

    }
    Connections{
        target:masterController.ui_navigation
        onGoCreatedashboardView:mainview.replace("Dashboard.qml", StackView.Immediate)
        onGoCreateLoginView:mainview.replace("Login.qml", StackView.Immediate)
        onGoCreateSettings:mainview.replace("Settings.qml", StackView.Immediate)
        onGoCreateSales:mainview.replace("Sales.qml", StackView.Immediate)
        onGoCreateReport:mainview.replace("Report.qml", StackView.Immediate)
        onGoCreateStock:mainview.replace("Stock.qml", StackView.Immediate)


    }
    StackView{
        id:mainview
        anchors.fill: parent
        initialItem: Qt.resolvedUrl("Dashboard.qml")
    }
}
