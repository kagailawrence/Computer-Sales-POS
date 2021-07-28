#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include<QtQuickControls2>
#include<QQmlContext>
#include<Controller/mastercontroller.h>
#include<Controller/navigation-controller.h>



int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<Controller::MasterController>("Lib",1,0,"Mastercontroller");
    qmlRegisterType<Controller::NavigationController>("Lib", 1, 0,"NavigationController");
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/views/main.qml"));

    engine.load(url);

    return app.exec();
}
