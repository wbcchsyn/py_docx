SOURCES = $(shell find docx -type f -name '*.py')

.PHONY: check

check:
	flake8 --max-line-length=120 docx setup.py
	black --check --line-length=120 docx setup.py
	isort -c docx setup.py
	mypy --ignore-missing-imports docx setup.py

format:
	isort docx setup.py
	black --line-length=120 docx setup.py
	autopep8 -i --max-line-length=120 $(SOURCES) setup.py
	autoflake -i $(SOURCES) setup.py
