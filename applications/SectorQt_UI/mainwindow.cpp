//Include Project headrs
#include <Sector/Core/Core.h>
#include "mainwindow.h"
#include "./ui_mainwindow.h"

// Include 3rdparty headers
#include <QMessageBox>

// Include std headers
#include <exception>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    
    ui->pushButton->setText("Ask Core");
    QObject::connect(ui->pushButton,&QPushButton::clicked,this,CoreAnswer);
    
}

void MainWindow::CoreAnswer() {
    QString message = QString::fromStdString("Do you know that 6 time 6 is equal to " 
                                        + std::to_string(Sector::Core::multiply(6,6)));
    QString title =  QString::fromStdString("The answer is " 
                                            + std::to_string(Sector::Core::get_the_answer()));
    QMessageBox::information(this,title, message, QMessageBox::Ok);
}
MainWindow::~MainWindow()
{
    delete ui;
}
