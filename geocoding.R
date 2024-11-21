library(tidygeocoder)
library(sf)
library(mapview)
library(readxl)
library(janitor)
library(tidyverse)
install.packages("usethis")
library(usethis)


geo("58 W St #33A, New York", method = "iq")


international_addresses <- read_excel("data/street-addresses.xlsx",
                           sheet = "International Addresses") %>%
  clean_names()

addresses_geocodes <- international_addresses %>% 
  geocode(street = street_address,
          city=city,
          postalcode = post_code,
          country=country,
          method="iq")

addresses_geocodes %>%
  st_as_sf(coords = c("long","lat"),
           crs=4326,na.fail = FALSE) %>%
  mapview()
