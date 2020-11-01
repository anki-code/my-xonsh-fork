<p align="center">
<b>my-xonsh-fork</b> is to convert your xonsh fork package name to the new <br>i.e. <code>xonsh</code> becomes <code>xonsh42</code> and you can run it, add it to shebang or import in python. 
</p>

## How it works

1. You have your own fork of original xonsh repository.
2. You want to install it on your host. But you don't want to lose the original xonsh on your host. You don't want to rename xonsh package in your fork code to have an ability to pull the changes from the original xonsh repository without conflicts.
3. When you run `my-xonsh-fork` it make a clone of the source git repo and replaces `xonsh` directory, calls, paths with the `xonsh{FORK_NAME}` i.e. `xonsh2`.
4. Then you can install this package using `pip`.
5. As result you'll have `xonsh` on the host along with `xonsh2`. You can use both `xonsh` and `xonsh2` in the sheband of your scripts i.e. `#!/usr/bin/env xonsh2`.
6. Enjoy! :)

## Install
```python
mkdir -p ~/git/my-xonsh-fork
cd ~/git/my-xonsh-fork
```

## Usage
```
usage: my-xonsh-fork.xsh [-h] -n FORK_NAME -s SOURCE_REPO [-t TARGET_REPO] -d TARGET_DIR [-f]

Convert your xonsh fork package name to the new.

optional arguments:
  -h, --help            show this help message and exit
  -n FORK_NAME, --fork-name FORK_NAME
                        Fork name i.e. `-n 2` will create `xonsh2` fork.
  -s SOURCE_REPO, --source-repo SOURCE_REPO
                        Source repo i.e. git@github.com:anki-code/xonsh-xep-2.git
  -t TARGET_REPO, --target-repo TARGET_REPO
                        Target empty repo to push the result i.e. git@github.com:anki-code/xonsh2.git
  -d TARGET_DIR, --target-dir TARGET_DIR
                        Target dir i.e. /tmp/xonsh2
  -f, --force-rebuild   Remove XONSH_TARGET_DIR and rebuild from scratch.
```

## Example
For example you want to have two packages: `xonsh` with original xonsh and `xonsh2` - your fork of original xonsh. 

To achieve this here is the example based on [XEP-2 fork](https://github.com/anki-code/xonsh-xep-2): 
```python
./my-xonsh-fork.xsh -n 2 -s git@github.com:anki-code/xonsh-xep-2.git -d /tmp/xonsh2 -f
pip install -U /tmp/xonsh2
xonsh2 --no-rc
```
If you want to push the renamed fork to new repo use ``--target-repo`` argument.

## .xonshrc, rc.xsh and xontrib

If your fork has name `2` (i.e. `./my-xonsh-fork.xsh -n 2 ...`) then the new names of RC files and xontrib command will be: `.xonshrc_2`, `rc_2.xsh` and `xontrib2`. 