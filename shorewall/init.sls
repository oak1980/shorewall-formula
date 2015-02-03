{% from "shorewall/map.jinja" import shorewall with context %}

shorewall:
  pkg:
    - installed
    - name: {{ shorewall.pkg }}
  service.running:
    - enable: True
    - require:
      - pkg: shorewall

/usr/share/shorewall/macro.SaltMaster:
  file.managed:
    - source: salt://shorewall/files/macro.SaltMaster
    - require:
      - pkg: shorewall
    - watch_in:
      - service: shorewall

