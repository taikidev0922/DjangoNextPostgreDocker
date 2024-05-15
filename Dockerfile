# ベースイメージ
FROM python:3.9

# 作業ディレクトリを設定
WORKDIR /app

# 必要なパッケージをインストール
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Gitをインストール
RUN apt-get update && apt-get install -y git

# プロジェクトファイルをコピー
COPY . /app/

# Djangoプロジェクトのポートを公開
EXPOSE 8000

# サービスを起動するためのコマンド
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
