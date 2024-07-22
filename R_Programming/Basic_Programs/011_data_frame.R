id<-c(1,2,3)
name<-c('anu','devi','uma')
df<-data.frame(id,name)
df
names(df)<-c('Regno.','Name of Student')
df
df$dept<-c('maths','cs','tamil')
df
df$dept
head(df)
tail(df)