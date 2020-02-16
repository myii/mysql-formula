# -*- coding: utf-8 -*-
# vim: ft=sls
---
{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mysql as map with context %}

{%- do salt.log.error('map\n' ~ map|yaml(False)) %}

mysql-yaml_dump-dummy:
  test.succeed_without_changes:
    - name: |
        Dummy message to pass the `.yaml_dump` state.
