# 필요한 라이브러리 활성화
library(rvest)
library(tidyverse)
library(xml2)
library(wordcloud)
library(KoNLP)
library(RColorBrewer)
useSejongDic()
base_url <- "https://search.naver.com/search.naver?&where=news&query=%EB%AF%B8%EC%84%B8%EB%A8%BC%EC%A7%80%20%EC%9B%90%EC%9D%B8&sm=tab_pge&sort=0&photo=0&field=0&reporter_article=&pd=5&ds=2019.11.18&de=2020.11.17&docid=&nso=so:r,p:1y,a:all&mynews=0&cluster_rank=14&start="
urls<-NULL
for(x in 0:9){
  urls<-c(urls,paste0(base_url,x*10+1,seq=''))
}
urls
new_links <- NULL
for(url in urls){
  html <- read_html(url)
  new_links <- c(new_links,html %>%
                   html_nodes('.news_tit') %>%
                   html_text()
                 )
}
txt <- new_links
txt <- str_replace_all(txt, "\\W", " ")
txt<-gsub("\\d+","",txt)
txt<-gsub("\\n+","",txt)
txt<-gsub("[A-z]","",txt)
txt<-gsub("[[:cntrl:]]","",txt)
nouns <- KoNLP::extractNoun(txt)
nouns <- sapply(txt,extractNoun,USE.NAMES=F)
nouns_unlist <- unlist(nouns)
wordcount <-Filter(function(x){nchar(x)>1},nouns_unlist)
head(wordcount, 100)
write(wordcount,"1.txt") 
rev <- read.table("1.txt")
nrow(rev)
wordcount <- table(rev)
head(sort(wordcount, decreasing=T),30)
palete <- brewer.pal(9,"Set1") 
wordcloud(names(wordcount),freq=wordcount,scale=c(5,0.5),rot.per=0.25,min.freq=1,
          random.order=F,random.color=T,colors=palete, max.words = 100)
