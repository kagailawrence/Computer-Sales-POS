#include "printecontrol.h"
#include<QPrintDialog>
#include<QPrinter>
#include <QPixmap>
#include <QImage>
#include <QPrintEngine>
#include<QPainter>
#include<QPdfWriter>
#include <QDebug>
using namespace Printer;

PrinteControl::PrinteControl(QObject *parent) : QObject(parent)
{
name=false;
}

bool PrinteControl::printfun(QVariant data)
{
    QImage img = qvariant_cast<QImage>(data);
    img.save("C:/Users/Public/Pictures/picprint.png","PNG");
    QPrinter printer;
        QPainter painter(&printer);
        painter.drawImage(QPoint(0,0),img);
        painter.end();
        name=true;

    return true;
}

bool PrinteControl::getName() const
{
    return name;
}
