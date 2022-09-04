# Laravel + Next.js + Adminerの環境

## ディレクトリ構造

````
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

`laravel_app`アプリ作成

````
/var/www/html# composer create-project "laravel/laravel=6.*" --prefer-dist laravelapp
````

`next_app`コンテナへアクセス

````
docker exec -it next_app bash
````

`next_app`アプリ作成

````
npx create-next-app nextapp --ts
````

