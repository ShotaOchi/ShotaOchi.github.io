library(rmarkdown)
library(stringr)

dir <- "" # directory
filename <- "sample.Rmd" # name of rmarkdown file
ext <- ".html"
rmd <- ".Rmd"

setwd(dir)
# this is for my convenience
if (str_length(dir) == 0)
{
  setwd("../Desktop")
}

# render rmarkdown file
render(filename)

html <- paste(str_sub(filename, 1, str_length(filename) - str_length(rmd)), ext, sep = "")
# remove the line "<!DOCTYPE html>"
a <- readLines(html)
if (a[1] == "<!DOCTYPE html>")
{
  a <- a[2:length(a)]
}
out <- paste(a, collapse = "\n")
write.table(out, "test.html", quote = FALSE, row.names = FALSE, col.names = FALSE)

# write markdown file
tmp <- html
date <- Sys.Date()
title <- str_sub(tmp, 1, str_length(tmp) - str_length(ext))
contents <- sprintf('---\nlayout: default\ntitle:  "%s"\ndate:   %s\ncategories: release\n---\n{%% include %s %%}', title, date, tmp)
tmp_name <- sprintf("%s-%s.markdown", date, title)
write.table(contents, paste("./", tmp_name, sep = ""), quote = FALSE, row.names = FALSE, col.names = FALSE)
