# -*- coding: utf-8 -*-
# vim: ft=sls
---
{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mysql as map_jinja with context %}

{%- set output_file = '/tmp/salt_yaml_dump.yaml' %}
yaml-dump-{{ tplroot }}:
  cmd.run:
    - name: |
        tee <<EOF {{ output_file }} >/dev/null
        # $(date)
        # yamllint disable rule:indentation
        # {{ grains.osfinger }}-{{ grains.saltversion }}-py{{ grains.pythonversion[0] }}
        ---
        {{ map_jinja|yaml(False)|trim|indent(8) }}
        EOF
