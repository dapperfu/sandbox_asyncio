# Config

# Environments to setup for this project
# Available options: python arduino git
ENVS:=python

## make_sandwich includes
# https://github.com/jed-frey/make_sandwich
include .mk_inc/env.mk

LINE_LENGTH:=88
.PHONY: lint
lint: msgproto.py
	bin/autopep8 --max-line-length ${LINE_LENGTH} -air ${^}
	bin/isort --line-width ${LINE_LENGTH} --multi-line 3 --apply --recursive --dont-skip __init__.py ${^}
	bin/black --target-version py37 --line-length ${LINE_LENGTH} ${^}
