ui_dir.source = ui/
ui_dir.target = qml
DEPLOYMENTFOLDERS = ui_dir

CONFIG += c++11

QT += quick

HEADERS += \
    main-window.h

SOURCES += \
    main-window.cpp \
    main.cpp

include(qtquick2applicationviewer.pri)
qtcAddDeployment()
