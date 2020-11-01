<p align="center">
<b>xonsh-versioning</b> is to create versioned xonsh package. For example you have your own fork of xonsh 
and you want to install and use this fork along with original xonsh without affection or intersection.
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

## Known issues

#### .xonshrc and xontribs

Note! That if you have `.xonshrc` or xontribs from original xonsh they could fail in your fork.
To get interactive mode without errors run `xonsh2 --no-rc`. 


