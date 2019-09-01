library(rmarkdown)
library(stringr)

html <- "2019-09-01-html.html" # replace this name with the name of your html file 
ext <- ".html"
a <- html
#a <- str_replace_all(html, " ", "_")
date_a <- str_extract(a, "^[0-9]*-[0-9]*-[0-9]*")
title_a <- str_sub(a, str_length(date_a) + 2, str_length(a) - str_length(ext))
contents_a <- sprintf('---\nlayout: default\ntitle:  "%s"\ndate:   %s\ncategories: release\n---\n{%% include %s %%}', title_a, date_a, a)
tmp_name_a <- sprintf("%s-%s.markdown", date_a, title_a)
write.table(contents_a, paste("./", tmp_name_a, sep = ""), quote = FALSE, row.names = FALSE, col.names = FALSE)
