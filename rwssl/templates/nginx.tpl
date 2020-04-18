############################################################################### 
# This conf file was auto-generated by rwssl script
# Author: Rehmat Alam
# GitHub Repo: (https://github.com/rehmatworks/serverpilot-letsencrypt/)
# Twitter: https://twitter.com/rehmatworks
# Email: contact@rehmat.works
###############################################################################

server {
    listen       80;
    listen       [::]:80;
    server_name {{ servername }}{% if serveralias %} {{ serveralias }}{% endif %};

    root   /srv/users/{{ username }}/apps/{{ appname }}/public;

    access_log  /srv/users/{{ username }}/log/{{ appname }}/{{ appname }}_nginx.access.log  main;
    error_log  /srv/users/{{ username }}/log/{{ appname }}/{{ appname }}_nginx.error.log;

    proxy_set_header    Host              $host;
    proxy_set_header    X-Real-IP         $remote_addr;
    proxy_set_header    X-Forwarded-For   $proxy_add_x_forwarded_for;

    include /etc/nginx-sp/vhosts.d/{{ appname }}.d/*.nonssl_conf;
    include /etc/nginx-sp/vhosts.d/{{ appname }}.d/*.conf;
}
