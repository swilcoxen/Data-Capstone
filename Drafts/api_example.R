#
# Author: Cristian Nuno
# Purpose: Using APIs in R
# Date: May 21, 2017
#
# Summary: Trying to delve into fetching data via APIs. 
#          For more information, please see these two links:
#          "Accessing APIs from R" - https://www.r-bloggers.com/accessing-apis-from-r-and-a-little-r-programming/
#          "USA Spending API endpoints" - https://api.usaspending.gov/docs/endpoints
#
# load necessary packages
library( httr )
library( jsonlite )
library( lubridate )
library( rgdal )

# fetch url
url <- "https://api.usaspending.gov/"
path <- "api/v1/accounts/awards/"

# Executing an API call with the GET flavor 
# is done using the GET() function.
raw.result <- GET(   url = url
                  , path = path
                  )
# Ensure a status code of 200 is attained
# In general, status codes returned are as follows:
# 200 if successful
# 400 if the request is malformed
# 500 for server-side errors
# For more information, see this WikiPedia page on the 
# list of HTTP codes: https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
raw.result$status_code # 200

# Let’s look at the actual answer or data payload we’ve got back. 
# Let’s just look at the first few elements:
head( raw.result$content ) # unicode 

# Let’s translate that into text.
this.raw.content <- rawToChar(raw.result$content)

# Let’s see how large that is in terms of characters:
nchar(this.raw.content) #98,334

# That’s rather large. Let’s look at the first 100 characters:
substr(this.raw.content, 1, 100) # json format

# So the result is a single character string that contains a JSON file.
# Let’s tell R to parse it into something R can work with.
this.content <- fromJSON(this.raw.content)

# What did R make out of it?
class(this.content) #it's a list
length( this.content ) # length of 3

# Peak inside each element within the list
this.content[[1]] # page
this.content[[2]] # unique page identifier
this.content[[3]] # financial information 

# So, essentially, the result is a list of lists. 
# Lists are not (always) very nice to work with, and 
# lists of lists are usally despicable. 
#
# Let’s turn it into a data frame:
this.content.df.main <- as.data.frame( this.content[[3]] )
this.content.df.main$treasury_account <- NULL # delete treasury account df
this.content.df.main$object_class <- NULL # delete object class df

this.content.treasury.account <- as.data.frame( this.content[[3]]$treasury_account )
this.content.object.class <- as.data.frame( this.content[[3]]$object_class )




