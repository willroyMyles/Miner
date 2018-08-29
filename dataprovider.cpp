


#include "dataprovider.h"
#include <QDebug>

/*!
 * \brief Class provides test data set for MiloCharts Demo project.
 * \class DataProvider
 */

DataProvider::DataProvider(QObject *parent) :
    QObject(parent),summation(0),count(0)
{
    valueList.append( 0.0);
    labelList.append("");

    for(int i =0; i < valueList.size();i++){
        summation += valueList.at(i);
        count = i+1;
        if(valueList.at(i)> maxValue_){
            maxValue_ = valueList.at(i);
            emit maxValueChanged();
        }
    }

}

/*!
 * \brief DataProvider::getValues - returns chart values.
 * \return
 */
QList<qreal> DataProvider::getValues() const
{
   // return { 1.5, 2.5, 1.5, 2.5, 2.0, 1.0, 0.5 };
    return valueList;
}

/*!
 * \brief DataProvider::getLabels - returns chart labels.
 * \return
 */
QStringList DataProvider::getLabels() const
{
    //return QStringList({ "8:00", "10:00", "12:00", "14:00", "16:00", "18:00", "20:00" });
   // return {"lab","hfi"};
    return labelList;
}

/*!
 * \brief DataProvider::getColors - returns chart colors.
 * \return
 */
QStringList DataProvider::getColors() const
{
    return QStringList({ "#54bc9b",
                         "#f58d35",
                         "#f14946",
                         "#8562a4",
                         "#348faa",
                         "#dddddd",
                         "#c4c4c4"
                       });
}

qreal DataProvider::getAverage()
{
    return summation/count/summation;
}

void DataProvider::addToSeries(qreal yValue, QString xValue)
{

    if(low == 0.0) low = yValue;
    if(low > yValue) low = yValue;
    emit lowChanged();

    if(valueList.length() > 25){
		valueList.takeFirst();
		labelList.takeFirst();
    }


    if(yValue> maxValue_){
        maxValue_ = yValue;
        emit maxValueChanged();
    }

    valueList.append(yValue);
    labelList.append("");

	summation += yValue;
	count++;
	mean = summation / count;

    latest = yValue;
	emit meanChanged();
    emit latestChanged();
    emit dataAdded();


}

void DataProvider::randomSeries()
{

    auto value = qreal(qrand()%100);
    addToSeries(value);

}

void DataProvider::setIndex(int dex)
{
	index = dex;
}

void DataProvider::setMinerProcess(MinerProcess *process)
{
	this->process = process;
	cardName = process->gpu.name;
		emit cardNameChanged();
	

	if (process != nullptr) {
		connect(process, &MinerProcess::onMinerChartData, [this](MinerChartData data)
		{
			// set last hash to ui
			//this->setSpeed(data.hps);
			addToSeries(data.hps);

			// if hps is 0 then it must be connecting
			// set pool color to orange
			if (data.connected)
				//this->setMinerStatus(MinerConnection::Connected);
				this->status = "Connected";
			else
				//this->setMinerStatus(MinerConnection::Connecting);
				this->status = "Connecting";


		/*	if (data.hps != 0) {
				if (this->info->data.size() > 100)
					this->info->data.removeFirst();
				this->info->data.append(data);
				this->info->repaint();
			}*/
		});

		connect(process, &MinerProcess::minerStatusChanged, [this](MinerStatus status)
		{
			switch (status)
			{
			case MinerStatus::Idle:
				/*this->setMinerStatus(MinerConnection::Inactive);
				displayLabel->setText("Inactive");*/
				this->status = "Inactive";
				break;
			case MinerStatus::Starting:
				/*this->setMinerStatus(MinerConnection::Connecting);
				displayLabel->setText("Connecting");*/
				this->status = "Connecting";
				break;
			case MinerStatus::Mining:
				/*this->setMinerStatus(MinerConnection::Connected);
				displayLabel->setText("Connected");*/
				this->status = "Connected";
				break;
			case MinerStatus::Stopping:
				/*this->setMinerStatus(MinerConnection::Notconnected);
				displayLabel->setText("Not Connected");*/
				this->status = "Not Connected";

				break;
			}
		});
	}

}

qreal DataProvider::getHigh() const
{
    return this->maxValue_;
}

qreal DataProvider::getLow() const
{
    return low;
}

qreal DataProvider::getMean() const
{
	qSetRealNumberPrecision(2);
	
    return mean;
}

qreal DataProvider::getLatest() const
{
    return latest;
}

QString DataProvider::getCardName() const
{
    return cardName;
}

QString DataProvider::getStatus() const
{
    return status;
}

Q_INVOKABLE DataProvider * DataProvider::getProvide()
{
	return this;
}
