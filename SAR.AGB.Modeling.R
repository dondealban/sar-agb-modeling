# This script for modeling synthetic aperture radar backscatter from JAXA's L-band
# ALOS/PALSAR and ALOS/PALSAR-2 sensors and aboveground biomass data collected from
# forest inventory plots in the Philippines.
#
# Script By:      Jose Don T De Alban
# Date Created:   04 Mar 2017
# Last Modified:  


# SET WORKING DIRECTORY
setwd("/Users/dondealban/Dropbox/Research/sar-agb-modeling/")


# LOAD LIBRARIES AND DATA
library(ggplot2)

# Read data, define variables, and store data in variables
dataVAM <- read.csv(file="/Users/dondealban/Dropbox/Research/sar-agb-modeling/csv/VAM_1ha_ForR.csv", header=TRUE, sep=",")


# LOGARITHMIC REGRESSION

# 2007
lmHH07AGB <- lm(log(T_HA_50x50) ~ HH07, data=dataVAM)
lmHV07AGB <- lm(log(T_HA_50x50) ~ HV07, data=dataVAM)
lmDUAL07AGB <- lm(log(T_HA_50x50) ~ HH07 + HV07, data=dataVAM)

# All Years: 2007, 2008, 2009, 2010, 2015
lmSARAGB <- lm(log(T_HA_50x50) ~ HH07+HV07+HH08+HV08+HH09+HV09+HH10+HV10+HH15+HV15, data=dataVAM)


# PREDICTION

pred07 <- predict(lmDUAL07AGB)
predALL <- predict(lmSARAGB)


# SAVE RESULTS TO FILE

# Print regression summaries as txt file

sink("output-vam-sar-agb-lm-2007.txt", append=FALSE, split=TRUE)
print("Logarithmic Regression: 2007 SAR Gamma0 Backscatter vs Aboveground Biomass")
print(summary(lmHH07AGB))
print(summary(lmHV07AGB))
print(summary(lmDUAL07AGB))
sink()

sink("output-vam-sar-agb-lm-allyears.txt", append=FALSE, split=TRUE)
print("Logarithmic Regression: All Years SAR Gamma0 Backscatter vs Aboveground Biomass")
print(summary(lmSARAGB))
sink()

# Generate regression plots

# 2007
saragb07 <- ggplot(dataVAM, aes(x=T_HA_50x50, y=exp(pred07)))
saragb07 <- saragb07 + geom_point() + stat_smooth(method="lm", se=TRUE) + theme_bw()
saragb07 <- saragb07 + labs(title="2007: Field vs Predicted AGB", x="Field AGB (t/ha)", y="Predicted AGB (t/ha)")

# All Years
saragbALL <- ggplot(dataVAM, aes(x=T_HA_50x50, y=exp(predALL)))
saragbALL <- saragbALL + geom_point() + stat_smooth(method="lm", se=TRUE) + theme_bw()
saragbALL <- saragbALL + labs(title="All Years: Field vs Predicted AGB", x="Field AGB (t/ha)", y="Predicted AGB (t/ha)")

# Save regression plots

ggsave(saragb07,  file="plot-logres-2007.pdf", width=7, height=5.5, units="in", dpi=300)
ggsave(saragbALL, file="plot-logres-allyears.pdf", width=7, height=5.5, units="in", dpi=300)

