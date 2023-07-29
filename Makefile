# Makefile for managing document repo

module:
	scripts/make_module.sh


html:
	npx antora --fetch antora-playbook.yml
