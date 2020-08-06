##! This is processed when a user explicitly loads the plugin's script module
##! through `@load {{ cookiecutter.project_namespace }}/{{ cookiecutter.project_slug }}`.
##! Include code here that should execute at that point.
##!
##! This is the most common entry point to your plugin's accompanying scripts.
##!
##! File load order, always happens
##!   1. Zeek startup
##!   2. Plugin activation
##!   3. __preload__.zeek always gets loaded
##!   4. __load__.zeek always gets loaded
##!
##! ONLY IF the plugin gets loaded via `@load {{ cookiecutter.project_namespace }}/{{ cookiecutter.project_slug }}`, this continues:
##!   5. @load {{ cookiecutter.project_namespace }}/{{ cookiecutter.project_slug }}/__load__.zeek <-- YOU ARE HERE

@load ./main
