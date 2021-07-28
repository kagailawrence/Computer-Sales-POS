#ifndef SALES_MODEL_H
#define SALES_MODEL_H

#include <QAbstractListModel>
#include<Lib_global.h>
#include<Data/sales.h>



namespace Model {

class Sales_model : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(int ui_Grandtotal READ Grandtotal WRITE setGrandtotal NOTIFY GrandtotalChanged)
    Q_PROPERTY(int ui_Amount READ Amount WRITE setAmount NOTIFY AmountChanged)

public:
    explicit Sales_model(QObject *parent = nullptr);
    enum{
        id,itemname,quantity ,cost ,category,date,total
    };
    // Header:
    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;

    bool setHeaderData(int section, Qt::Orientation orientation, const QVariant &value, int role = Qt::EditRole) override;

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Editable:
    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole) override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;
     QHash<int, QByteArray> roleNames() const override;
     void populate(QList<Data::Sale*> &ata);
     bool populate_item(QString id,QString name,QString category,int quantity,int cost, int totalcost,QString Date,QString,QString);
     bool populate_item_single(QString id,QString name,QString category,int quantity,int cost, int totalcost,QString Date,QString,QString);

     bool update(QString id,int quantity);
     bool Remove(QString id);
     bool clear_data();
 QList<Data::Sale*>getData();
     int Grandtotal();
     void setGrandtotal(int Grandtotal);

     int Amount() const;
     void setAmount(int Amount);
signals:
    void GrandtotalChanged();
    void AmountChanged();

private:
     QList<Data::Sale*> mData;
     int m_Grandtotal;
     int m_Amount;
};
}
#endif // SALES_MODEL_H
