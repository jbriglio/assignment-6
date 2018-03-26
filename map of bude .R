#map of bude 
library(ggmap)
library(tidyverse)
library(maps)
library(mapproj)

#different types of maps 
#road map of bude
map.1 <- get_map(location = c(-4.5413, 50.82435), zoom = 14, maptype = "roadmap")
ggmap(map.1)
#watercolor map of bude
map.2 <- get_map(location = c(-4.5413, 50.82435), zoom = 14, maptype = "watercolor")
ggmap(map.2)

#locations
#cricket club: bude north cornwall cricket club
ggmap(map.1) +
  geom_point(
    aes(x = -4.552577 , y = 50.83386),
    color = "red", size = 3
  )
#beach 1: croocklets beach
ggmap(map.1) +
  geom_point(
    aes(x = -4.553923 , y = 50.83613),
    color = "blue", size = 3
  )
#beach 2: summerleaze beach 
ggmap(map.1) +
  geom_point(
    aes(x = -4.551326 , y = 50.83099),
    color = "green", size = 3
  )

#pub: crooklets inn  
ggmap(map.1) +
  geom_point(
    aes(x = -4.551132 , y = 50.83597),
    color = "yellow", size = 3)

#Change by Hongyi He
##Add two hotel
#hotel 1
Edgcumbe_Hotel <- geocode("19 Summerleaze Cres, Bude EX23 8HJ, UK")
Edgcumbe_Hotel <- fortify(Edgcumbe_Hotel)

#hotel 2 
LSG_House <- geocode("7 Burn View, Bude EX23 8BY, UK")
LSG_House <- fortify(LSG_House)

#all together on regular map 
ggmap(map.1) +
  geom_point(
    aes(x = -4.552577 , y = 50.83386),
    color = "red", size = 3) +
  geom_point(
    aes(x = -4.553923 , y = 50.83613),
    color = "blue", size = 3) +
  geom_point(
    aes(x = -4.551326 , y = 50.83099),
    color = "green", size = 3) +
  geom_point(
    aes(x = -4.551132, y = 50.83597),
    color = "yellow", size = 3) +
  geom_point(
    aes(x = Edgcumbe_Hotel[1], y = Edgcumbe_Hotel[2]),
    color = "purple", size = 3)
  

#map from crooklets inn to the bude north cornwall cricket club on regular 
from <- "Crooklet's Inn"
to <- "Bude North Cornwall Cricket Club"
route_df <- route(from, to, structure = "route")
ggmap(map.1) +  
  geom_path(
    aes(x = lon, y = lat), colour = "red", size = 1.5,
    data = route_df, lineend = "round"
  )

#all together on water color map
ggmap(map.2) +
  geom_point(
    aes(x = -4.552577 , y = 50.83386),
    color = "red", size = 3) +
  geom_point(
    aes(x = -4.553923 , y = 50.83613),
    color = "blue", size = 3) +
  geom_point(
    aes(x = -4.551326 , y = 50.83099),
    color = "green", size = 3) +
  geom_point(
    aes(x = -4.551132, y = 50.83597),
    color = "yellow", size = 3)
#map from crooklets inn to the bude north cornwall cricket club on water color
from <- "Crooklet's Inn"
to <- "Bude North Cornwall Cricket Club"
route_df <- route(from, to, structure = "route")
ggmap(map.2) +  
  geom_path(
    aes(x = lon, y = lat), colour = "red", size = 1.5,
    data = route_df, lineend = "round"
  )