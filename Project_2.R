#Hamidullah Rezae
#ITC 360
#Assignment 02

library(factoextra)
library(dplyr)
x=read.csv("grades1.csv")
head(x)

#We cluster the grades of students 
names(x)
#Now we choose two variables of interest
x1=x%>%
  select(MT, Q)
head(x1)

#We apply k-means clustering to cluster the students
#We specify the number of K or the number of initial points for clusters
nclust=fviz_nbclust(x1, kmeans, method = "silhouette")
nclust

#Hence k=2
k_m=kmeans(x1, 2)
h_w_cl=k_m$cluster
h_w_cl

#We transform our dataset from unlabeled (unspervised) to labeled (supervised) 
#one
x1=cbind(x1, h_w_cl)
head(x1)

#Now we display our dataset via a graph
plot(x1$MT, x1$Q, col=x1$h_w_cl,xlab = "Midterm Scores",ylab = "Quiz Scores",
     pch=9,main = "K-means clusters")
legend(100,100,unique(x1$h_w_cl),col=1:length(x1$h_w_cl),pch=9)
head(x1)

#Now we can use the h_w_clust as our classification variable
#Now we can use the h_w_clust as our classification variable 
#and decode (1,2) into (0,1)

x1=x1 %>%mutate(y=ifelse(h_w_cl==2, 1,0))
head(x1)

# Now we can use this dataset to construct our classification model
#The step towards supervising learning from unsupervised 


