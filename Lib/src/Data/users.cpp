#include "users.h"

namespace Data {


Users::Users(QObject *parent)
{

}

Users::Users(QObject *parent, QString firstName, QString lastName, QString userName, QString password):
QObject(parent),firstName(firstName),lastName(lastName),userName(userName),password(password)

{

}

QString Users::getFirstName() const
{
    return firstName;
}

void Users::setFirstName(const QString &value)
{
    if(firstName != value)
    {
        firstName = value;
        emit firstNameChanged();
    }

}

QString Users::getLastName() const
{
    return lastName;
}

void Users::setLastName(const QString &value)
{
   if( lastName != value)
   {
        lastName = value;
        emit lastNameChanged();
   }
}

QString Users::getUsername() const
{
    return userName;
}

void Users::setUsername(const QString &value)
{
   if( userName != value)
   {
        userName = value;
        emit userNameChanged();
   }
}

QString Users::getPassword() const
{
    return password;
}

void Users::setPassword(const QString &value)
{
   if( password != value)
   {
        password = value;
        emit  passwordChanged();
   }
}
}
