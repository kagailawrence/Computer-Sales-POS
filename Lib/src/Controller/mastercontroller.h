#ifndef MASTERCONTROLLER_H
#define MASTERCONTROLLER_H
#include <QObject>
#include<QDataStream>
#include<QJsonArray>
#include<QCryptographicHash>
#include<QString>
#include<QScopedPointer>
#include"navigation-controller.h"
#include "Controller/database_controller.h"
#include <Lib_global.h>
#include<Model/report_model.h>
#include<Model/sales_model.h>

#include <Data/sales.h>
#include<Data/item.h>


class Sale;
class item;
namespace Controller {

class LIB_EXPORT MasterController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(Controller::NavigationController *ui_navigation READ navigationController CONSTANT)

    Q_PROPERTY(QString ui_title READ title CONSTANT)
    Q_PROPERTY(QJsonArray ui_data_array READ Itemcategory CONSTANT)
    Q_PROPERTY(Model::Sales_model *ui_Sales READ Sales CONSTANT)
    Q_PROPERTY(Model::Sales_model *ui_MostSold READ MostSold CONSTANT)
    Q_PROPERTY(Model::Sales_model *ui_Returns READ Returns CONSTANT)
    Q_PROPERTY(Model::Sales_model *ui_Cart READ Cat CONSTANT)
    Q_PROPERTY(Model::Report_Model *ui_Stocks READ Stocks CONSTANT)
    Q_PROPERTY(Model::Sales_model * ui_Search_Stock_to_Cart READ Search_Stock_to_Cart CONSTANT)


public:
    explicit MasterController(QObject *parent = nullptr,Database_controller *maincontroler=nullptr);
    ~MasterController();
    NavigationController *navigationController()const;
    QString title()const;
    QJsonArray Itemcategory()const;

    Model::Report_Model* Stocks();
    Model::Sales_model *Sales();
    Model::Sales_model *Cat();
    Model::Sales_model* MostSold();
    Model::Sales_model* Returns();
    Model::Sales_model* Search_Stock_to_Cart();
private:
    void populate();
    void populate_Cart();

signals:

public slots:
    void onLogin(QString,QString);
    void onLogout();
    //report part

    void onPrint(QString name);
    void onExport(QString name);
    void onSearchChanged(QString name);
    void onSearch(QString ,QString);
    void onStock_search(QString text)const;

    void onQuantityChanged(QString id, int quantity );
    void onAddtoCart(QString item);
    void onRemoveRow(QString id);

    //database

    void onExport_to_csv(const QString table,const QString loc);
    void onImport(QString tname,QString location);
    void onAddcategry(const QString text);
    void onAdd_items(const QString name,const QString category,const int quantity,const int price);
    bool onPush_To_cart(QString id,QString name,QString category,int quantity,int cost, int totalcost,QString Date);
    void onSuspend_sales();
    bool onPayment(QString Recipttype,QString Paymenttype,QString cutomer,QString employee,QString phone,QString tendered, QString Change,QString Grandtotal);
private:
    class Implimentation;
    QScopedPointer<Implimentation>implimentation;
    QString BusinessName;
    bool dbconnecteds;
    QString m_username;
    QString Role;
    QString userid;

   void populate_();
};


}
#endif // MASTERCONTROLLER_H
