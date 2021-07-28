#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include<QString>
#include<Lib_global.h>

namespace Data {
namespace Settings {

class LIB_EXPORT DataBase : public QObject
{
    Q_OBJECT
public:
    explicit DataBase(QObject *parent = nullptr);

signals:

private:
    QString _Database_name;


};
}}
#endif // DATABASE_H
