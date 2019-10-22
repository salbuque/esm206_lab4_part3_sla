# Simone Albuquerque
# 
# library(tidyverse)
# library(here)
# library(janitor)

# Data Wrangling. Read in Disease burden and clean up a bit 

db <- read_csv(here("data", "disease_burden.csv")) %>% 
  clean_names() %>% 
  rename(deaths_per_100l = death_rate_per_100_000)
  
db_sub <-  db %>% 
  filter(country_name %in% c("United States", "Japan", "Afghanistan", "Somalia")) %>% 
  filter(age_group == "0-6 days", sex == "Both")

view(db_sub)

# Graphs: 

ggplot(data = db_sub, aes(x = year, y = deaths_per_100k)) +
  geom_line(aes(color = country_name))

ggsave(here::here("final_graphs", "disease_graph.png"))

