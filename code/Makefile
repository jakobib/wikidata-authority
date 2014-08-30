.PHONY: stats

stats:
	@wc -l ../data/*.csv

../data/authority-properties.csv:
	./authority-properties > $@	

../data/all-properties.csv:
	./all-properties > $@

../data/property-creation.csv: ../data/all-properties.csv
	cat $< | ./created > $@
