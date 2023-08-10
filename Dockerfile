ARG video_folder=/var/www/html/videos

FROM nginx:alpine

WORKDIR /etc/nginx/conf.d
COPY webgl.conf default.conf

WORKDIR /Build
COPY Build/ .
# RUN mkdir -p ${video_folder}
COPY Build/Oil-Labs-Video.mp4 /var/www/html/videos/Oil-Labs-Video.mp4
# RUN  chmod 755 -R ${video_folder}
