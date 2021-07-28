#include "information.h"

namespace Data {
namespace Settings {
Information::Information(QObject *parent) : QObject(parent)
{

}

Information::Information(QObject *parent, QString _Company_name, QString _Company_Address, QString _Company_email, QString _Company_Phone, QString _Return_Policy):
 QObject(parent), _Company_name(_Company_name),_Company_Address(_Company_Address),_Company_email(_Company_email), _Company_Phone( _Company_Phone),_Return_Policy(_Return_Policy)


{

}

QString Information::Company_name() const
{
    return _Company_name;
}

void Information::setCompany_name(const QString &Company_name)
{
    if(_Company_name != Company_name){
        _Company_name = Company_name;
        emit Company_nameChanged();
    }
}

QString Information::Company_Address() const
{
    return _Company_Address;
}

void Information::setCompany_Address(const QString &Company_Address)
{
    if(_Company_Address != Company_Address)
    {
        _Company_Address = Company_Address;
        Company_AddressChanged();
    }
}

QString Information::Company_email() const
{
    return _Company_email;
}

void Information::setCompany_email(const QString &Company_email)
{
   if( _Company_email != Company_email){
        _Company_email = Company_email;
        emit Company_emailChanged();
   }
}

QString Information::Company_Phone() const
{
    return _Company_Phone;
}

void Information::setCompany_Phone(const QString &Company_Phone)
{
   if( _Company_Phone != Company_Phone)
   {
       _Company_Phone = Company_Phone;
       emit Company_PhoneChanged();
   }
}

QString Information::Return_Policy() const
{
    return _Return_Policy;
}

void Information::setReturn_Policy(const QString &Return_Policy)
{
    if(_Return_Policy != Return_Policy)
    {
        _Return_Policy = Return_Policy;
        emit Return_PolicyChanged();
    }
}
}
}
