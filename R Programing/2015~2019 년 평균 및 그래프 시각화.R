setwd("~/downloads")
getwd()


a <- read.csv('2015~2019.csv',fileEncoding = "utf-8")
a2015<-sort(a$X2015,decreasing = TRUE)
a2016<-sort(a$X2016,decreasing = TRUE)
a2017<-sort(a$X2017,decreasing = TRUE)
a2018<-sort(a$X2018,decreasing = TRUE)
a2019<-sort(a$X2019,decreasing = TRUE)
for(x in range(1,3)){
  bestbad1 <- subset(a,subset=(X2015==a2015[x]))
  print(bestbad1$장소)
}
bestbad2
for(x in range(1,3)){
  bestbad2 <- subset(a,subset=(X2016==a2016[x]))
  print(bestbad2$장소)
}
for(x in range(1,3)){
  bestbad3 <- subset(a,subset=(X2017==a2017[x]))
  print(bestbad3$장소)
}
for(x in range(1,3)){
  bestbad4 <- subset(a,subset=(X2018==a2018[x]))
  print(bestbad4$장소)
}
for(x in range(1,3)){
  bestbad5 <- subset(a,subset=(X2019==a2019[x]))
  print(bestbad5$장소)
}


b<-a$X2015
c<-a$X2016
d<-a$X2017
e<-a$X2018
f<-a$X2019
par(family="AppleGothic")
plot(b,axes=F,type = "o",col="red",main="2015~2019 미세먼지",xlab = "구",ylab="PM 2.5",ylim = c(0,70))
axis(1,at=1:25,lab=c(a$장소),las=2)

axis(2,las=1)
abline(h=c(10,20,30,40,50,60),v=c(5,10,15,20,25,30,35,40,45),lty=2)
lines(c,col="blue",type="o")
lines(d,col="black",type="o")
lines(e,col="purple",type="o")
lines(f,col="green",type="o")
colors<-c("red","yellow","purple","green")
legend(40,60,c("2015","2016","2017","2018","2019"),cex=0.8,col=colors,lty=2,lwd=1,fill="white",bg="white")
