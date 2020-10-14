# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
import os
import sys
sys.path.insert(0, os.path.abspath('sphinxcontrib'))

# -- Project information -----------------------------------------------------
project = 'zkg: Windows Version Detection'
copyright = '2020, The Regents of the University of California through the Lawrence Berkeley National Laboratory and the International Computer Science Institute'
version = "source"

try:
    # Use the actual version if available
    with open('../VERSION', 'r') as f:
        version = f.readline().strip()
except OSError:
    import git

    try:
        repo = git.Repo(os.path.abspath('.'))
        version = u"git/master"
        tag = [str(t) for t in repo.tags if t.commit == repo.head.commit]

        if tag:
            version = tag[0]

    except git.exc.GitError:
        pass

# The full version, including alpha/beta/rc tags.
release = version

# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = ['zeek', 'sphinx.ext.githubpages', 'sphinx.ext.intersphinx']

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = []

# -- Zeek configuration --------------------------------------------------------
intersphinx_mapping = {
    'zeek': ('https://docs.zeek.org/en/current', None),
}

highlight_language = 'zeek'

# -- Options for HTML output ---------------------------------------------------

import sphinx_rtd_theme
html_theme = 'sphinx_rtd_theme'
html_theme_path = [sphinx_rtd_theme.get_html_theme_path()]

# Theme options are theme-specific and customize the look and feel of a theme
# further.  For a list of options available for each theme, see the
# documentation.
html_theme_options = {
    'collapse_navigation': False,
    'display_version': True,
}

html_static_path = ['_static']

def setup(app):
    from sphinx.highlighting import lexers
    from pygments.lexers.dsls import ZeekLexer
    lexers['zeek'] = ZeekLexer()

# Output file base name for HTML help builder.
htmlhelp_basename = 'zeek-pkg-docs'
