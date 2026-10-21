# Laravel + Next.js

学習目的のフルスタック構成リポジトリ。
バックエンド (Laravel + MySQL) は Docker、フロントエンド (Next.js) はホストで実行します。

## ディレクトリ構造

```
laravel_next_docker
├── api                  # APIドキュメント
├── Docker
│   ├── App              # Laravelアプリケーションサーバー
│   └── DB               # MySQLデータベース
├── backend
│   └── laravelapp       # Laravelソースコード
├── frontend
│   └── juko_next        # Next.jsソースコード
├── compose.yml
└── mise.toml            # Node/pnpmバージョン定義
```

## 前提

### 共通

- Docker Desktop（バックエンド/DB用）
- [mise](https://mise.jdx.dev/)（Node.js / pnpm のバージョン管理）
  - 言語ランタイムのバージョンをプロジェクト単位で自動切替できるツール（asdf後継・Rust製）
  - 本プロジェクトでは `mise.toml` で Node/pnpm のバージョンを定義しているため、`mise install` 一発で全員同じ環境が作れる
  - 代替: Volta / fnm / nvm などでも可（その場合は `mise.toml` 記載のバージョンを各自で揃える）

#### mise のインストール

| OS | コマンド |
|---|---|
| macOS | `brew install mise` |
| WSL2 (Ubuntu等) | `curl https://mise.run \| sh` |

インストール後、シェルに以下を追加して有効化します（公式の[手順](https://mise.jdx.dev/getting-started.html)も参照）。

```bash
# bash
echo 'eval "$(mise activate bash)"' >> ~/.bashrc

# zsh
echo 'eval "$(mise activate zsh)"' >> ~/.zshrc

# fish
echo 'mise activate fish | source' >> ~/.config/fish/config.fish
```

### Windows ユーザー向け

- WSL2 (Ubuntu 等) 上で作業すること を前提とします。
  - リポジトリは WSL2 のホームディレクトリ配下 (`~/...`) に置いてください。Windows 側 (`/mnt/c/...`) に置くとファイル I/O とウォッチが極端に遅くなります。
- Docker Desktop は WSL2 integration を有効にしてください。

## セットアップ

### 1. Node.js / pnpm の準備

mise を使う場合は、リポジトリルートで以下を実行するだけで `mise.toml` に書かれたバージョンが自動で入ります。

```bash
mise install
```

mise を使わない場合は、`mise.toml` に書かれた Node.js と pnpm のバージョンを各自でインストールしてください。

### 2. バックエンド (Laravel + MySQL) の起動

```bash
docker compose up -d
```

- Laravel: http://localhost:8080
- Adminer (DB GUI): http://localhost:8088
- MySQL: localhost:13306

### 3. フロントエンド (Next.js) の起動

```bash
cd frontend/juko_next
cp .env.example .env.local
pnpm install
pnpm dev
```

→ http://localhost:3000

## よく使うコマンド

### バックエンド

`laravel_app` コンテナへアクセス:

```bash
docker exec -it laravel_app bash
```

### フロントエンド

```bash
cd frontend/juko_next

pnpm lint           # ESLint
pnpm type-check     # 型チェック
pnpm format         # Prettier整形
pnpm build          # 本番ビルド
```

## ソースコードの取得

各アプリケーションのソースは別リポジトリで管理されています。

```bash
# Laravel
cd backend && git clone https://github.com/yukihiroLaravel/juko_laravel.git laravelapp

# Next.js
cd frontend && git clone https://github.com/yukihiroLaravel/juko_next.git
```
