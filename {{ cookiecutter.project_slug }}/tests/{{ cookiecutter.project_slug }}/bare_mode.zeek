# Running Zeek in "bare" mode will load the minimum necessary scripts.
# The default scripts in base/init-default are NOT loaded in this mode.
# Scripts SHOULD support being run in bare mode, by explictly @load-ing
# any default scripts which they rely on.
# This test will simply load your script/__load__.zeek in bare mode.
# If this is the only test tha fails, you are likely not @load-ing a dependency.
#
# @TEST-EXEC: $ZEEK --bare-mode %DIR/../../scripts
