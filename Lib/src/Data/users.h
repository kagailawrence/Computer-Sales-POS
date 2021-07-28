#ifndef USERS_H
#define USERS_H

#include <QObject>
#include<QString>
#include<Lib_global.h>


namespace Data {
class LIB_EXPORT Users: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString ui_firstName READ getFirstName WRITE setFirstName NOTIFY firstNameChanged)
    Q_PROPERTY(QString ui_lastName READ getUsername WRITE setLastName NOTIFY lastNameChanged)
    Q_PROPERTY(QString ui_userName READ getUsername WRITE setUsername NOTIFY userNameChanged)
    Q_PROPERTY(QString ui_password READ getPassword WRITE setPassword NOTIFY passwordChanged)

public:
    explicit Users(QObject *parent = nullptr);
    Users(QObject *parent,QString firstName,QString lastName,QString userName, QString password);

    QString getFirstName() const;
    void setFirstName(const QString &value);

    QString getLastName() const;
    void setLastName(const QString &value);

    QString getUsername() const;
    void setUsername(const QString &value);

    QString getPassword() const;
    void setPassword(const QString &value);

signals:
    void firstNameChanged();
    void lastNameChanged();
    void userNameChanged();
    void passwordChanged();


private:
    QString firstName;
    QString lastName;
    QString userName;
    QString password;

};
}
#endif // USERS_H
