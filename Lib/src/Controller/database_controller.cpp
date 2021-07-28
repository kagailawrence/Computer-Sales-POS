#include <Controller/database_controller.h>
#include<QtDebug>
#include<QJsonArray>
#include<QJsonObject>
#include<QSqlError>
namespace Controller {

Database_controller::Database_controller(QObject *parent):Main_DatabaseController(parent)
{
    m_databaseconnected=false;
    if(databaseinitialization()){
        if(createTable()){
            qDebug() << "Database tables created";
            emit dbconnected(true);
        }
        else{
            qDebug() << "ERROR: Unable to create database tables";
        }
    }
    else {
        qDebug() << "ERROR: Unable to open database";
    }
}

bool Database_controller::CreatetableRow(QString data) const
{
    QSqlQuery query(db);

    QString sqlstatement="INSERT INTO tables (Noid) VALUES(:data)";
    if(!query.prepare(sqlstatement)) return  false;
    query.bindValue(":data",QVariant(data));
    if(!query.exec()) return  false;
    return  query.numRowsAffected()>0;
}

bool Database_controller::logincheck(QString username, QString password)
{
    QStringList data;
    data.clear();
    QSqlQuery query(db);
    QString sql="SELECT * FROM users WHERE username=:username AND password=:password;";
    if(!query.prepare(sql)) return {};
    query.bindValue(":username",QVariant(username).toString());
    query.bindValue(":password",QVariant(password).toString());
    if(!query.exec()) return {};
    return  query.numRowsAffected()>0;
}

QList<Data::Sale *> Database_controller::Read_Sales(QString dbname)
{
    //QString id,QString name,QString category,int quantity,int cost, int totalcost,QString Date
    QList<Data::Sale*> data;
    data.empty();
    QSqlQuery query(db);
    QString sql="Select * from :dbname;";
    if(!query.prepare(sql)) return {};
    query.bindValue(":dbname",QVariant(dbname).toString());
    if(!query.exec()) return {};
    while (query.next()) {
        data.append (new Data::Sale(
                         query.value(0).toString(),
                         query.value(1).toString(),
                         query.value(2).toString(),
                         query.value(3).toInt(),
                         query.value(4).toInt(),
                         query.value(5).toInt(),
                         query.value(6).toString(),
                          query.value(7).toString(),
                          query.value(8).toString()
                         ));
    }
    return data;
}

QList<Data::item *> Database_controller::Read_Stock(QString dbname)
{
Q_UNUSED(dbname);
    QList<Data::item*> data;
    data.empty();
    QSqlQuery query(db);
    QString sql="Select * from stock";
    if(!query.prepare(sql)) return {};
    if(!query.exec()) return {};
    //id name categ qnt price
    while (query.next()) {
        data.append (new Data::item(
                         QVariant( query.value(0)).toInt(),
                          query.value(1).toString(),
                          query.value(2).toString(),
                          query.value(3).toInt(),
                          query.value(4).toInt()
                         ));
    }
    return data;
}

QList<Data::Sale *> Database_controller::Read_Returns(QString dbname)
{
    QList<Data::Sale*> data;
    data.empty();
    QSqlQuery query(db);
    QString sql="Select * from :dbname;";
    if(!query.prepare(sql)) return {};
    query.bindValue(":dbname",QVariant(dbname).toString());
    if(!query.exec()) return {};
    while (query.next()) {
        data.append (new Data::Sale(
                         query.value(0).toString(),
                         query.value(1).toString(),
                         query.value(2).toString(),
                         query.value(3).toInt(),
                         query.value(4).toInt(),
                         query.value(5).toInt(),
                         query.value(6).toString(),
                         query.value(7).toString(),
                         query.value(8).toString()
                         ));
    }
    return data;
}

QList<Data::Sale *> Database_controller::Read_MostSold(QString dbname)
{
    QList<Data::Sale*> data;
    data.empty();
    QSqlQuery query(db);
    QString sql="Select * from :dbname;";
    if(!query.prepare(sql)) return {};
    query.bindValue(":dbname",QVariant(dbname).toString());
    if(!query.exec()) return {};
    while (query.next()) {
        data.append (new Data::Sale(
                         query.value(0).toString(),
                         query.value(1).toString(),
                         query.value(2).toString(),
                         query.value(3).toInt(),
                         query.value(4).toInt(),
                         query.value(5).toInt(),
                         query.value(6).toString(),
                         query.value(7).toString(),
                         query.value(8).toString()
                         ));
    }
    return data;
}

QList<Data::Sale *> Database_controller::Read_Sales_month(QString dbname)
{

    QString datem=QDate::currentDate().toString("M/yyyy");
    QList<Data::Sale*> data;
    data.empty();
    QSqlQuery query(db);
    QString sql="Select * from :dbname where date=:date;";
    if(!query.prepare(sql)) return {};
    query.bindValue(":dbname",QVariant(dbname).toString());
    query.bindValue(":date",QVariant("% "+datem.toLower()+"%"));
    if(!query.exec()) return {};
    while (query.next()) {
        data.append (new Data::Sale(
                         query.value(0).toString(),
                         query.value(1).toString(),
                         query.value(2).toString(),
                         query.value(3).toInt(),
                         query.value(4).toInt(),
                         query.value(5).toInt(),
                         query.value(6).toString(),
                         query.value(7).toString(),
                         query.value(8).toString()
                         ));
    }
    return data;
}

QList<Data::Sale *> Database_controller::Read_Sales_today(QString dbname)
{

    QList<Data::Sale*> data;
    data.empty();
    QSqlQuery query(db);
    QString sql="Select * from :dbname where date=:date;";
    if(!query.prepare(sql)) return {};
    query.bindValue(":dbname",QVariant(dbname).toString());
    query.bindValue(":date",QVariant(QDate::currentDate().toString("d/M/yyyy")));
    if(!query.exec()) return {};
    while (query.next()) {
        data.append (new Data::Sale(
                         query.value(0).toString(),
                         query.value(1).toString(),
                         query.value(2).toString(),
                         query.value(3).toInt(),
                         query.value(4).toInt(),
                         query.value(5).toInt(),
                         query.value(6).toString(),
                         query.value(7).toString(),
                         query.value(8).toString()
                         ));
    }
    return data;
}

QList<Data::Sale *> Database_controller::Read_Returns_month(QString dbname)
{
    QString datem=QDate::currentDate().toString("M/yyyy");
    QList<Data::Sale*> data;
    data.empty();
    QSqlQuery query(db);
    QString sql="Select * from :dbname where date=:date;";
    if(!query.prepare(sql)) return {};
    query.bindValue(":dbname",QVariant(dbname).toString());
    query.bindValue(":date",QVariant("% "+datem.toLower()+"%"));
    if(!query.exec()) return {};
    while (query.next()) {
        data.append (new Data::Sale(
                         query.value(0).toString(),
                         query.value(1).toString(),
                         query.value(2).toString(),
                         query.value(3).toInt(),
                         query.value(4).toInt(),
                         query.value(5).toInt(),
                         query.value(6).toString(),
                         query.value(7).toString(),
                         query.value(8).toString()
                         ));
    }
    return data;
}

QList<Data::Sale *> Database_controller::Read_MostSold_month(QString dbname)
{

    QString datem=QDate::currentDate().toString("M/yyyy");
    QList<Data::Sale*> data;
    data.empty();
    QSqlQuery query(db);
    QString sql="Select * from :dbname where date=:date;";
    if(!query.prepare(sql)) return {};
    query.bindValue(":dbname",QVariant(dbname).toString());
    if(!query.exec()) return {};
    query.bindValue(":date",QVariant("% "+datem.toLower()+"%"));
    while (query.next()) {
        data.append (new Data::Sale(
                         query.value(0).toString(),
                         query.value(1).toString(),
                         query.value(2).toString(),
                         query.value(3).toInt(),
                         query.value(4).toInt(),
                         query.value(5).toInt(),
                         query.value(6).toString(),
                         query.value(7).toString(),
                         query.value(8).toString()
                         ));
    }
    return data;
}

QList<Data::Sale *> Database_controller::Read_Returns_today(QString dbname)
{
    QList<Data::Sale*> data;
    data.empty();
    QSqlQuery query(db);
    QString sql="Select * from :dbname where date=:date;";
    if(!query.prepare(sql)) return {};
    query.bindValue(":dbname",QVariant(dbname).toString());
    query.bindValue(":date",QVariant(QDate::currentDate().toString("d/M/yyyy")));
    if(!query.exec()) return {};
    while (query.next()) {
        data.append (new Data::Sale(
                         query.value(0).toString(),
                         query.value(1).toString(),
                         query.value(2).toString(),
                         query.value(3).toInt(),
                         query.value(4).toInt(),
                         query.value(5).toInt(),
                         query.value(6).toString(),
                         query.value(7).toString(),
                         query.value(8).toString()
                         ));
    }
    return data;
}

QList<Data::Sale *> Database_controller::Read_MostSold_today(QString dbname)
{

    QList<Data::Sale*> data;
    data.empty();
    QSqlQuery query(db);
    QString sql="Select * from :dbname where date=:date;";
    if(!query.prepare(sql)) return {};
    query.bindValue(":dbname",QVariant(dbname).toString());
    query.bindValue(":date",QVariant(QDate::currentDate().toString("d/M/yyyy")));
    if(!query.exec()) return {};
    while (query.next()) {
        data.append (new Data::Sale(
                         query.value(0).toString(),
                         query.value(1).toString(),
                         query.value(2).toString(),
                         query.value(3).toInt(),
                         query.value(4).toInt(),
                         query.value(5).toInt(),
                         query.value(6).toString(),
                         query.value(7).toString(),
                         query.value(8).toString()
                         ));
    }
    return data;
}

QList<Data::Sale *> Database_controller::Read_Cart(QString dbname)
{
    QList<Data::Sale*> data;
    data.empty();
    QSqlQuery query(db);
    QString sql="Select * from :dbname";
    if(!query.prepare(sql)) return {};
    query.bindValue(":dbname",QVariant(dbname).toString());

    if(!query.exec()) return {};
    while (query.next()) {
        data.append (new Data::Sale(
                         query.value(0).toString(),
                         query.value(1).toString(),
                         query.value(2).toString(),
                         query.value(3).toInt(),
                         query.value(4).toInt(),
                         query.value(5).toInt(),
                         query.value(6).toString(),
                         query.value(7).toString(),
                         query.value(8).toString()
                         ));
    }
    return data;
}

QList<Data::Sale *> Database_controller::Read_Search(QString dbname, QString searchText)
{

    QList<Data::Sale *>data;
    data.clear();
    QString sql="SELECT * from :dbname Where date=:searchText or id=:searchText or name=:searchText";
    QSqlQuery query(db);
    if(!query.prepare(sql)) return {};
    query.bindValue(":searchText",QVariant("% "+searchText.toLower()+"%"));
    query.bindValue(":dbname",QVariant(dbname).toString());
    if(!query.exec()) return {};
    while (query.next()) {
        data.append (new Data::Sale(
                         query.value(0).toString(),
                         query.value(1).toString(),
                         query.value(2).toString(),
                         query.value(3).toInt(),
                         query.value(4).toInt(),
                         query.value(5).toInt(),
                         query.value(6).toString(),
                         query.value(7).toString(),
                         query.value(8).toString()
                         ));
    }
    return data;
}

bool Database_controller::update_category(QString text)
{
    QSqlQuery query(db);
    QString sql="UPDATE stock_category SET category=:quantity;";
    if(!query.prepare(sql)) return {};
    query.bindValue(":quantity",QVariant(text).toString().toLower());
    if(!query.exec()) return {};

    return query.numRowsAffected()>0;
}

QJsonArray Database_controller::read_Category()
{
    QJsonArray data;
    QString sql("SELECT * FROM category");
    QSqlQuery query(db);
    if(!query.prepare(sql)) return {};

    if(!query.exec()) return {};

    while (query.next()) {
        data.append(query.value(0).toString());
    }
    return data;
}
bool Database_controller::add_Category(const QString text)
{
    QString sql="Insert into category VALUES(:text);";
    QSqlQuery query(db);
    if(!query.prepare(sql)) {};
    query.bindValue(":text",text.toLower());
    if(!query.exec()){};
    return true;
}

bool Database_controller::push_sales(QString table_name,QString name, QString category, int quantity, int cost, int totalcost, QString date, QString user, QString payment) const
{
    QSqlQuery _query(db);
    _query.prepare("select * from sales");
    _query.exec();
    int index=_query.numRowsAffected()+1;
    QString sql="INSERT INTO :database VALUES(:index,:name,:category,:quantity,:cost,:totalcost,:date,:user,:payment);";
    QString sql_stock="UPDATE stock SET quantity=:updated WHERE name=:name AND category=:category;";
    QSqlQuery query(db);
     if(query.prepare(sql)) return {};
     query.bindValue(":database",QVariant(table_name));
     query.bindValue(":index",QVariant(index));
     query.bindValue(":name",QVariant(name).toString());
     query.bindValue(":category",QVariant(category).toString());
     query.bindValue(":quantity",QVariant(quantity).toInt());
     query.bindValue(":cost",QVariant(cost).toInt());
     query.bindValue(":totalcost",QVariant(totalcost).toInt());
     query.bindValue(":date",QVariant(date).toString());
      query.bindValue(":payment",QVariant(payment).toString());
      query.bindValue(":user",QVariant(user).toString());
        if(!query.exec()) return {};

        return true;

}






bool Database_controller::push_Items( QString name, QString category, int quantity, int price)
{
    QSqlQuery _query(db);
    _query.prepare("select * from stock");
    _query.exec();
    int index=_query.numRowsAffected()+1;

    QString sql="INSERT INTO stock VALUES(:id,:name,:category,:quantity,:price)";
    QSqlQuery query(db);
    if(!query.prepare(sql)) return {};
    query.bindValue(":id",QVariant(index).toInt());
    query.bindValue(":name",QVariant(name).toString().toLower());
    query.bindValue(":category",QVariant(category).toString().toLower());
    query.bindValue(":quantity",QVariant(quantity).toInt());
    query.bindValue(":price",QVariant(price).toInt());
    if(!query.exec()) return false;

    return true;
}

QList<Data::item *> Database_controller::Read_Stock_Search(QString searchText)
{
    QList<Data::item *>data;
    data.clear();
    QString sql="SELECT * FROM stock WHERE name like :searchText OR category like :searchText ";
    QSqlQuery query(db);
    if(!query.prepare(sql)) return {};
    query.bindValue(":searchText",QVariant("%"+searchText.toLower()+"%"));
    if(!query.exec()) return {};
    while (query.next()){
        data.append (new Data::item(
                         QVariant( query.value(0)).toInt(),
                          query.value(1).toString(),
                          query.value(2).toString(),
                          query.value(3).toInt(),
                          query.value(4).toInt()
                         ));

    }

    return data;
}

bool Database_controller::import(QString dtable,QString location)
{
    qDebug()<<location;
   QString sql="COPY "+dtable+" FROM '"+location+"' ";
   QSqlQuery query(db);
   if(!query.prepare(sql)) return {};
   query.bindValue(":location",QVariant(location).toString());
   
   if(!query.exec()) return {};
   
   return true;
}


bool Database_controller::Export_toCsv(QString tname,QString location)
{
    qDebug()<<location;
    QSqlQuery query(db);
    QString sql="COPY "+tname+" TO '"+location+"' DELIMITER ',' CSV HEADER";
    if(!query.prepare(sql)) return false;
    query.bindValue(":tname",QVariant(tname).toString());
    query.bindValue(":location",QVariant(location));
    if(!query.exec()) return 0;

    return true;
}

bool Database_controller::Backupdata(QString dwd)
{
    Q_UNUSED(dwd)
    return  true;
}

bool Database_controller::createTable()
{
    QSqlQuery query(db);
    QString sql="CREATE TABLE IF NOT EXISTS sales (id BIGSERIAL primary key NOT NULL,name text,category text, quantity smallint, cost smallint,totalcost Bigint,date text,user text, payment text)";
    QString sql3="CREATE TABLE IF NOT EXISTS returns (id BIGSERIAL primary key NOT NULL,name text,category text, quantity smallint, cost smallint,totalcost Bigint,date text,user text, payment text);";
    QString sql2="CREATE TABLE IF NOT EXISTS stock(id BIGSERIAL primary key NOT NULL ,name text, category text, quantity Bigint, price Bigint);";
    QString sql4="CREATE TABLE IF NOT EXISTS users(id SERIAL primary key,firstName text, lastname text,username text,password text,role text);";
    QString sql5="CREATE TABLE category(category text);";
    QString sql6="CREATE TABLE IF NOT EXISTS cart (id BIGSERIAL primary key,name text,category text, quantity Bigint, cost Bigint,totalcost Bigint,date text)";

    QString sql7="CREATE TABLE IF NOT EXISTS suspended (id BIGSERIAL primary key,name text,date text, customer text, employee text,data json)";

    query.exec(sql);
    query.exec(sql2);
    query.exec(sql3);
    query.exec(sql4);
    query.exec(sql5);
    query.exec(sql6);
    query.exec(sql7);
    return true;

}


bool Database_controller::databaseinitialization()
{
    db = QSqlDatabase::addDatabase("QODBC3");
    db.setDatabaseName("DRIVER={PostgreSQL ANSI};SERVER=127.0.0.1;DATABASE=computer");
    db.setUserName("postgres"); // Set Login Username
    db.setPassword("pass");
    db.setPort(5432);
    return db.open();
}


}
