#include "dataprovider.h"
#include "literals.h"
#include "minerprocess.h"
#include <QApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);

	//created on the stack so destroyed after window loaded
    Literals lit;

    QQmlApplicationEngine engine;
    //DataProvider dataProvider;
    //engine.rootContext()->setContextProperty("dataProvider", &dataProvider);
	qmlRegisterType<DataProvider>("DataProvider", 1, 0, "DataProvider");
	qmlRegisterType<MinerManager>("MinerManager", 1, 0, "MinerManager");
	//qmlRegisterType<DataProvider>("DataProvider", 1, 0, "DataProvider");
	engine.rootContext()->setContextProperty("Literals",&lit);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
