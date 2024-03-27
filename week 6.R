library(tidyverse)
install.packages("ggplot2")
library(ggplot2)
x <- 1:400
y <- sin(x/10)*exp(x*-0.01)
plot(x, y)
 
mypack <- c("maps", "mapdata", "RgoogleMaps",
            "rworldmap", "tidyverse", "leaflet")
lapply(mypack, install.packages, character.only=T)
lapply(mypack, library, character.only=T)

lat <- c(35.9025, 42.02683)
lon <- c(25.90902, 44.5742)
center <- c(mean(lat), mean(lon))
zoom <- 5
mymap <- GetMap(center = center, zoom = zoom,
                maptype = "hybrid",
                destfile = "mymap.png")
airports <- read.csv("https://raw.githubusercontent.com/jpatokal/openflights/master/data/airports.dat",
                     header = F, utf8ToInt(12))
colnames(airports) <- c("ID", "Name", "City", "Country", "IATA_FAA", "ICAO",
                        "Lat", "Lon", "Altitude", "Timezone", "DST",
                        "Tz DB time zone", "Type", "Source ")

head(airports)
newmap <- getMap(resolution = "low")
plot(newmap, xlim=c(-20,59), ylim=c(35,71), asp = 1)
points(airports$Lon, airports$Lat, col="orange", cex=.6)

leaflet() %>% 
  addTiles()


head(names(providers))


leaflet() %>% 
  addProviderTiles("CartoDB")

leaflet() %>% 
  addProviderTiles("Esri")

AnkaraMap <- leaflet() %>% 
  setView(lng = 32.85411, lat = 39.92007, zoom = 10) %>% 
  addTiles()
AnkaraMap

AnkaraMap %>%  addProviderTiles(providers$Stadia.StamenToner)


leaflet(options = 
          leafletOptions(dragging = FALSE,
                         minZoom = 14,
                         maxZoom = 18)) %>% 
  addProviderTiles("CartoDB") %>% 
  setView(lng = 32.85411, lat = 39.92077, zoom = 18)
leaflet() %>% 
  addTiles() %>% 
  addMarkers(lng=32.85411,
             lat= 39.92077)

leaflet() %>% 
  addTiles() %>% 
  setView(lng=32.85411,
          lat= 39.92077,
          popup)


myydata <- read.csv("ElectionData.csv")
head(myydata)
str(myydata)

pal <- colorFactor(c("yellow","blue","red","purple",
                     "orange", "darkred"), domain = myydata$Parti)
pal

center_lon = median(myydata$Boylam, na.rm = T)
center_lat = median(myydata$Enlem, na.rm =T)
leaflet(myydata) %>% 
  addProviderTiles("Esti") %>% 
  addCircles(~Boylam, ~Enlem, weight = 20,
             popup = ~)  
leaflet(mydata) %>% 
  
  addProviderTiles("Esri") %>% 
  
  addCircles(~Boylam, ~Enlem, weight = 20,
             
             label = ~Parti,
             
             color = ~pal(Parti)) %>% 
  
  setView(lng = center_lon, lat = center_lat, 
          
          zoom = 5) %>% 
  
  addPopups(lat=mydata$Enlem,
            
            lng= mydata$Boylam, ~Şehir)
