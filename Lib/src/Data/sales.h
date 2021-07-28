#ifndef SALES_H
#define SALES_H

#include <QObject>
#include<QString>
#include<Lib_global.h>

namespace Data {
class LIB_EXPORT Sale : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString ui_Name READ Name WRITE setName NOTIFY NameChanged)
    Q_PROPERTY(QString ui_Category READ Category WRITE setCategory NOTIFY CategoryChanged)
    Q_PROPERTY(int ui_Quantity READ Quantity WRITE setQuantity NOTIFY QuantityChanged)
    Q_PROPERTY(int ui_Cost READ Cost WRITE setCost NOTIFY CostChanged)
    Q_PROPERTY(int ui_Total_cost READ Total_cost WRITE setTotal_cost NOTIFY Total_costChanged)
    Q_PROPERTY(QString ui_Id READ Id WRITE setId NOTIFY IdChanged)
    Q_PROPERTY(QString ui_date READ getDate WRITE setDate NOTIFY dateChanged)
    Q_PROPERTY(QString  ui_payment READ getPayment WRITE setPayment NOTIFY PaymentChanged)
    Q_PROPERTY(QString  ui_user READ getUser WRITE setUser NOTIFY UserChanged)
public:
    explicit Sale(QObject *parent = nullptr);
      Sale(QString id,QString name,QString category,int quantity,int cost, int totalcost,QString Date,QString user,QString payment);

    QString Name() const;
    void setName(const QString &Name);

    QString Category() const;
    void setCategory(const QString &Category);

    int Quantity() const;
    void setQuantity(int Quantity);

    int Cost() const;
    void setCost(int Cost);

    int Total_cost() const;
    void setTotal_cost(int Total_cost);

    QString Id() const;
    void setId(const QString &Id);

    QString getDate() const;
    void setDate(const QString &value);

    QString getUser() const;
    void setUser(const QString &user);

    QString getPayment() const;
    void setPayment(const QString &payment);

signals:
    void NameChanged();
    void CategoryChanged();
    void QuantityChanged();
    void CostChanged();
    void  Total_costChanged();
    void dateChanged();
    void IdChanged();
void PaymentChanged();
void UserChanged();
private:
    QString _Id;
    QString _Name;
    QString _Category;
    int _Quantity;
    int _Cost;
    int _Total_cost;
    QString date;
    QString mPayment;
    QString mUser;

};
}
#endif // SALES_H
