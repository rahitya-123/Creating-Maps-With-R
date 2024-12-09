library(tidyverse)
library(sf)
library(maps)
library(rnaturalearthdata)

brazil_sf <- countries110 %>% 
  st_as_sf() %>% 
  filter(name == "Brazil")

brazil_cities <- world.cities %>% 
  filter(country.etc == "Brazil",
         pop >= 1E6) %>% 
  st_as_sf(coords = c("long", "lat"), crs = 4326) %>%
  arrange(desc(pop))

ggplot()+
  geom_sf(data = brazil_sf,
          fill="darkolivegreen3")+
  geom_sf(data=brazil_cities,
          size=4,
          shape=21,
          aes(fill=as.logical(capital),
              size=pop))+
  scale_size_area(max_size = 10)+
  theme_void()
