import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.2

Item {
    id:root
    //the layer for back home
    Button{
        x:5
        y:5
        text: "Home"
        onClicked: {
            masterController.ui_navigation.goCreatedashboardView()
        }
    }
    property bool selectCat: false
    Item{
        id:topid
        property int change:0
        property int totalcost:masterController.ui_Cart.ui_Grandtotal
        property int amount: masterController.ui_Cart.ui_Amount
        property int col:5

        anchors.top: parent.top;
        anchors.left: parent.left
        anchors.right: salep_id.left
        anchors.bottom: parent.bottom
        anchors.leftMargin:10
        anchors.rightMargin: 10
        anchors.topMargin:40
        height: 200
        Frame{
            id:rootcategory_id
            anchors.top: parent.top;
            anchors.left: parent.left
            anchors.right: parent.right
            padding:20
            // height: parent.height/8
            background:Rectangle {
                color: "gray"
            }

            Row{
                spacing: 50
                Label{
                    text: "Search Product"
                    font.bold: true
                    font.pixelSize: 13
                }
                Rectangle{
                    id:serch_id
                    width: 250
                    height: 30
                    TextInput{
                        id:serch_text
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.right: parent.right
                        text: ""
                        font.bold: true
                        cursorVisible: true
                        onTextChanged: {
                            if(serch_text.text!==''){
                                root.selectCat=true
                                masterController.onAddtoCart(serch_text.text)
                                selectmodel.model=''
                                selectmodel.model=masterController.ui_Search_Stock_to_Cart
                            }
                            else{
                                root.selectCat=false
                                serch_text.text=''
                                selectmodel.model=''
                                selectmodel.model=masterController.ui_Search_Stock_to_Cart


                            }
                        }


                    }

                }
                ComboBox{
                    id:type_receit_id
                    model:["Sales Receipt","Return Receipt"]
                    implicitWidth: 130
                    implicitHeight: 30
                    style: ComboBoxStyle{
                        background:Rectangle{
                            color:"skyblue"
                            radius: 5
                        }
                        textColor: 'black'
                        font.bold: true
                    }
                }

                Button{
                    id:add_btn
                    text: "Add Items"
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

                    onClicked: {
                        additem_dialog_id.open()
                    }
                }
//                Button{
//                    id:suspend_btn
//                    text: "Suspended Items"
//                    style: ButtonStyle {
//                        background: Rectangle {
//                            implicitWidth: 100
//                            implicitHeight: 30
//                            border.width: control.activeFocus ? 2 : 1
//                            border.color: "#17a2b8"
//                            radius: 4
//                            gradient: Gradient {
//                                GradientStop { position: 0 ; color: control.pressed ? "#138496" : "#17a2b8" }
//                                GradientStop { position: 1 ; color: control.pressed ? "#138496" : "#17a2b8" }
//                            }
//                        }
//                    }
//                    onClicked: {
//                        suspendeditem_dialog_id.open()
//                    }
//                }
            }
        }
        ListView{
            id:selectmodel
            visible: root.selectCat
            x:serch_id.x+serch_id.width/12
            y:serch_id.y+60
            width: serch_id.width;height:serch_id.height*selectmodel.count
            model:masterController.ui_Search_Stock_to_Cart
            delegate:delegateid
        }
        Component{
            id:delegateid
            Rectangle {
                id:comRect
                height:serch_id.height
                width:serch_id.width
                radius: 5
                Text {
                    anchors.fill: parent
                    anchors.leftMargin: 20
                    font.pixelSize: 16
                    text: qsTr(model.name)
                }
                MouseArea{
                    id:mousearea_id
                    anchors.fill: parent
                    onClicked: {
                        root.selectCat=false
                        masterController.onPush_To_cart(model.id,model.name,model.category,model.quantity,model.cost,model.total,model.date)
                      serch_text.text=''
                      selectmodel.model=''
                          reload()

                    }
                }

            }

        }

        Item{
            id:stock_id
            height: parent.height-rootcategory_id.height-50
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            TableView{
                id:salestable
                anchors.fill: parent

                TableViewColumn{

                    delegate: Rectangle{
                        height: 30
                        width:10
                        radius: 10
                        focus: true
                        Text {
                            anchors.centerIn: parent
                            text: "X"
                            font.bold: true
                            font.pixelSize: 12
                        }

                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                masterController.onRemoveRow(model.id)
                            }
                        }
                    }
                    width:40
                }
                TableViewColumn{
                    role:'name'
                    title: "Item Name"
                    width: salestable.width/topid.col

                }
                TableViewColumn{
                    role:'category'
                    title: "Item Category"
                    width: salestable.width/topid.col
                }
                TableViewColumn{
                    role:'cost'
                    title: "Cost per Item"
                    width: salestable.width/topid.col
                }

                TableViewColumn{
                    id:qntcol
                    role:'quantity'
                    title: "quantity"
                    width: salestable.width/topid.col
                    delegate:TextInput{
                        id:txtr
                        text: model.quantity
                        onTextChanged: {
                            console.log(txtr.parent)
                            if(model.quantity<2 && txtr.text<2){
                            }
                            else{
                                masterController.onQuantityChanged(model.id,txtr.text)
                                console.log(model.id+ " " +model.name)
                                reload()

                            }

                        }
                    }
                }
                TableViewColumn{
                    id:tt_table
                    role:'total'
                    title: "Total Amount"
                    width:salestable.width/topid.col
                }
                model:masterController.ui_Cart
            }
        }
    }
    function reload(){
        salestable.__model=''

        salestable.__model=masterController.ui_Cart
        topid.totalcost=masterController.ui_Cart.ui_Grandtotal
        topid.amount= masterController.ui_Cart.ui_Amount


    }


    Frame{
        id:salep_id
        anchors.top: parent.top;
        anchors.right: parent.right
        anchors.topMargin:parent.height/8.5
        anchors.rightMargin:parent.width/40
        height: parent.height/1.5
        width: parent.width/4-10
        background:Rectangle {
            color: "red"
        }

        Item{
            anchors.fill: parent
            Column{
                id:customername
                spacing: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                Label{
                    width: parent.width
                    text: "Enter Customer Name"
                    font.bold: true
                }
                TextField{
                    id:customernametxt
                    width: parent.width
                    height: 30
                    placeholderText:"Customer Name"
                }

            }
            Column{
                id:customerPhone
                spacing:3
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: customername.bottom
                Label{
                    width: parent.width
                    text: "Enter Customer Name"
                    font.bold: true
                }
                TextField{
                    id:customerPhonetxt
                    width: parent.width
                    height: 30
                    placeholderText: "phone number"
                }

            }

            Text {
                id:totalCost_id
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: customerPhone.bottom
                anchors.topMargin: 30
                anchors.leftMargin:0
                font.bold:true
                font.pixelSize:18
                text: qsTr("Total Cost:  "+topid.totalcost+'.00' )
            }
            Text {
                id:amount_id
                anchors.top: totalCost_id.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.topMargin:30
                anchors.leftMargin:0

                font.bold:true
                font.pixelSize:18
                text: qsTr(" Amout:  "+ topid.amount)
            }


            ComboBox {
                id:cmbpaymentype_id
                anchors.top: amount_id.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 30
                width: 200
                model: [ "Cash", "Mpesa", "Debit card" ]
            }



            Rectangle{
                id:tenderd
                anchors.top: cmbpaymentype_id.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.topMargin: 30
                anchors.margins: 30
                height:40

                Column{
                    spacing:10
                    Label{
                        text:"Amount Tendered "
                        anchors.bottomMargin: 30
                    }

                    TextInput{
                        id:tenderd_id
                        focus: true
                        text: ""
                        width: parent.width
                        font.bold: true
                        // cursorVisible: true
                        onTextChanged: {
                            topid.change=0
                            topid.change=Number(tenderd_id.text)- Number(topid.totalcost)
                        }
                    }
                }

            }
            Label{
                id:change_id
                anchors.top: tenderd.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.topMargin: 30
                anchors.margins: 30
                text: "Change :ksh "+topid.change+'.00'
                font.pixelSize: 20

            }
            Item{
                id:printing_id
                anchors.top: change_id.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 50
                Row{
                    spacing: 10
                    CheckBox{
                        id:print_id
                        onCheckedChanged: {
                            console.log(print_id.checkedState)
                        }
                    }
                    Label{
                        text: "print the receit"
                    }
                }
            }

            Item{
                id:suspend_cancel_id
                anchors.topMargin:30
                anchors.margins: 30
                anchors.top: printing_id.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                Row{
                    spacing: parent.width/2-80
                    Button{
                        text: "Cancel"
                        style: ButtonStyle {
                            background: Rectangle {
                                implicitWidth:80
                                implicitHeight: 30
                                border.width: control.activeFocus ? 2 : 1
                                border.color: "#888"
                                radius: 4
                                gradient: Gradient {
                                    GradientStop { position: 0 ; color: control.pressed ? "#eee" :"red"  }
                                    GradientStop { position: 1 ; color: control.pressed ?  "#ccc":"red" }
                                }
                            }
                        }
                        onClicked: {
                            topid.change=0
                            topid.totalcost=0
                            topid.amount=0
                            tenderd_id.text=''
                            customernametxt.text=''

                        }
                    }


                    Button{
                        text: "Payment"
                        style: ButtonStyle {
                            background: Rectangle {
                                implicitWidth:80
                                implicitHeight: 30
                                border.width: control.activeFocus ? 2 : 1
                                border.color: "gray"
                                radius: 4
                                gradient: Gradient {
                                    GradientStop { position: 0 ; color: control.pressed ?  "#eee": "green" }
                                    GradientStop { position: 1 ; color: control.pressed ?  "#ccc":  "green"}
                                }
                            }
                        }
                        onClicked: {

                            if(print_id.checkedState!==2){
                                receit_dialog_id.open()
                            }
                            var res=_Recite_id.grabToImage(result=>{
                                                               result.saveToFile("C:/Users/Public/Pictures/img.png");
                                                           })
                        }
                    }
                }
//                Button{
//                    anchors{
//                        top: suspend_cancel_id.bottom
//                        topMargin:50
//                    }

//                    text: "PayMent"
//                    style: ButtonStyle {
//                        background: Rectangle {
//                            implicitWidth:200
//                            implicitHeight: 30
//                            border.width: control.activeFocus ? 3 : 2
//                            border.color: "#888"

//                            radius: 4
//                            gradient: Gradient {
//                                GradientStop { position: 0 ; color: control.pressed ? "#eee" :"red"  }
//                                GradientStop { position: 1 ; color: control.pressed ?  "#ccc":"red" }
//                            }
//                        }
//                    }
//                    onClicked: {
//                        submit_to_print()
//                        if(print_id.checkedState!==2){
//                            receit_dialog_id.open()
//                        }
//                        var res=_Recite_id.grabToImage(result=>{
//                                                           result.saveToFile("C:/Users/Public/Pictures/img.png");
//                                                       })

//                    }
//                }


            }


        }

    }
    Dialog{
        id:additem_dialog_id
        modality:Qt.WindowModal
        contentItem: Rectangle{
            implicitHeight: root.height/1.5
            implicitWidth: root.width/3
            IAdditem{
                anchors.fill: parent
            }
        }

    }
    Dialog{
        id:receit_dialog_id
        modality:Qt.WindowModal
        contentItem: Rectangle{
            implicitHeight: root.height/1.5
            implicitWidth: root.width/2
            PrintSale{
                id:print_Recite_id
                anchors{
                    left: parent.left
                    right: parent.right
                    top: parent.top
                }
                height:parent.height-parent.height/4
                change:topid.change
                totalcost:topid.totalcost
                rendard_amount: tenderd_id.text
                customer_name:customernametxt.text
                phone_number:customerPhonetxt.text
            }
            Button{
                text: "PRINT"
                anchors{

                    top: print_Recite_id.bottom

                }
                onClicked: {
                    receit_dialog_id.close()
                }

                style: ButtonStyle {
                    background: Rectangle {
                        implicitWidth:80
                        implicitHeight: 30
                        border.width: control.activeFocus ? 2 : 1
                        border.color: "#888"
                        radius: 4
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: control.pressed ?  "#eee": "green" }
                            GradientStop { position: 1 ; color: control.pressed ?  "#ccc":  "green"}
                        }
                    }
                }

            }
        }

    }
    PrintSale{
        id:_Recite_id
        visible: false
        change:topid.change
        totalcost:topid.totalcost
        rendard_amount: tenderd_id.text
        customer_name:customernametxt.text
        phone_number:customerPhonetxt.text

        //         topid.amount=0



    }
    Dialog{
        id:suspendeditem_dialog_id
        title: "Suspended Items"
        modality:Qt.WindowModal
        contentItem: Rectangle{
            implicitHeight: model_view_id.count*100
            implicitWidth: root.width/1.5
            Rectangle{
                id:header_id
                anchors{
                    left: parent.left
                    right: parent.right
                    top: parent.top

                }
                height: 30
                width: parent.width
                color: 'black'
                Row{
                    spacing: 10
                    Frame{
                        height: 30
                        width: header_id.width/5
                        Text {
                            anchors.centerIn: parent
                            color: "white"
                            font.bold: true
                            font.pixelSize: 14
                            text: qsTr("Document")
                        }
                    }
                    Frame{
                        height: 30
                        width: header_id.width/5
                        Text {
                            anchors.centerIn: parent
                            color: "white"
                            font.bold: true
                            font.pixelSize: 14
                            text: qsTr("Date")
                        }
                    }
                    Frame{
                        height: 30
                        width: header_id.width/5
                        Text {
                            anchors.centerIn: parent
                            color: "white"
                            font.bold: true
                            font.pixelSize: 14
                            text: qsTr("Customer")
                        }
                    }
                    Frame{
                        height: 30
                        width: header_id.width/5
                        Text {
                            anchors.centerIn: parent
                            color: "white"
                            font.bold: true
                            font.pixelSize: 14
                            text: qsTr("Employee")
                        }
                    }
                    Frame{
                        height: 30
                        width: header_id.width/5
                        Text {
                            anchors.centerIn: parent
                            color: "white"
                            font.bold: true
                            font.pixelSize: 14
                            text: qsTr("Action")
                        }
                    }


                }

            }

            ListView{
                id:model_view_id
                spacing: 5
                anchors{
                    left: parent.left
                    right: parent.right
                    top: header_id.bottom
                }
                height: model_view_id.count*50
                model: [1,2,3]
                delegate: Rectangle{
                    width: parent.width
                    color: "gray"
                    height: 50
                    Row{
                        spacing: 10
                        Rectangle{
                            height: 30
                            color: "gray"
                            width: header_id.width/5
                            Text {
                                anchors.centerIn: parent
                                color: "white"
                                font.bold: true
                                font.pixelSize: 14
                                text: qsTr("Document"+model.index)
                            }
                        }
                        Rectangle{
                            height: 30
                            width: header_id.width/5
                            color: "gray"
                            Text {
                                anchors.centerIn: parent
                                color: "white"
                                font.bold: true
                                font.pixelSize: 14
                                text: qsTr("Date")
                            }
                        }
                        Rectangle{
                            height: 30
                            width: header_id.width/5
                            color: "gray"
                            Text {
                                anchors.centerIn: parent
                                color: "white"
                                font.bold: true
                                font.pixelSize: 14
                                text: qsTr("Customer")
                            }
                        }
                        Rectangle{
                            height: 30
                            width: header_id.width/5
                            color: "gray"
                            Text {
                                anchors.centerIn: parent
                                color: "white"
                                font.bold: true
                                font.pixelSize: 14
                                text: qsTr("Employee"+model.index)
                            }
                        }
                        Rectangle{
                            height: 30
                            width: header_id.width/5
                            color: "gray"
                            Button{
                                anchors.centerIn: parent
                                text: " Unsuspend"
                            }
                        }

                    }
                }
            }

            Button{
                id:closebtn
                anchors{
                    top: model_view_id.bottom
                    right: parent.right
                    topMargin: 60
                    rightMargin: 20
                }
                style: ButtonStyle {
                    background: Rectangle {
                        implicitWidth:60
                        implicitHeight:30
                        border.width: control.activeFocus ? 2 : 1
                        border.color: "#7b8a8b"
                        radius: 4
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: control.pressed ? "#7b8a8b": "rgba(0, 0, 0, 0.15)" }
                            GradientStop { position: 1 ; color: control.pressed ?  "#7b8a8b":  "rgba(0, 0, 0, 0.15)"}
                        }
                    }
                    label:Label {
                        anchors.centerIn: parent
                        color: "white"
                        font.bold: true
                        text: " Close"

                    }
                }

                onClicked:{

                    suspendeditem_dialog_id.close()
                }

            }


        }

    }

}
