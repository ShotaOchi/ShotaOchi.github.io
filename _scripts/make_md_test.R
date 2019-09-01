library(rmarkdown)
library(stringr)

htmls <- list.files("./html")
ext <- ".html"
a <- htmls[1]
date_a <- str_extract(a, "^[0-9]*-[0-9]*-[0-9]*")
title_a <- str_sub(a, str_length(date_a) + 2, str_length(a) - str_length(ext))
contents_a <- sprintf('---\nlayout: post\ntitle:  "%s"\ndate:   %s\ncategories: release\n---\n{%% include %s %%}', title_a, date_a, a)
tmp_name_a <- sprintf("%s-%s.markdown", date_a, title_a)
write.table(contents_a, paste("./md/", tmp_name_a, sep = ""), quote = FALSE, row.names = FALSE, col.names = FALSE)

ext <- ".html"
for (i in seq(length(htmls)))
{
  tmp <- htmls[i]
  date <- str_extract(tmp, "^[0-9]*-[0-9]*-[0-9]*")
  title <- str_sub(tmp, str_length(date) + 2, str_length(tmp) - str_length(ext))
  contents <- sprintf('---\nlayout: post\ntitle:  "%s"\ndate:   %s\ncategories: release\n---\n{%% include %s %%}', title, date, tmp)
  tmp_name <- sprintf("%s-%s.markdown", date, title)
  write.table(contents, paste("./md/", tmp_name, sep = ""), quote = FALSE, row.names = FALSE, col.names = FALSE)
}

