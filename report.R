## Prepare plots and tables for report

## Before:
## After:

library(icesTAF)

mkdir("report")

# read in model predictions
srpred <- read.taf("model/recssb.csv")

# make a plot (old school)
taf.png("srplot")

plot(0, 0, type = "n",
     xlim = c(0, max(srpred$ssb)),
     ylim = c(0, max(srpred[c("recruitment", "rec_fit_ciu")])),
     ylab = "Recruitment", xlab = "SSB",
     main = "Stock Recruitment of cod.27.47d20"
  )

ord <- order(srpred$ssb)
polygon(c(srpred$ssb[ord], rev(srpred$ssb[ord])),
        c(srpred$rec_fit_ciu[ord], rev(srpred$rec_fit_cil[ord])),
        col = "red", border = "transparent")
points(recruitment ~ ssb, data = recssb, pch = 16, cex = 0.7)
lines(rec_fit ~ ssb, data = recssb[ord,], lwd = 2)

dev.off()
