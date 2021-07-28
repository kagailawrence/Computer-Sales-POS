#ifndef DATABASE_CONTROLLER_H
#define DATABASE_CONTROLLER_H
#include <QObject>
#include<QSql>
#include<QSqlQuery>
#include<QSqlDatabase>
#include<QDateTime>
#include<QVariant>
#include<QJsonArray>
#include<QFile>
#include<Controller/Main_Databasecontroller.h>

#include <Data/sales.h>
#include<Data/item.h>


class Sale;
class item;
#include<Lib_global.h>

namespace Controller{

class  LIB_EXPORT Database_controller: public Main_DatabaseController
{
    Q_OBJECT
public:
    explicit Database_controller(QObject *parent = nullptr);
    bool CreatetableRow(QString data)const;
    //read from data
    bool logincheck(QString ,QString);
    QList<Data::Sale*> Read_Sales(QString dbname);
    QList<Data::item*> Read_Stock(QString dbname);
    QList<Data::Sale*>Read_Returns(QString dbname);
    QList<Data::Sale*>Read_MostSold(QString dbname);

    //read data with arguemnt
    QList<Data::Sale*> Read_Sales_month(QString dbname);
    QList<Data::Sale*> Read_Sales_today(QString dbname);
    QList<Data::Sale*>Read_Returns_month(QString dbname);
    QList<Data::Sale*>Read_MostSold_month(QString dbname);
    QList<Data::Sale*>Read_Returns_today(QString dbname);
    QList<Data::Sale*>Read_MostSold_today(QString dbname);
    
    QList<Data::Sale*>Read_Cart(QString dbname);

    //search the database
      QList<Data::Sale*> Read_Search(QString dbname,QString search);

      //category section
      bool update_category(QString text);
      QJsonArray read_Category();
      bool drop_category();
      bool add_Category(const QString text);

    //append in the database

    bool push_sales(QString table_name,QString name,QString category,int quantity ,int cost , int totalcost ,QString date,QString user,QString payment) const;

    bool push_Items(QString name,QString category,int quantity,int price);
    QList<Data::item*> Read_Stock_Search(QString text);
    bool import(QString ,QString location);


//backing up the database

    bool Export_toCsv(QString tname,QString location);
    bool Backupdata(QString dwd);
    bool createTable();


signals:
    void Databaseconnected();
    void dbconnected(bool);

private:

    QSqlDatabase db;
    bool databaseinitialization();
    bool m_databaseconnected=false;

};
}
#endif // DATABASE_CONTROLLER_H
