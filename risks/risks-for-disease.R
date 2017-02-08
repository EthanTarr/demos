
library(dplyr)

risks <- read.csv("./data/prepped/risk-factors.csv")

average.risks <- group_by(risks, category) %>% 
  summarise_each( funs(mean))

risks$avg.risk <- rowMeans(risks[7:ncol(risks)], na.rm=TRUE)

risks <- arrange(risks, -avg.risk)

risk.by.category <- group_by(risks, category) %>% 
  summarise(avg.risk = mean(avg.risk)) %>% 
  arrange(-avg.risk)