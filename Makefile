PROJECT := reproworkshop
WORKDIR := $(CURDIR)

# list below your targets and their recipies
all:

data/raw/inflation.rds: R/download_inflation.R
	Rscript -e "source('$<')"

### Rmd's ###
include .repro/Makefile_Rmds

publish/: inflation.pdf

inflation.pdf: inflation.tex

include .repro/Makefile_publish
