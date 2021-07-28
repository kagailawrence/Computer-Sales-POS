#ifndef INFORMATION_H
#define INFORMATION_H

#include <QObject>
#include<QString>
#include<Lib_global.h>

namespace Data {
namespace Settings {

class LIB_EXPORT Information : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString Company_name READ Company_name WRITE setCompany_name NOTIFY Company_nameChanged)
    Q_PROPERTY(QString Company_Address READ Company_Address WRITE setCompany_Address NOTIFY Company_AddressChanged)
    Q_PROPERTY(QString Company_email READ Company_email WRITE setCompany_email NOTIFY Company_emailChanged)
    Q_PROPERTY(QString Company_Phone READ Company_Phone WRITE setCompany_Phone NOTIFY Company_PhoneChanged)
    Q_PROPERTY(QString Return_Policy READ Return_Policy WRITE setReturn_Policy NOTIFY Return_PolicyChanged)
public:
    explicit Information(QObject *parent = nullptr);
    Information(QObject *parent ,QString _Company_name,QString _Company_Address,QString _Company_email,QString _Company_Phone,QString _Return_Policy);

    QString Company_name() const;
    void setCompany_name(const QString &Company_name);

    QString Company_Address() const;
    void setCompany_Address(const QString &Company_Address);

    QString Company_email() const;
    void setCompany_email(const QString &Company_email);

    QString Company_Phone() const;
    void setCompany_Phone(const QString &Company_Phone);

    QString Return_Policy() const;
    void setReturn_Policy(const QString &Return_Policy);

signals:
    void Company_nameChanged();
    void Company_AddressChanged();
    void Company_emailChanged();
    void Company_PhoneChanged();
    void Return_PolicyChanged();
private:
    QString _Company_name;
    QString _Company_Address;
    QString _Company_email;
    QString _Company_Phone;
    QString _Return_Policy;

};

}
}
#endif // INFORMATION_H
