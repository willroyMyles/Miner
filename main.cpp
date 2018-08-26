#include "dataprovider.h"
#include "literals.h"
#include <QApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);

    Literals lit;

    QQmlApplicationEngine engine;
    DataProvider dataProvider;
    engine.rootContext()->setContextProperty("dataProvider", &dataProvider);
    engine.rootContext()->setContextProperty("Literals",&lit);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
