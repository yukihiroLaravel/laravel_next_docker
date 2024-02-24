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

## APIドキュメントの作成方法
APIドキュメントを作成する手順は以下の通りです。

1. `resource`ディレクトリ以下に、OpenAPIのYAMLファイルを配置します。既存のファイルを編集するか、新規作成します。
2. 新規作成した場合は、`swagger-config.json`に追記します。
3. 新規スキーマを定義する場合は、`schemas`ディレクトリ以下にYAMLファイルを配置します。
4. バンドルコマンドを実行します。
5. 結合コマンドを実行します。

### バンドルコマンド

以下のコマンドを実行して、APIドキュメントをバンドルします。

```shell
./bundle.sh
```

### 結合コマンド

以下のコマンドを実行して、APIドキュメントを結合します。

```shell
npx swagger-combine swagger-config.json -o combined-api.yaml -f yaml
```

### ドキュメントの確認

index.htmlの次の記述を更新する。

```html
    <script>
    window.onload = function() {

      // Build a system
      const ui = SwaggerUIBundle({
        url: "../openapi.yaml", // ここを変更
        dom_id: '#swagger-ui',
        deepLinking: true,
        presets: [
          SwaggerUIBundle.presets.apis,
          SwaggerUIStandalonePreset
        ],
        plugins: [
          SwaggerUIBundle.plugins.DownloadUrl
        ],
        layout: "StandaloneLayout"
      })

      window.ui = ui
    }
  </script>
```

Go Liveでindex.htmlを開く。

