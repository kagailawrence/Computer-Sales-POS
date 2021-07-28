#include "item.h"


namespace Data {

item::item(QObject *parent) : QObject(parent)
{

}

item::item(int id, QString name, QString category, int quantity, int price):
    _id(id),_Name(name),_Category(category),_Quantity(quantity),_Price(price)
{

}

QString item::Name() const
{
    return _Name;
}

void item::setName(const QString &Name)
{
    if(_Name != Name)
    {
        emit NameChanged();
        _Name = Name;
    }
}

QString item::Category() const
{
    return _Category;
}

void item::setCategory(const QString &Category)
{
    if(_Category != Category){
        _Category = Category;
        emit CategoryChanged();
    }
}

int item::Quantity() const
{
    return _Quantity;
}

void item::setQuantity(int Quantity)
{
   if( _Quantity != Quantity){
        _Quantity = Quantity;
        emit QuantityChanged();
   }
}

int item::Price() const
{
    return _Price;
}

void item::setPrice(int Price)
{
   
    if( _Price != Price){
         _Price = Price;
         emit PriceChanged();
    }
}

int item::id() const
{
    return _id;
}

void item::setId(int id)
{
    if(_id != id){
        _id = id;
        emit idChanged();
    }
}
}
