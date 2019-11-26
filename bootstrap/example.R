# example script demonstating how to use an R script to prepare data
# for use in a TAF analysis

library(icesTAF)

# use an analysis specific package
taf.library(icesSAG)

# download summary data for cod in the North Sea
key <- findAssessmentKey("cod.27.47d20", year = 2018)
summary_table <- getSummaryTable(key)[[1]]

# data will be accesible as "bootstrap/data/example/summary_table.csv"
write.taf(summary_table)
