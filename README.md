<p align="center">
<b>xonsh-versioning</b> is to create versioned xonsh package. For example you have your own fork of xonsh 
and you want to install and use this fork along with original xonsh without affection or intersection.
</p>

## Install
```python
mkdir ~/git/xonsh_versioning
cd ~/git/xonsh_versioning
```

## Example
For example you want to have two packages: `xonsh` with original xonsh and `xonsh2` - your fork of original xonsh. 
In this case you'll have script both with `#!/usr/bin/env xonsh` shebang and `#!/usr/bin/env xonsh2` shebang 
and you can run `xonsh` or `xonsh2` interactive mode.

To achieve this here is the example based on [XEP-2 fork](https://github.com/anki-code/xonsh-xep-2): 
```python
./xonsh_versioning.xsh -xv 2 -xsr https://github.com/anki-code/xonsh-xep-2 -xtd /tmp/xonsh2 -f
pip install -U /tmp/xonsh2
xonsh2 
```
