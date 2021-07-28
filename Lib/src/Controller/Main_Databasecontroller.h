#ifndef MAIN_DATABASECONTROLLER_H
#define MAIN_DATABASECONTROLLER_H
#include<Lib_global.h>
#include <QObject>


namespace Controller {
class LIB_EXPORT Main_DatabaseController: public QObject
{
    Q_OBJECT
public:
    Main_DatabaseController(QObject* parent=nullptr):QObject(parent)
    {};


};
}
#endif // MAIN_DATABASECONTROLLER_H
