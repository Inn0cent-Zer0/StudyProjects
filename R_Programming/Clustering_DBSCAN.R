#1.To get a synthetic data set from factoextra package. 
#load the package and load multishape data:
library(dbscan)
library(factoextra)
data("multishapes")
multishapes <- multishapes[,1:2]
#2. Lets check how the data set looks like. Type:
plot(multishapes,main = "Multishapes Dataset")
#3. First. cluster the data using k-means clustenng algorithm.
set.seed(123456789)
km.res<-kmeans(multishapes,centers=5,nstart=25)
#4. To visuahse the result. type:
plot(multishapes,type="p",col=km.res$cluster+1,main="K-means")
#5. Import dbscan library and then cluster the data using dbscan algonthm.
set.seed(123456789)
db <-dbscan(multishapes,eps=0.5,minPts = 5)
plot(multishapes,main="DBSCAN",col=db$cluster)
# 6. DBSCAN seems to perform better for this data set and can identify the
# algorithms. However. the result of DBSCAN is very sensitive to the two
# DBSCAN with eps=O.5 and minPts=5. What does the result look like?
# 7. It is realty Important to configure proper values of parameters. eps(ilm) and minPts. In our case. the data set
# can be plotted on tvn-dimensional space. so it would be relatively easy to find proper values of parameters. In
# general. given n.dimensionaJ data. it would not be easy to figure out proper parameter values. Here. we introduce a
# sirrwe technique that can be applied to find a plausible eps grven minPts.

  kNNdistplot(multishapes, k = 5)
  