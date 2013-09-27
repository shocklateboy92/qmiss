#include "main-window.h"

#include <QGuiApplication>

int main(int argc, char* argv[]) {
    QGuiApplication app(argc, argv);

    MainWindow window;
    window.show();

    return app.exec();
}
