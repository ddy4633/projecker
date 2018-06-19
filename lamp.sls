
apache-server:
  pkg.installed:
    - names:
      - httpd
apache-config:
  file.managed:
    - name: /etc/httpd/conf/httpd.conf
    - source: salt://lamp/files/httpd.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults: 
       PORT: 88
apache-running:
  service.running:
    - name: httpd
    - enable: True
    - reload: True
    - watch:
      - file: apache-config

mysq-server:
  pkg.installed:
    - names: 
      - mariadb
      - mariadb-server
  file.managed:
    - name: /etc/my.cnf
    - source: salt://lamp/files/my.cnf
    - user: root
    - group: root
    - mode: 644
  service.running:
    - name: mariadb
    - enable: True
    - reload: True

php-server:
  pkg.installed:
    - names:
      - php
      - php-mysql
      - php-cli
      - php-mbstring
      - php-fpm
  file.managed:
    - name: /etc/php.ini
    - source: salt://lamp/files/php.ini
    - user: root
    - group: root
    - mode: 644
  service.running:
    - name: php-fpm
    - enable: True
    - reload: True
