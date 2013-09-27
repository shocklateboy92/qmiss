#include "main-window.h"

MainWindow::MainWindow(QQuickView *parent) :
    QQuickView(parent)
{
    setSource(QUrl("qml/ui/main.qml"));
}
