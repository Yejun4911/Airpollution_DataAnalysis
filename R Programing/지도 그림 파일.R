library(ggmap)
library(ggplot2)
library(raster)
library(rgeos)
library(maptools)
library(rgdal)
P <- read.csv("dustmean.csv", header = TRUE) #시각화할 데이터셋
map <- shapefile("TL_SCCO_SIG.shp") #지리 정보 데이터셋
map <- spTransform(map, CRSobj = CRS('+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs'))
new_map2 <- fortify(map, region = 'SIG_CD')
View(new_map2)
new_map2$id <- as.numeric(new_map$id)
seoul_map <- new_map2[new_map2$id <= 11740,]
seouldust2 <- merge(seoul_map, P, by='id')
plot <- ggplot() + geom_polygon(data = seouldust2, aes(x=long, y=lat, group=group, fill = 평균))
plot + scale_fill_gradient(low = "#FFFFFF", high = "#FF9900", space = "Lab", guide = "colourbar")
+ theme_bw() + labs(title = "2019 서울시 초미세먼지 평균") 
+ theme(panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank(), 
        panel.grid.major.y = element_blank(), panel.grid.minor.y = element_blank(), 
        plot.title = element_text(face = "bold", size = 15, hjust = 0.5))
