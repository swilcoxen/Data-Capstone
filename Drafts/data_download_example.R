#
# Author: Cristian Nuno
# Date: May 21, 2017
# Purpose: Extracting Data from the Data Download Center
# Summary: The old USASpending.gov website hosts federal financial data.
#          This is a tutorial on how to access that data using the
#          data download section of the website, which can be found here:
#          https://www.usaspending.gov/DownloadCenter/Pages/DataDownload.aspx.
# 
# Load packages
library( dplyr )
# DATA DOWNLOAD
# 1. Select Type of Data:   Prime Award
#
# 2. Select Spending Type:  Contracts
#
# 3. Filter the Data:       All Agencies
#                           View All Bureaus
#                           Fiscal Year 2017
#                           All Recipient States
#                           All Place of Performance States
#
# 4. Select Date Range:     Obligation Date
#                           10/01/2016
#
# 5. Select Type of File:   CSV
#
# Now we play the waiting the game!
#
# Here is the message from USASpending.gov:
# "Your file has been submitted for processing and will be ready in 30-60 minutes. 
#  To access the file, you can wait for the link to be activated, 
#  or you can click on Bookmark Download, 
#  or you can copy and paste the link into your browser."
#
# Save link from custom search
fy17.contracts.url <- "http://download.usaspending.gov/datadownlods/Contracts/10ab37ffd37d/Data_Feed.csv"
# convert csv link to data frame
# WARNING:
# This took 7 minutes to download. Please be patient
fy17.contracts <- read.csv( file = fy17.contracts.url
                            , header = TRUE
                            , stringsAsFactors = FALSE
                            )
# Repeat this for grants
fy17.grants.url <- "http://download.usaspending.gov/datadownlods/Assistance/5271fa9ca4f3/Data_Feed.csv"
# WARNING:
# This took 3 minutes to download. Please be patient
fy17.grants <- read.csv( file = fy17.grants.url
                         , header = TRUE
                         , stringsAsFactors = FALSE
                         )
# Repeat this for loans
fy17.loans.url <- "http://download.usaspending.gov/datadownlods/Assistance/6136125831f3/Data_Feed.csv"
# WARNING:
# This took 3 minutes to download. Please be patient
fy17.loans <- read.csv( file = fy17.loans.url
                        , header = TRUE
                        , stringsAsFactors = FALSE
                        )
# Repeat this for other financial assistance
fy17.otherfinaid.url <- "http://download.usaspending.gov/datadownlods/Assistance/a7d4a0cab738/Data_Feed.csv"
# WARNING:
# This took 7 minutes to download. Please be patient
fy17.otherfinaid <- read.csv( file = fy17.otherfinaid.url
                              , header = TRUE
                              , stringsAsFactors = FALSE
                              )



