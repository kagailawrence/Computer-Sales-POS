QT -= gui

QT  +=sql network qml
QT += printsupport

TEMPLATE = lib
DEFINES += LIB_LIBRARY

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    src/Controller/database_controller.cpp \
    src/Controller/mastercontroller.cpp \
    src/Data/database.cpp \
    src/Data/information.cpp \
    src/Data/item.cpp \
    src/Data/sales.cpp \
    src/Data/users.cpp \
    src/Model/report_model.cpp \
    src/Model/sales_model.cpp \
    src/Printer/printecontrol.cpp \
    src/lib.cpp

HEADERS += \
    src/Controller/Main_Databasecontroller.h \
    src/Controller/database_controller.h \
    src/Controller/mastercontroller.h \
    src/Controller/navigation-controller.h \
    src/Data/database.h \
    src/Data/information.h \
    src/Data/item.h \
    src/Data/sales.h \
    src/Data/users.h \
    src/Lib_global.h \
    src/Model/report_model.h \
    src/Model/sales_model.h \
    src/Printer/printecontrol.h \
    src/lib.h

INCLUDEPATH +=src
# Default rules for deployment.
unix {
    target.path = /usr/lib
}
!isEmpty(target.path): INSTALLS += target
