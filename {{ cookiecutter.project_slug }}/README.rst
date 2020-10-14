{% set is_open_source = cookiecutter.open_source_license != 'Not open source' -%}
{% set logo = 'data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyBpZD0iTGF5ZXJfMSIgZGF0YS1uYW1lPSJMYXllciAxIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyMS4zNyAyMy4yNyI+PGRlZnM+PHN0eWxlPi5jbHMtMXtmaWxsOiNmZmY7fTwvc3R5bGU+PC9kZWZzPjxwYXRoIGNsYXNzPSJjbHMtMSIgZD0iTTYuMjYsMTEuMzVhLjcuNywwLDAsMS0uNDYtLjE4bC01LjU4LTVBLjY5LjY5LDAsMCwxLDAsNS43YS43Mi43MiwwLDAsMSwuMTgtLjQ5bDAsMCwuMDUsMGgwbDUuNTQtNUEuNy43LDAsMCwxLDYuMjcsMGEuNi42LDAsMCwxLC4yNy4wNkEuNjcuNjcsMCwwLDEsNywuNjhMNi42OSwyLjkxSDE5LjgzYS42Ny42NywwLDAsMSwuNjEuMzkuNjguNjgsMCwwLDEtLjA4LjcxbC0xLjg0LDIuM2EuNjUuNjUsMCwwLDEtLjUyLjI1LjY4LjY4LDAsMCwxLS42OC0uNi42NS42NSwwLDAsMSwuMTUtLjVsMS0xLjE5SDZhLjY4LjY4LDAsMCwxLS42Ny0uNjhsLjE4LTEuMjdMMS42OCw1LjY4LDUuNDcsOSw1LjI5LDcuOEEuNjguNjgsMCwwLDEsNiw3LjA4bDEuMzYtLjE1LDAsLjYtLjExLS40Mi4wNi40M2EuMjEuMjEsMCwwLDAtLjE4LjIxQS4yMi4yMiwwLDAsMCw3LjMzLDh2LjFsMCwuNS0uNjItLjA2LjI2LDIuMTNhLjY4LjY4LDAsMCwxLS40MS42NUEuNjYuNjYsMCwwLDEsNi4yNiwxMS4zNVoiLz48cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0xNS4wOSwyMy4yN2EuNTguNTgsMCwwLDEtLjI2LS4wNi42OC42OCwwLDAsMS0uNDEtLjYybC4yNi0yLjI0SDEuNTRBLjcxLjcxLDAsMCwxLC45MiwyMCwuNjkuNjksMCwwLDEsMSwxOS4yNUwyLjg0LDE3YS42Ny42NywwLDAsMSwuNTMtLjI1LjcxLjcxLDAsMCwxLC40Mi4xNC42Ny42NywwLDAsMSwuMjUuNDYuNjkuNjksMCwwLDEtLjE0LjVMMywxOUgxNS4zOWEuNjcuNjcsMCwwLDEsLjY4LjY3TDE1Ljg5LDIxbDMuNzktMy4zN0wxNS45LDE0LjI0bC4xOCwxLjIyYS42OC42OCwwLDAsMS0uNjcuNzJMMTQsMTYuMzRsMC0uNjFoLjA3YS4yMy4yMywwLDAsMCwuMTctLjIyQS4yMi4yMiwwLDAsMCwxNCwxNS4zaDBsMC0uNnYuNWwuMDYtLjQ5LjU5LjA1LS4yNi0yLjEyYS42OS42OSwwLDAsMSwuNDEtLjY2LjU5LjU5LDAsMCwxLC4yNy0uMDUuNjcuNjcsMCwwLDEsLjQ2LjE4bDUuNTgsNWEuNjkuNjksMCwwLDEsLjIyLjQ4LjY2LjY2LDAsMCwxLS4xOS40OGwwLDAsMCwwLTUuNTUsNUEuNjguNjgsMCwwLDEsMTUuMDksMjMuMjdaIi8+PHBhdGggY2xhc3M9ImNscy0xIiBkPSJNNy4yMSwxNi4zNGEuODMuODMsMCwwLDEtLjc1LS40OEEuODEuODEsMCwwLDEsNi41OCwxNUwxMiw4LjU4SDcuMzJsLS4wNiwwYS44MS44MSwwLDAsMS0uNzMtLjgxLjgyLjgyLDAsMCwxLC43OS0uODJoNi41MWEuODMuODMsMCwwLDEsLjYzLDEuMzZMOSwxNC42OWg1YS44My44MywwLDAsMSwwLDEuNjVINy4yMVoiLz48L3N2Zz4=' -%}

Zeek Package for {{ cookiecutter.project_name }}
================================================

.. image:: https://img.shields.io/github/workflow/status/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/Zeek%20master?label=master&logo={{ logo }}
   :target: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions?query=workflow%3A%22Zeek+master%22
   :alt: Zeek master Test Status

.. image:: https://img.shields.io/github/workflow/status/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/Documentation?label=Docs&logo=read-the-docs
   :target: https://{{ cookiecutter.github_username }}.github.io/{{ cookiecutter.project_slug }}/
   :alt: Documentation Status

