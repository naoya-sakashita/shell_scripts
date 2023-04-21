#!/bin/bash

## installをしたミドルウェアのバージョンを追記するファイルを作成
touch scriptExecutionResult

## apache install & 自動起動設定
sudo dnf install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd

## epelのインストール
yum config-manager --set-enabled crb
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm

## remiのインストール
yum install https://rpms.remirepo.net/enterprise/remi-release-9.rpm
yum config-manager --set-enabled remi

## php install
yum module enable php:remi-7.4
yum install php -y

# mysql install
dnf localinstall https://dev.mysql.com/get/mysql80-community-release-el8-3.noarch.rpm
dnf install mysql-community-server -y

## composer install
dnf --enablerepo=epel -y install composer

## バージョン諸々をリダイレクトで上書き
httpd -v | head -n 1 >> scriptExecutionResult
mysqld --version >> scriptExecutionResult
composer --version >> scriptExecutionResult
php -v >> scriptExecutionResult
php -m >> scriptExecutionResult
