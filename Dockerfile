ARG video_folder=/var/www/html/videos
ARG video_path=Build/Oil-Labs-Video.mp4

FROM nginx:alpine

WORKDIR /etc/nginx/conf.d
COPY webgl.conf default.conf

WORKDIR /Build
COPY Build/ .
RUN mkdir ${video_folder}
COPY ${video_path} ${video_folder}
RUN  chmod 755 -R ${video_folder}
