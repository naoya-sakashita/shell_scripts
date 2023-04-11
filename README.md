# shell_scripts

## ユーザ追加
- useradd.sh
- addlist.txt

useradd.shが、addlist.txtに記載されたユーザIDとPWを読み込みユーザを作成する。

## LAMP環境構築スクリプト
- lampsetup.sh

以下のミドルウェアのインストールを行う。

  - Apache
  - MySQL
  - PHP
  - Laravel

scriptExecutionResultに、各ミドルウェアのバージョン情報とPHPのモジュールを追記している。

## 時刻設定
タイムゾーンをtokyo/asiaに設定するスクリプト
- timezone_setup.sh

## ログローテート設定スクリプト
- log_rotate,sh

cron設定は以下の通り
```
# crontab -e
59 23 * * * sh /root/shellscripts/log_rotate.sh
```
