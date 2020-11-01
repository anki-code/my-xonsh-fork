<p align="center">
<b>my-xonsh-fork</b> is to convert your xonsh fork package name to the new <br>i.e. <code>xonsh</code> becomes <code>xonsh42</code> and you can run it, add it to shebang or do `import`. 
</p>

## How it works

1. You have your own fork of original xonsh repository.
2. You want to install it on your host but you don't want to lose the original xonsh on your host and you don't want to rename xonsh package in your fork code to have an ability to pull the changes from the original xonsh repository without conflicts.
3. When you run `my-xonsh-fork` it make a clone of the source git repo and replaces `xonsh` directory, calls, paths with the `xonsh{FORK_NAME}` i.e. `xonsh2`.
4. Then you can install this package using `pip`.
5. As result you'll have `xonsh` on the host along with `xonsh2`. You can use both `xonsh` and `xonsh2` in the sheband of your scripts i.e. `#!/usr/bin/env xonsh2`.
6. Enjoy! :)

## Install
```python
mkdir -p ~/git/my-xonsh-fork
cd ~/git/my-xonsh-fork
```

## Example
For example you want to have two packages: `xonsh` with original xonsh and `xonsh2` - your fork of original xonsh. 

To achieve this here is the example based on [XEP-2 fork](https://github.com/anki-code/xonsh-xep-2): 
```python
./my-xonsh-fork.xsh -n 2 -xsr git@github.com:anki-code/xonsh-xep-2.git -xtd /tmp/xonsh2 -f
pip install -U /tmp/xonsh2
xonsh2 --no-rc
```
If you want to push it back to new repo:
```python
new_repo = 'git@github.com:YOURGITHUBNAME/YOURNEWREPO.git'
cd /tmp/xonsh2
git add -A
git commit -m 'My xonsh fork!'
git remote rename origin upstream
git remote add origin @(new_repo)
git push origin master
```

## .xonshrc and rc.xsh

If your fork has name `2` (i.e. `./my-xonsh-fork.xsh -n 2 ...`) then it will expect `.xonshrc_2` and `rc_2.xsh` name 
for xonsh RC files. 

## Known issues

Note! That if you try to load xontribs from original xonsh they could fail in your fork.

