SHELL := /bin/bash
.SHELLFLAGS = -ec
.ONESHELL:

VENV_PATH := /home/nfultz/venv_jupyter38/bin/activate


index.html : dueto.slides.html
	cp $< $@

dueto.slides.html: dueto.ipynb
	[ -z "$(VIRTUAL_ENV)" ] && source $(VENV_PATH)
	jupyter nbconvert dueto.ipynb --to slides --execute --no-prompt --TagRemovePreprocessor.remove_input_tags={\"to_remove\"}

