{% set header -%}Zeek Package Documentation: {{ cookiecutter.project_name }}{% endset -%}
 :orphan:

{% for i in header -%}={% endfor %}
{{ header }}
{% for i in header -%}={% endfor %}

Package README
==============

The top-level README has information on how to install and test this Zeek Package.

.. toctree::
   :maxdepth: 2

   README.rst

.. include:: scripts/package.rst

Reference
=========

.. toctree::

   scripts/index.rst
   genindex
