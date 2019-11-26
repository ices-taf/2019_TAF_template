## Preprocess data, write TAF data tables

## Before:
## After:

library(icesTAF)

mkdir("data")

# read data from bootstrap/data/ folder
summary_tab <- read.taf("bootstrap/data/example/summary_table.csv")

# clean up / process
rec_age <- summary_tab$recruitment_age[1]

# get year when recruits were 0, and the corresponding SSB in that year
recssb <-
  data.frame(
    recruitment = summary_tab$recruitment[-seq_len(rec_age)],
    yearclass = summary_tab$Year[-seq_len(rec_age)] - rec_age,
    ssb = summary_tab$SSB[seq_len(nrow(summary_tab) - rec_age)]
  )

# write out for use in model script
write.taf(recssb, dir = "data")
