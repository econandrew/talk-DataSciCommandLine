# Data Science at the Command Line lightning talk

Code fragments - run this is a new empty folder

```sh
wget -O file.csv http://datagov.ic.nhs.uk/presentation/2014_11_November/T201411PDPI+BNFT.CSV
```

## Count rows in a file
```sh
wc –l file.csv
```

## Count columns
```sh
head –n1 file.csv | tr , ‘\n’ | nl
```

## Group counts
```sh
tail –n+2 file.csv | cut –d, -f3 | sort | uniq –c
```

## Sum over selected records
```sh
grep "Amoxicillin_Cap 500mg" file.csv | cut –d, -f8 | paste –s –d+ | bc
```
on Mac or a BSD system you may need
```sh
grep "Amoxicillin_Cap 500mg" file.csv | cut –d, -f8 | paste –s –d+ - | bc
```

## R equivalents
```R
presc <- read.csv('file.csv', head=T)
practice.count <- table(presc$PRACTICE)
amoxi.cost <- sum(presc$ACT.COST[grepl(
	"Amoxicillin_Cap 500mg", presc$BNF.NAME
)])
```
