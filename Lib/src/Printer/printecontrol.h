#ifndef PRINTECONTROL_H
#define PRINTECONTROL_H
#include <QObject>
#include<QVariant>
#include<Lib_global.h>

namespace Printer {
class LIB_EXPORT  PrinteControl : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool done READ getName CONSTANT)
public:
    explicit PrinteControl(QObject *parent = nullptr);
    Q_INVOKABLE bool printfun(QVariant data);

    bool getName() const;

signals:
    void doneprinting();
private:
    bool name=false;


};
}
#endif // PRINTECONTROL_H
