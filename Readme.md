# Laravel + Next.js + Adminerの環境

## ディレクトリ構造

````
laravel_next_docker
    ├── api // APIドキュメント
    ├── Docker
    │   ├── App // アプリケーションサーバーの設定ファイル
    │   ├── DB // データベースサーバーの設定ファイル
    │   └── Front // フロントサーバーーの設定ファイル
    ├── backend
    │   └── laravelapp // Laravelソースコード
    ├── docker-compose.yml
    └── frontend
        └── nextapp　// Next.jsソースコード
````

## Dockerコマンド

`laravel_app`コンテナへアクセス

````
docker exec -it laravel_app bash
````

`laravel_app`アプリクローン

````
/var/www/html# git clone https://github.com/yukihiroLaravel/juko_laravel.git laravelapp
````

`next_app`コンテナへアクセス

````
docker exec -it next_app bash
````

`next_app`アプリクローン

````
/www/html# git clone https://github.com/yukihiroLaravel/juko_next.git nextapp
````
