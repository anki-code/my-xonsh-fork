#!/usr/bin/env python

import setuptools

try:
    with open('README.md', 'r', encoding='utf-8') as fh:
        long_description = fh.read()
except (IOError, OSError):
    long_description = ''

setuptools.setup(
    name='my-xonsh-fork',
    version='0.0.3',
    license='BSD',
    author='anki-code',
    author_email='author@example.com',
    description="Convert your xonsh fork package name to the new.",
    long_description=long_description,
    long_description_content_type='text/markdown',
    python_requires='>=3.6',
    scripts=['my-xonsh-fork'],
    packages=setuptools.find_packages(),
    platforms='any',
    url='https://github.com/anki-code/my-xonsh-fork',
    project_urls={
        "Documentation": "https://github.com/anki-code/my-xonsh-fork/blob/master/README.md",
        "Code": "https://github.com/anki-code/my-xonsh-fork",
        "Issue tracker": "https://github.com/anki-code/my-xonsh-fork/issues",
    },
    classifiers=[
        "License :: OSI Approved :: BSD License"
    ]
)
