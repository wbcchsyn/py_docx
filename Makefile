SOURCES = $(shell find docx -type f -name '*.py')

.PHONY: check

check:
	flake8 --max-line-length=120 docx
	black --check --line-length=120 docx
	isort -c docx
	mypy --ignore-missing-imports docx

format:
	isort docx
	black --line-length=120 docx
	autopep8 -i --max-line-length=120 $(SOURCES)
	autoflake -i $(SOURCES)
