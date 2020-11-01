#!/usr/bin/env xonsh

import argparse
from xonsh.lib.os import indir
from pathlib import Path


argp = argparse.ArgumentParser(description=f"Create versioned xonsh.")
argp.add_argument('-xv', '--xonsh-version', required=True, help="Xonsh version")
argp.add_argument('-xsr', '--xonsh-source-repo', required=True, help="Xonsh source repo i.e. https://github.com/anki-code/xonsh-xep-2")
argp.add_argument('-xtd', '--xonsh-target-dir', required=True, help="Xonsh target dir i.e. /tmp/xonsh-versioned")
argp.add_argument('-f','--force-rebuild', action='store_true', help=f"Remove xonsh_target_dir directory and force rebuild from scratch.")

opt = argp.parse_args()

printy = lambda t: printx(f'{{YELLOW}}{t}{{RESET}}')

opt.xonsh_target_dir = Path(opt.xonsh_target_dir)
xonsh_lib_dir = opt.xonsh_target_dir / 'xonsh'
xonsh_versioned_lib_dir = opt.xonsh_target_dir / f'xonsh{opt.xonsh_version}'

if opt.force_rebuild:
    rm -rf @(opt.xonsh_target_dir)

if xonsh_versioned_lib_dir.exists():
    printy(f'Versioned directory {xonsh_versioned_lib_dir} exists!')
    exit()

if not opt.xonsh_target_dir.exists():
    printy(f'[Git clone {opt.xonsh_source_repo} into {opt.xonsh_target_dir}]')
    git clone --depth 1 @(opt.xonsh_source_repo) @(opt.xonsh_target_dir)

if not xonsh_lib_dir.exists():
    printx("{YELLOW}Xonsh lib directory doesn't exists!{RESET}")
    exit()

printy(f'[Apply changes]')
with indir(opt.xonsh_target_dir):
    mv -v xonsh xonsh@(opt.xonsh_version)
    mv -v xontrib xontrib@(opt.xonsh_version)

    for dir in ['xonsh' + opt.xonsh_version, 'xontrib' + opt.xonsh_version, 'setup.py']:
        print(f'Replace in {dir}:')

        packages = ['xonsh', 'xontrib']
        begends = [('from ', ' '), (' ', r'\.'), ("'", r'\.'), ('"', r'\.'), ('"', r'\/'), ('"', '"'),
                   ('"', ' = '), ('^', r'\.'), ('del ', '$')]
        for package in packages:
            for begend in begends:
                beg, end = begend
                search = f"{beg}{package}{end}"

                beg = '' if beg == '^' else beg
                end = '' if end == '$' else end
                replace = f"{beg}{package}{opt.xonsh_version}{end}"

                print('  ', f'{search} --> {replace}')
                find @(dir) -type f -exec sed -i @('s/'+search+'/'+replace+'/g') '{}' '+'

    sed -i @('s/__version__ = /__version__ = \"xonsh'+opt.xonsh_version+' fork from \" + /g') @(xonsh_versioned_lib_dir)/__init__.py

printx('{GREEN}DONE{RESET}')