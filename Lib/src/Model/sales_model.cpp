#include "sales_model.h"
#include<QVariant>
#include<QDebug>
#include<sstream>

using namespace Model;
using namespace Data;


Sales_model::Sales_model(QObject *parent)
    : QAbstractListModel(parent)
{
}

QVariant Sales_model::headerData(int section, Qt::Orientation orientation, int role) const
{
    // FIXME: Implement me!
}

bool Sales_model::setHeaderData(int section, Qt::Orientation orientation, const QVariant &value, int role)
{
    if (value != headerData(section, orientation, role)) {

        emit headerDataChanged(orientation, section, section);
        return true;
    }
    return false;
}

int Sales_model::rowCount(const QModelIndex &parent) const
{

    if (parent.isValid())
        return 0;

    return mData.size();
}

QVariant Sales_model::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) return QVariant();

    auto column=role;
    switch (column) {
    case itemname:{
        return QVariant(mData.at(index.row())->Name()).toString();
        break;
    }
    case quantity:{
        return QVariant(mData.at(index.row())->Quantity()).toInt();
        break;
    }
    case cost:{
        return QVariant(mData.at(index.row())->Cost()).toInt();
        break;
    }
    case category:{
        return QVariant(mData.at(index.row())->Category()).toString();
        break;
    }
    case id:{
        return QVariant(mData.at(index.row())->Id()).toString();
        break;
    }
    case date:{
        return QVariant(mData.at(index.row())->getDate()).toString();
        break;
    }
    case total:{
        return QVariant(mData.at(index.row())->Total_cost()).toInt();
        break;
    }

    }

    return QVariant();
}

bool Sales_model::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (!index.isValid()) return false;

    auto column=role;
    switch (column) {
    case itemname:{
         QVariant(value).toString()=mData.at(index.row())->Name();
        break;
    }
    case quantity:{
        QVariant(value).toString()=mData.at(index.row())->Category();
        break;
    }
    case cost:{
        QVariant(value).toString()=mData.at(index.row())->Cost();
        break;
    }
    case category:{
       QVariant(value).toString()=mData.at(index.row())->Category();
        break;
    }
    case id:{
         QVariant(value).toString()=mData.at(index.row())->Id();
        break;
    }
    case date:{
         QVariant(value).toString()=mData.at(index.row())->getDate();
        break;
    }
    case total:{
         QVariant(value).toString()=mData.at(index.row())->Total_cost();
        break;
    }

    }

    return true;
}

Qt::ItemFlags Sales_model::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable;
}

QHash<int, QByteArray> Sales_model::roleNames() const
{
    QHash<int, QByteArray>Names;
        Names.insert(itemname,"name");
        Names.insert(quantity,"quantity");
        Names.insert(cost,"cost");
        Names.insert(category,"category");
        Names.insert(id,"id");
        Names.insert(total,"total");
        Names.insert(date,"date");

        return Names;
}

void Sales_model::populate(QList<Sale*> &data)
{
    mData.empty();
    mData=data;

}

bool Sales_model::populate_item(QString id, QString name, QString category, int quantity, int cost, int totalcost, QString Date,QString user,QString payment)
{

    int index=mData.size();
    emit beginInsertRows(QModelIndex(),index,index);
    mData.append(new Sale(id,name,category,quantity,cost,totalcost,Date,user,payment));
    emit endInsertRows();

}

bool Sales_model::populate_item_single(QString id, QString name, QString category, int quantity, int cost, int totalcost, QString Date,QString user,QString payment)
{
    mData.clear();
    if(mData.isEmpty()){
    int index=mData.size();
    emit beginInsertRows(QModelIndex(),index,index);
    mData.append(new Sale(id,name,category,quantity,cost,totalcost,Date,user,payment));
    emit endInsertRows();
    return true;
   }
    return false;
}

bool Sales_model::update(QString id, int quantity)
{
    int index=mData.size()-1;
    emit beginInsertRows(QModelIndex(),index,index);
   for(auto &d:mData)
   {
       if(d->Id()==id){
           d->setQuantity(quantity);

           d->setTotal_cost(d->Cost()*quantity);

       }
   }
         return true;
   emit endInsertRows();
}


bool Sales_model::Remove(QString id)
{
    int index=mData.size()-1;
    emit beginRemoveRows(QModelIndex(),index,index);
    for(int i=0;i<mData.size();i++){
        if(mData[i]->Id()==id){
            mData.removeAt(0);
        }
    }
    emit endRemoveRows();
    return true;

}

bool Sales_model::clear_data()
{
    if(mData.size()<0)return false;
    int index=mData.size()-1;
    for(int i=0;i<=index;i++){
        beginRemoveRows(QModelIndex(),index,index);
        mData[i];
        endRemoveRows();
    }
    return true;
}

QList<Sale *> Sales_model::getData()
{
    return  mData;
}

int Sales_model::Grandtotal()
{
    int tt=0;
    for(auto &d:mData){
       tt+=d->Total_cost();
    }

    emit GrandtotalChanged();
    return tt;
}

void Sales_model::setGrandtotal(int Grandtotal)
{
    m_Grandtotal = Grandtotal;
}

int Sales_model::Amount() const
{
    return mData.count();
}

void Sales_model::setAmount(int Amount)
{
    m_Amount = Amount;
}
