#!/usr/bin/env python
# -*- coding: utf-8 -*-
# -*- python -*-

from setuptools import find_packages, setup

setup(
    name="docx",
    version="0.0.1",
    description="A simple python library to read docx files",
    author="Shin Yoshida",
    packages=find_packages(),
    license="MIT",
    scripts=["bin/docx2xml", "bin/xml2text", "bin/pretty_xml"],
)
