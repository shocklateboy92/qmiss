#include "main-window.h"

#include <QtQuick>

MainWindow::MainWindow(QQuickView *parent) :
    QQuickView(parent), m_model(new NotesModel(this))
{
    setResizeMode(QQuickView::SizeRootObjectToView);
    engine()->rootContext()->setContextProperty("notesModel", m_model);
    setSource(QUrl("qml/ui/main.qml"));
}
