.PHONY:clean

clean: 
	rm -rf derived_data
	rm -rf "figures"

derviated_data/studalc.csv: studalc.csv prepare_data.R
	mkdir -p derived_data
	Rscript prepare_data.R

*figures/figure1.png: derived_data/studalc.csv
	mkdir -p figures
	Rscript figure1.R

figures/figure2.png: derived_data/studalc.csv
	mkdir -p figures*
	Rscript figure2.R

report.pdf: report.rmd figures/figure1.png figures/figure2.png figures/figure3.png
	R -e "rmarkdown::render(\"report.rmd\");"