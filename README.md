<p align="center">
<b>xonsh-versioning</b> is to create versioned xonsh package. 
</p>

<p align="center">
For example you have your own fork of xonsh 
and you want to install and use this fork along with original xonsh without affection or intersection. But you can't 
implement versioning in your fork source code to avoid conflicts on merging with original xonsh. 
In this case xonsh-versioning will help you to create separate version from your fork source code 
and use it shoulder by shoulder with original xonsh.
</p>

## Install
```python
mkdir -p ~/git/xonsh_versioning
cd ~/git/xonsh_versioning
```

## Example
For example you want to have two packages: `xonsh` with original xonsh and `xonsh2` - your fork of original xonsh. 

To achieve this here is the example based on [XEP-2 fork](https://github.com/anki-code/xonsh-xep-2): 
```python
./xonsh_versioning.xsh -xv 2 -xsr https://github.com/anki-code/xonsh-xep-2 -xtd /tmp/xonsh2 -f
pip install -U /tmp/xonsh2
xonsh2 --no-rc
```

## .xonshrc and rc.xsh

If your fork have version `2` (i.e. `./xonsh_versioning.xsh -xv 2 ...`) then it will expect `.xonshrc_2` and `rc_2.xsh` name 
for xonsh RC files.

## Known issues

#### xontribs

Note! That if you try to load xontribs from original xonsh they could fail in your fork.

