library(rvest)
library(dplyr)
library(robotstxt)

 # Assign a variable for web link 

url = "https://www.amazon.in/s?k=samsung+mobile&i=electronics&rh=n%3A1389432031%2Cp_n_feature_eighteen_browse-bin%3A27355812031%2Cp_89%3ASamsung%2Cp_n_operating_system_browse-bin%3A1485077031%2Cp_72%3A1318478031&dc&qid=1653138005&rnid=1318475031&sprefix=samsung%2Caps%2C288&ref=sr_nr_p_72_3"

# Check whether the path is allowed to scrap

path = paths_allowed(url)

#html elements from website

web = read_html(url)


#segregate the name of the mobile
 
Name = web%>%html_nodes(".a-size-medium") %>% html_text()
View(Name)

# Price

price = web%>%html_nodes("#search .a-price-whole") %>% html_text()
View(price)

# Ratings

rating =  web%>%html_nodes(".aok-align-bottom") %>% html_text()
View(rating)

#put into dataframe

mobiles = data.frame(Name, price, rating, stringsAsFactors = FALSE)

# View the dataframe

View(mobiles)

write.csv(mobiles,"mobiles.csv")





