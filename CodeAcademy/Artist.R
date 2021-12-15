---
title: "Introduction to Data Frames"
output: html_notebook
---

```{r message=FALSE, warning=FALSE}
# load libraries
library(readr)
library(dplyr)

```

```{r}
# load data frame
artists <- read_csv('artists.csv')
```

```{r}
# inspect data frame
artists
head(artists)
summary(artists)
```

```{r}
# select columns, filter and arrange rows of artists
artists_manipulated <- artists %>% 
  select(-country,-year_founded,-albums) %>% 
  filter(spotify_monthly_listeners > 20000000, genre != 'Hip Hop') %>% 
  arrange(desc(youtube_subscribers))
artists_manipulated
```
