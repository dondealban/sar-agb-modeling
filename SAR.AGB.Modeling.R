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


