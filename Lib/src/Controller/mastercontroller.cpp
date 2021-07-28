#include "mastercontroller.h"
#include<QDebug>
namespace Controller {

class MasterController::Implimentation
{
public:
    Implimentation(MasterController* _masterc,Database_controller *_maindatabaec)
        :masterC(_masterc), database(_maindatabaec)
    {
        navigation=new NavigationController(masterC);
        database=new Database_controller(masterC);
        Stocks=new Model::Report_Model(masterC);
        sales  =new Model::Sales_model (masterC);
        returns  =new Model::Sales_model (masterC);
        mostsold  =new Model::Sales_model (masterC);
        Cart=new Model::Sales_model(masterC);
        Search_Stock_to_Cart=new Model::Sales_model(masterC);

    }

    NavigationController * navigation=new NavigationController{nullptr};
    Database_controller * database=new Database_controller{nullptr};
    MasterController *masterC=new MasterController{nullptr};
    Model::Report_Model *Stocks=new Model::Report_Model(nullptr);
    Model::Sales_model *sales=new Model::Sales_model(nullptr);
    Model::Sales_model *returns=new Model::Sales_model(nullptr);
    Model::Sales_model *mostsold=new Model::Sales_model(nullptr);
    Model::Sales_model *Cart=new Model::Sales_model(nullptr);
    Model::Sales_model *Search_Stock_to_Cart =new Model::Sales_model(nullptr);



};

MasterController::MasterController(QObject *parent, Database_controller *maincontroler)
    :QObject(parent)
{
    implimentation.reset(new Implimentation(this,maincontroler));
    populate();
    populate_();

}

MasterController::~MasterController()
{

}

NavigationController *MasterController::navigationController() const
{
    return implimentation->navigation;
}

QString MasterController::title() const
{
    return "Computers";
}

QJsonArray MasterController::Itemcategory() const
{

    return implimentation->database->read_Category();
}

Model::Report_Model *MasterController::Stocks()
{

    return implimentation->Stocks;
}

Model::Sales_model *MasterController::Sales()
{
    return implimentation->sales;
}

Model::Sales_model *MasterController::Cat()
{
    return implimentation->Cart;
}

Model::Sales_model *MasterController::MostSold()
{
    return implimentation->mostsold;
}

Model::Sales_model *MasterController::Returns()
{
    return implimentation->returns;
}

Model::Sales_model *MasterController::Search_Stock_to_Cart()
{
    return implimentation->Search_Stock_to_Cart;
}

void MasterController::populate()
{
    QList<Data::Sale*>data;

    for(int i=0;i<100;i++){
        data.append(new Data::Sale(QString::number(i),"Name","CATEGORY",1,10,10,"date of the sale","",""));
    }
    implimentation->sales->populate(data);


    QList<Data::Sale*>data2;

    for(int i=0;i<100;i++){
        data2.append(new Data::Sale(QString::number(i),"mostsold","CATEGORY",100,10,10,"date of the sale","",""));
    }
    implimentation->mostsold->populate(data2);


    QList<Data::Sale*>data3;
    for(int i=0;i<100;i++){
        data3.append(new Data::Sale(QString::number(i),"returns","CATEGORY",4,1000,600,"date of the sale","",""));
    }
    implimentation->returns->populate(data3);


    auto data_stock= implimentation->database->Read_Stock("");
    implimentation->Stocks->populate(data_stock);

    
}

void MasterController::populate_Cart()
{
    auto data=implimentation->database->Read_Cart("cart");
    implimentation->Cart->populate(data);
    
}




void MasterController::onLogin(QString, QString)
{
    implimentation->navigation->goCreatedashboardView();
}

void MasterController::onLogout()
{

}

void MasterController::onPrint(QString name)
{


}

void MasterController::onExport(QString name)
{

}

void MasterController::onSearchChanged(QString text)
{

}

void MasterController::onSearch(QString id,QString text)
{
    qDebug()<<text<<" the from "<<id;
}

void MasterController::onStock_search( QString text)const
{
    if(!text.isEmpty()){
        auto data= implimentation->database->Read_Stock_Search(text);
        implimentation->Stocks->populate(data);
    }
    else {
        auto data= implimentation->database->Read_Stock("");
        implimentation->Stocks->populate(data);
    }
}

void MasterController::onQuantityChanged(QString id, int quantity)
{
    qDebug()<<"controller";
    implimentation->Cart->update(id,quantity);

}

void MasterController::onAddtoCart(QString item)
{
    auto data=implimentation->database->Read_Stock_Search(item);
    if(data.size()==0){
        data.clear();
    }
    else if( data.size()>2){
        data.clear();
    }
    else {

        implimentation->Search_Stock_to_Cart->populate_item_single(QString::number(data[0]->id()),data[0]->Name(),data[0]->Category(),1,data[0]->Price(),data[0]->Price(),QDate::currentDate().toString(),"","");
        data.clear();
    }
}

void MasterController::onRemoveRow(QString id)
{

    implimentation->Cart->Remove(id);
}

void MasterController::onExport_to_csv(const QString table, const QString loc)
{

    implimentation->database->Export_toCsv(table,"C:\\Users\\Public\\Documents\\"+table+".csv");

}

void MasterController::onImport(QString tname, QString location)
{
    QString floc;
    floc.clear();
    for(int i=0;i<location.size();i++){
        if(i>7){
            floc.append(location[i]);
        }
    }
    implimentation->database->import(tname,floc);

}

void MasterController::onAddcategry(const QString text)
{
    implimentation->database->add_Category(text);
}

void MasterController::onAdd_items(const QString name, const QString category, const int quantity, const int price)
{

    implimentation->database->push_Items(name,category,quantity,price);
}

bool MasterController::onPush_To_cart(QString id, QString name, QString category, int quantity, int cost, int totalcost, QString Date)
{   implimentation->Cart->populate_item(id,name,category,quantity,cost,totalcost,Date,"","");
}

void MasterController::onSuspend_sales()
{

}

bool MasterController::onPayment(QString Recipttype, QString Paymenttype, QString cutomer, QString employee, QString phone, QString tendered, QString Change, QString Grandtotal)
{
   // bool push_sales(QString table_name,QString name,QString category,int quantity ,int cost , int totalcost ,QString date,QString user,QString payment) const;
    auto data=  implimentation->Cart->getData();
    for(auto &d:data)
    {
        implimentation->database->push_sales(Recipttype,d->Name(),d->Category(),d->Quantity(),d->Cost(),d->Total_cost(),"",employee,Paymenttype);
    }

}

void MasterController::populate_()
{
    auto data= implimentation->database->Read_Stock("");
    implimentation->Stocks->populate(data);

}


}
