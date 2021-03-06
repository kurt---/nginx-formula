include:
  - nginx.ng.service


{% from 'nginx/ng/map.jinja' import nginx, sls_block with context %}


/etc/nginx/conf.d/blacklist.conf:
  file.managed:
    - source: {{ nginx.badbot.config.source_url }}
    - user: root
    - group: root
    - mode: 644
    - source_hash: {{ nginx.badbot.config.source_hash }}
    - watch_in:
      - service: nginx_service
