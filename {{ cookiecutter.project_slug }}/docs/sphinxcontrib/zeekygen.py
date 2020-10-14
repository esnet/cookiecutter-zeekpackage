from sphinx.errors import SphinxError

import os
import shutil
import subprocess
import tempfile

from sphinx.util import logging

logger = logging.getLogger(__name__)

cwd = os.path.abspath(os.getcwd())
pkg_script_dir = os.path.abspath(os.path.join(cwd, "..", "scripts"))
rst_script_dir = os.path.join(cwd, "scripts")
rst_output_dir = os.path.join(cwd, "build")
rst_packages_dir = os.path.join(rst_output_dir, "packages")
temp_script_index = os.path.join(rst_script_dir, "tempindex")
script_index = os.path.join(rst_script_dir, "index.rst")
package_index = os.path.join(rst_packages_dir, "package_index.rst")
package_name = os.path.basename(os.path.abspath(os.path.join(cwd, "..")))

try:
    shutil.rmtree(rst_script_dir)
except FileNotFoundError:
    pass

os.makedirs(rst_script_dir, exist_ok=True)
os.makedirs(rst_packages_dir, exist_ok=True)


def run_zeek_on_files(path, filenames, base=pkg_script_dir):
    for f in filenames:
        if not f.endswith(".zeek"):
            continue
        path = path.replace(base + "/", "")
        path = path.replace(base, "")
        run_zeek_script(os.path.join(path, f))


def run_zeek_script(script):
    """Runs zeek for a single script"""
    output = os.path.join(rst_script_dir, script + ".rst")
    conf = "\t".join(["script", script, output]) + "\n"
    conf += "\t".join(["script_index", script, temp_script_index]) + "\n"
    run_zeek(script, conf)

    if not os.path.exists(script_index):
        shutil.copy(temp_script_index, script_index)
    else:
        with open(temp_script_index) as temp_index:
            data = temp_index.readlines()
            with open(script_index, "a") as index:
                # Chomp the headers
                index.writelines(data[3:])
    os.remove(temp_script_index)


def run_zeek_package(packages):
    """Runs zeek for a package"""

    conf = ""
    for p in packages:
        conf += (
            "\t".join(["package", p, rst_script_dir + "/" + p + "/index.rst"]) + "\n"
        )
    run_zeek(" ".join(packages), conf)


def run_zeek(name, config):
    """Runs zeek with a given Zeekygen config"""

    if not name:
        return

    logger.info("Running Zeekygen on %s", name)
    with tempfile.TemporaryDirectory() as tmp:
        path = os.path.join(tmp, "zeekygen.cfg")
        with open(path, "w") as f:
            f.write(config)
        result = subprocess.run(["zeek", "-b", "-X", path, name])
        if result.stderr:
            logger.error("Zeek returned: %s", result.stderr)
        if result.returncode != 0:
            raise SphinxError("Zeekygen failed")


def run_cmd(cmd):
    """Runs a command and returns stdout"""
    return subprocess.run(cmd, stdout=subprocess.PIPE).stdout.decode("utf-8")


def setup(app):
    """Zeek will run and generate the ReST files, which Sphinx will then
    convert to HTML. """

    if "ZEEK_DISABLE_ZEEKYGEN" in os.environ:
        del os.environ["ZEEK_DISABLE_ZEEKYGEN"]

    os.environ["ZEEK_ALLOW_INIT_ERRORS"] = "1"

    # To get a useful name for our package, we'll create a symlink:
    # packages/my-package-name -> scripts
    with tempfile.TemporaryDirectory() as td:
        os.makedirs(os.path.join(td, "packages"))
        fakepath = os.path.join(td, "packages", package_name)
        try:
            os.symlink(pkg_script_dir, fakepath)
        except FileExistsError:
            pass

        zeekpath = td + ":" + run_cmd(["zeek-config", "--zeekpath"])
        os.environ["ZEEKPATH"] = zeekpath

        for path, subdirs, tmp_filenames in os.walk(fakepath):
            filenames = [os.path.relpath(os.path.join(path, f), td) for f in tmp_filenames]
            run_zeek_on_files(td, filenames, td)

        packages = [os.path.join("packages", package_name)]

        run_zeek_package(packages)

    # Now we need to fix up some references to the remote docs
    for path, dirs, files in os.walk(rst_script_dir):
        for rst_file in files:
            if not rst_file.endswith(".rst"):
                continue
            with open(os.path.join(path, rst_file), "r+") as f:
                orig_data = f.read()
                data = orig_data.replace(" </scripts/base/", " <scripts/base/")
                data = data.replace(" </scripts/policy/", " <scripts/policy/")
                if data != orig_data:
                    logger.info("Fixing links in %s", rst_file)
                    f.seek(0)
                    f.write(data)


    # Generate the package index
    with open(package_index, "w") as f:
        f.write(".. toctree::\n   :maxdepth: 2\n\n")
        for p in packages:
            f.write("   " + p + "</scripts/" + p + "/index>")
        f.write("\n")
