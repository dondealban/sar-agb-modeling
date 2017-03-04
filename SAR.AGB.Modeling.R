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

# Read data, define variables, and store data in variables
dataVAM <- read.csv(file="/Users/dondealban/Dropbox/Research/sar-agb-modeling/csv/VAM_1ha_ForR.csv", header=TRUE, sep=",")

