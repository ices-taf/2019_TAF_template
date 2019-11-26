## Run analysis, write model results

## Before:
## After:

library(icesTAF)

mkdir("model")

# read in data for modelling
recssb <- read.taf("data/recssb.csv")

# fit a ricker
fit <- glm(recruitment ~ ssb + offset(log(ssb)), family = Gamma(log), data = recssb)

# predict from model
recssb[c("fit", "se.fit")] <- predict(fit, se = TRUE)[c("fit", "se.fit")]
recssb$rec_fit <- exp(recssb$fit)
recssb$rec_fit_cil <- exp(recssb$fit + 2*recssb$se.fit)
recssb$rec_fit_ciu <- exp(recssb$fit - 2*recssb$se.fit)

# save model predictions
write.taf(recssb, dir = "model")

# save model also (could be useful)
save(fit, file = "model/fit.RData")
