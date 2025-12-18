FROM node:24-bookworm-slim

# pnpmをcorepackで有効化
RUN corepack enable && corepack prepare pnpm@latest --activate

# pnpm設定（Dockerボリューム対応）
RUN pnpm config set package-import-method copy --global && \
    pnpm config set node-linker hoisted --global

# 作業ディレクトリ設定
WORKDIR /www/html/juko_next

# 開発用ポート公開
EXPOSE 3000

# デフォルトコマンド（開発サーバー起動）
CMD ["pnpm", "dev"]
