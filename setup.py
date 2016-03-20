#!/usr/bin/env python
import io
import sys

from setuptools import find_packages, setup


def read(*filenames, **kwargs):
    encoding = kwargs.get('encoding', 'utf-8')
    sep = kwargs.get('sep', '\n')
    buf = []
    for filename in filenames:
        with io.open(filename, encoding=encoding) as f:
            buf.append(f.read())
    return sep.join(buf)

description = "A silly simple time tracker"
long_description = read('README.rst')
testing = bool({'pytest', 'test'}.intersection(sys.argv))

setup(
    name="ti",
    version="0.1.0",
    author="Shrikant Sharat",
    author_email="shrikantsharat.k@gmail.com",
    packages=find_packages(),
    include_package_data=True,
    scripts=[],
    url="http://ti.sharats.me/",
    description=description,
    long_description=long_description,
    entry_points={
        'console_scripts': [
            'ti = ti:main',
        ]
    },
    install_requires=["colorama", "pyyaml"],
    setup_requires=["pytest-runner"] if testing else [],
    tests_require=["pytest", "cram", "pytest-cram"],
    extras_require={
        'docs': ["ghp-import", "pygreen"],
    }
)
