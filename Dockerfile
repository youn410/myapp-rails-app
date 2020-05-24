FROM ruby:2.5.3

# 必要パッケージ
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs

# 作業ディレクトリ設定
RUN mkdir /app
ENV APP_ROOT /app
WORKDIR $APP_ROOT

# ホスト側（ローカル）のGemfileを追加
COPY ./src/Gemfile $APP_ROOT/Gemfile
COPY ./src/Gemfile.lock $APP_ROOT/Gemfile.lock

# Gemfileのbundle install
RUN bundle install
COPY ./src/ $APP_ROOT