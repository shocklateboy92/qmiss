#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include "notes-model.h"

#include <QtQuick/QQuickView>

class MainWindow : public QQuickView
{
    Q_OBJECT
public:
    explicit MainWindow(QQuickView *parent = 0);

signals:

public slots:

private:
    NotesModel *m_model;
};

#endif // MAINWINDOW_H