.. image:: https://coveralls.io/repos/github/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/badge.svg?branch=master
   :target: https://coveralls.io/repos/github/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}?branch=master
   :alt: Coverage Status

.. image:: https://img.shields.io/github/workflow/status/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/Cruft?label=Latest%20Template
   :target: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions?query=workflow%3ACruft
   :alt: Template Status

{{ cookiecutter.project_short_description }}

Quick Start
-----------

If you already have Zeek and ``zkg`` installed, simply run:

.. code-block:: console

    zkg install https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}

If this is being installed on a cluster, install the package on the manager, then deploy it via:

.. code-block:: console

    zeekctl deploy

Updating and Unloading
----------------------

We use `SemVer <http://semver.org/>`_ for versioning. For the versions
available, see the `tags on this repository <../../tags>`_. You can
pass an additional argument to the ``install`` command with the desired
version.

To upgrade to the latest version run:

.. code-block:: console

    zkg upgrade {{ cookiecutter.project_slug }}

You can modify the above command by replacing ``upgrade`` with:

* ``unload``, to configure Zeek to not load the package on startup.
* ``load``, to configure Zeek to load the package on startup (default after an install).
* ``remove``, to delete the package from the system.

If you're operating in a cluster, after performing any of the above changes, you'll need to re-run ``zeekctl deploy``.

Installation
------------

.. image:: https://img.shields.io/github/workflow/status/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/Zeek%203.0?label=v3.0&logo={{ logo }}
   :target: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions?query=workflow%3A%22Zeek+3.0%22
   :alt: Zeek v3.0 Test Status

.. image:: https://img.shields.io/github/workflow/status/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/Zeek%203.1?label=v3.1&logo={{ logo }}
   :target: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions?query=workflow%3A%22Zeek+3.1%22
   :alt: Zeek v3.1 Test Status

.. image:: https://img.shields.io/github/workflow/status/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/Zeek%203.2?label=v3.2&logo={{ logo }}
   :target: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions?query=workflow%3A%22Zeek+3.2%22
   :alt: Zeek v3.2 Test Status

.. image:: https://img.shields.io/github/workflow/status/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/Zeek%203.3?label=v3.3&logo={{ logo }}
   :target: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions?query=workflow%3A%22Zeek+3.3%22
   :alt: Zeek v3.3 Test Status

This is a package designed to run with the `Zeek Network Security Monitor <https://zeek.org>`__. First, `get Zeek <https://zeek.org/get-zeek/>`_. We strive to support both the current feature and LTS releases.

The recommended installation method is via the `Zeek package manager, zkg <https://docs.zeek.org/projects/package-manager/en/stable/>`_. Follow the `Quickstart guide <https://docs.zeek.org/projects/package-manager/en/stable/quickstart.html>`_.

To have Zeek load packages managed by ``zkg``, ensure that ``@load packages`` is being loaded by Zeek.

This package is also tested with the following legacy Zeek (Bro) versions, although their use is strongly discouraged, due to security and performance issues and continued compatability is not supported.

.. image:: https://img.shields.io/github/workflow/status/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/Zeek%202.6?label=v2.6&logo={{ logo }}
   :target: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions?query=workflow%3A%22Zeek+2.6%22
   :alt: Zeek v2.6 Test Status

.. image:: https://img.shields.io/github/workflow/status/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/Zeek%202.5?label=v2.5&logo={{ logo }}
   :target: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions?query=workflow%3A%22Zeek+2.5%22
   :alt: Zeek v2.5 Test Status

.. image:: https://img.shields.io/github/workflow/status/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/Zeek%202.4?label=v2.4&logo={{ logo }}
   :target: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions?query=workflow%3A%22Zeek+2.4%22
   :alt: Zeek v2.4 Test Status

.. image:: https://img.shields.io/github/workflow/status/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/Zeek%202.3?label=v2.3&logo={{ logo }}
   :target: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions?query=workflow%3A%22Zeek+2.3%22
   :alt: Zeek v2.3 Test Status

.. image:: https://img.shields.io/github/workflow/status/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/Zeek%202.2?label=v2.2&logo={{ logo }}
   :target: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions?query=workflow%3A%22Zeek+2.2%22
   :alt: Zeek v2.2 Test Status

.. image:: https://img.shields.io/github/workflow/status/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/Zeek%202.1?label=v2.1&logo={{ logo }}
   :target: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions?query=workflow%3A%22Zeek+2.1%22
   :alt: Zeek v2.1 Test Status

.. image:: https://img.shields.io/github/workflow/status/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/Zeek%202.0?label=v2.0&logo={{ logo }}
   :target: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions?query=workflow%3A%22Zeek+2.0%22
   :alt: Zeek v2.0 Test Status

.. include:: docs/contributing.rst

License
-------

{% if is_open_source %}This project is licensed under the {{ cookiecutter.open_source_license }}.{% endif %} See the `LICENSE <./LICENSE>`_ file for details.
