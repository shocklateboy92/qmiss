#include "notes-model.h"

#include <QDebug>

NotesModel::NotesModel(QObject *parent) :
    QAbstractListModel(parent), m_query(new QSqlQueryModel(this))
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("qmiss.db");
    Q_ASSERT(db.open());
    m_query->setQuery("SELECT id,title,description FROM Notes ORDER BY title;");
    qDebug() << roleNames();
}

QHash<int, QByteArray> NotesModel::roleNames() const
{
    return {
        { TitleRole,        "title" },
        { DescriptionRole,  "description" },
        { IdRole,           "id" }
    };
}

int NotesModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_query->rowCount(parent);
}

QVariant NotesModel::data(const QModelIndex &index, int role) const
{
    return m_query->data(createIndex(index.row(),
                                     role - Qt::UserRole),
                         Qt::DisplayRole);
}
