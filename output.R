## Extract results of interest, write TAF output tables

## Before:
## After:

library(icesTAF)

mkdir("output")

# read in model
load("model/fit.RData")
# read in model predictions
srpred <- read.taf("model/recssb.csv")

# as an example, save a summary of the model
cat(capture.output(summary(fit)), file = "output/fit_summary.txt", sep = "\n")

# can also be full precision fitted values
write.taf(srpred, dir = "output")