#ifndef NOTESMODEL_H
#define NOTESMODEL_H

#include <QAbstractListModel>
#include <QSqlQueryModel>

class NotesModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum {
        IdRole = Qt::UserRole,
        TitleRole,
        DescriptionRole
    } Roles;

    explicit NotesModel(QObject *parent = 0);

    QHash<int, QByteArray> roleNames() const;

    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;

signals:

public slots:

private:
    QSqlQueryModel *m_query;
};

#endif // NOTESMODEL_H
