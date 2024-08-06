SOURCES = $(shell find docx -type f -name '*.py')
BINS = $(shell find bin -type f)

.PHONY: check

check:
	flake8 --max-line-length=120 docx setup.py $(BINS)
	black --check --line-length=120 docx setup.py $(BINS)
	isort -c docx setup.py $(BINS)
	mypy --ignore-missing-imports docx setup.py

format:
	isort docx $(BINS) setup.py $(BINS)
	black --line-length=120 docx setup.py $(BINS)
	autopep8 -i --max-line-length=120 $(SOURCES) setup.py $(BINS)
	autoflake -i $(SOURCES) setup.py $(BINS)
