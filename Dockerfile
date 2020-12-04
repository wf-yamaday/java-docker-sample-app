# ビルドステージ
FROM adoptopenjdk/openjdk8:alpine as builder
WORKDIR /webapp

# プロジェクトの配置とビルド
ADD ./ ./
RUN ./gradlew war

# プロダクション用ステージ
FROM tomcat:jdk8-adoptopenjdk-hotspot

EXPOSE 8080

COPY --from=builder ./webapp/build/libs/sample-app.war /usr/local/tomcat/webapps
