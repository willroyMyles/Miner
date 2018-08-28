/*******************************************************************************
Copyright (C) 2017 Milo Solutions
Contact: https://www.milosolutions.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*******************************************************************************/


#ifndef DATAPROVIDER_H
#define DATAPROVIDER_H

#include <QObject>

class DataProvider : public QObject
{
    Q_OBJECT

    Q_PROPERTY(qreal maxValue READ maxValue NOTIFY maxValueChanged)
public:
    explicit DataProvider(QObject *parent = Q_NULLPTR);

    Q_INVOKABLE QList<qreal> getValues() const;
    Q_INVOKABLE QStringList getLabels() const;
    Q_INVOKABLE QStringList getColors() const;
    Q_INVOKABLE qreal getAverage();
    Q_INVOKABLE void addToSeries( qreal yValue, QString xValue = Q_NULLPTR);

    Q_INVOKABLE qreal getHigh() const;
    Q_INVOKABLE qreal getLow() const;
    Q_INVOKABLE qreal getMean() const;
    Q_INVOKABLE qreal getLatest() const;
    Q_INVOKABLE QString getCardName() const;
    Q_INVOKABLE QString getStatus() const;


    Q_INVOKABLE void randomSeries();

    qreal maxValue(){return maxValue_;}


private:
    QList<qreal> valueList;// y-axis
    QStringList labelList ;//x-axis;
    qreal summation;
    qreal count;
    qreal maxValue_ = 0;

    qreal high = 10.0;
    qreal low = 0.0;
    qreal mean = 0.5;
    qreal latest = 0.0;
    QString cardName = "gfore 10-22";
    QString status = "Inactive";

signals:
    void maxValueChanged();
    void cardNameChanged();
    void statusChanged();
    void highChanged();
    void lowChanged();
    void meanChanged();
    void latestChanged();
    void dataAdded();


};

#endif // DATAPROVIDER_H
