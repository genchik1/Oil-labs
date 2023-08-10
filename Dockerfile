ARG video_folder=/var/www/html/videos
ARG video_name=Oil-Labs-Video.mp4

FROM nginx:alpine

WORKDIR /etc/nginx/conf.d
COPY webgl.conf default.conf

WORKDIR /Build
COPY Build/ .
# RUN mkdir -p ${video_folder}
COPY Build/${video_name} ${video_folder}/${video_name}
# RUN  chmod 755 -R ${video_folder}
