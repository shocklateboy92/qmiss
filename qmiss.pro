ui_dir.source = ui/
ui_dir.target = qml
DEPLOYMENTFOLDERS = ui_dir

CONFIG += c++11

QT += quick sql

HEADERS += \
    mock-model.h \
    main-window.h \
    notes-model.h

SOURCES += \
    main-window.cpp \
    mock-model.cpp \
    main.cpp \
    notes-model.cpp

include(qtquick2applicationviewer.pri)
qtcAddDeployment()

OTHER_FILES += \
    db/seed.py
