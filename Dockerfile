# ビルドステージ
FROM adoptopenjdk/openjdk8:alpine as builder
WORKDIR /webapp

# プロジェクトの配置とビルド
ADD ./ ./
RUN ./gradlew war

# 本番用ステージ
FROM jetty:9-jdk8

EXPOSE 8080

COPY --from=builder ./webapp/build/libs/sample-app.war /var/lib/jetty/webapps
