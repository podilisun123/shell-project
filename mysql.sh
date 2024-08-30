USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log

R="\e[31m]"
G="\e[32m]"
Y="\e[33m]"
N="\e[0m]"

read -p  "Enter DB PASSWORD:  MYSQL-PASSWD "

VALIDATE(){
    if [ $1 -ne 0 ]
    then    
        echo -e "$2 isntallation $R FAILED...$N"
    else
        echo -e "$2 isntallation $G FAILED...$N"
    fi
}
if [ $USERID -ne 0 ]
then
    echo "Please make it as a ROOT USER..."
else
    echo "You are SUPER USER...."
fi
dnf install mysql-server -y &>>LOGFILE
VALIDATE $? "install mysql server"
systemctl  enable mysqld  &>>LOGFILE
VALIDATE $? "enabling mysql server"
systemctlb start mysqld &>>LOGFILE
VALIDATE $? "start mysql servere"