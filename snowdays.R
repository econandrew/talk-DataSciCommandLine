library(rvest)
library(stringr)
library(lubridate)

# Get the OPM dismissals history
opm.history <- html("http://www.opm.gov/policy-data-oversight/snow-dismissal-procedures/status-archives/")

# Extract the dates, and only take the most recent years
dates.text <- str_trim(html_text(html_nodes(opm.history, ".StatusDateContainer")))
dates.text.latest <- head(dates.text, n = 58) # earlier dates are inconsistently formatted

# Plot, binned by months
dates <- mdy(dates.text.latest)
months <- month(dates, label=T)
barplot(table(months), main="OPM Dismissals since 2011")
