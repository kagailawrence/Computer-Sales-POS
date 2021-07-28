#ifndef NAVIGATIONCONTROLLER_H
#define NAVIGATIONCONTROLLER_H


#include <QObject>
#include <Lib_global.h>


namespace Controller{
class LIB_EXPORT NavigationController:public QObject
{
    Q_OBJECT
public:
    explicit NavigationController(QObject* parent = nullptr)
        :QObject(parent)
    {}
signals:
    void goCreatedashboardView();
    void goCreateLoginView();
    void goCreateSettings();
    void goCreateSales();
    void goCreateReport();
    void goCreateStock();

};
}
#endif
