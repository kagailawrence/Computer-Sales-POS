#include "sales.h"

namespace Data {
Sale::Sale(QObject *parent) : QObject(parent)
{

}

Sale::Sale(QString id, QString name, QString category, int quantity, int cost, int totalcost, QString Date, QString user, QString payment):
  _Id(id), _Name(name),_Category(category), _Quantity(quantity), _Cost(cost), _Total_cost(totalcost),date(Date),mUser(user),mPayment(payment)
{

}

QString Sale::Name() const
{
    return _Name;
}

void Sale::setName(const QString &Name)
{
    _Name = Name;
}

QString Sale::Category() const
{
    return _Category;
}

void Sale::setCategory(const QString &Category)
{
    if(_Category != Category)
    {
        _Category = Category;
        emit CategoryChanged();
    }
}

int Sale::Quantity() const
{
    return _Quantity;
}

void Sale::setQuantity(int Quantity)
{
   if( _Quantity != Quantity)
   {
        _Quantity = Quantity;
        emit QuantityChanged();
   }
}

int Sale::Cost() const
{
    return _Cost;
}

void Sale::setCost(int Cost)
{
   if( _Cost != Cost)
   {
        _Cost = Cost;
        emit CostChanged();
   }
}

int Sale::Total_cost() const
{
    return _Total_cost;
}

void Sale::setTotal_cost(int Total_cost)
{
   if( _Total_cost != Total_cost)
   {
        _Total_cost = Total_cost;
        emit Total_costChanged();
   }
}

QString Sale::Id() const
{
    return _Id;
}

void Sale::setId(const QString &Id)
{
    _Id = Id;
}

QString Sale::getDate() const
{
    return date;
}

void Sale::setDate(const QString &value)
{
    date = value;
}

QString Sale::getUser() const
{
    return mUser;
}

void Sale::setUser(const QString &user)
{
    if(mUser != user){
        mUser = user;
        emit UserChanged();
    }
}

QString Sale::getPayment() const
{
    return mPayment;
}

void Sale::setPayment(const QString &payment)
{
    if(mPayment != payment)
    {
        mPayment = payment;
        emit PaymentChanged();
    }
}
}
