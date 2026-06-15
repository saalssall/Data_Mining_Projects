#Hamidullah Rezae
#ITC 360
#Assignment 1

setwd("Desktop")
x=read.csv("grades1.csv")
View(x)

#1. Linear Regression
names(x)
dim(x)
#A. Trying to construct some models to predict the Grades of students using thier Q, 
#Fscore, and MT, and then choose the one with smallest error rate.
#A
#Not A
s=sample(nrow(x), 24)
x.train=x[s,]
x.test=x[-s,]
m0=lm(Grade~Q, data=x.train)
m0_pr=predict(m0, x.test)
m0_pr
grade_pred=ifelse(m0_pr>0.5, 1, 0)
table(x.test$Grade, grade_pred)
 grade_pred
0  1
0 65  5
1 18  5
#Wrong classification 23/93 ~24%
##In other words, if we use Quiz marks of students as a predictor for predicting 
#Their grades, we will face with 24% error rate. 

#B. If we use Quiz as a predictor in the grade of students, we face with 24% error.
#Now let's construct another model using Fscore as a predictor of stu grades
m1=lm(Grade~Fscore, data=x.train)
m1_pr=predict(m1, x.test)
m1_pr
grade_pred=ifelse(m1_pr>0.5, 1, 0)
table(x.test$Grade, grade_pred)
grade_pred
0  1
0 61  9
1  0 23
#Wrong classification 9/93 ~ 9% error rate.
#In other words, if we use Final score of students as a predictor for predicting 
#Their grades, we will face with 9% error rate and predict student's grade 
#correctly 91% of the times. 

#C. Finally, let's use student's MT marks as a predictor of student's grades
m2=lm(Grade~Oral, data=x.train)
m2_pr=predict(m2, x.test)
grade_pred=ifelse(m2_pr>0.5, 1, 0)
table(x.test$Grade, grade_pred)
grade_pred
0  1
0 55 15
1  4 19
#Wrong classification 19/93 ~20% error rate.
#In other words, if we use Oral marks of students as a predictor for predicting 
#Their grades, we will face with 20% error rate. 

#Comparing the 3 above constructed models, we use the 2nd model for our prediction
#because it has the lowest error rate (9%). Our models predict 91% of the times.

#Now let's use our best model and make predictions
x.fit=fitted(m1, x.train)
summary(x.fit)
plot(x.train$Fscore, x.fit, col="red", pch=10)
#I do not need to use Logistic linear regression model because the current model 
#works fine with the data and doesn't contradict the conditions.

#2. Using KNN classification 

setwd("Desktop")
x=read.csv("grades1.csv")
View(x)
x.new=x[, c(4,5)]
head(x.new)
install.packages("class")
library(class)
x.group=x[,8]
head(x.group)
#Now we split the dataset into train and test
s=sample(nrow(x), floor(0.8*nrow(x)))
x.train=x.new[s, ]
x.test=x.new[-s, ]
train.group=x.group[s]
test.group=x.group[-s]
NROW(train.group)
#now we specify K and it is better for K to be an odd number 
sqrt(nrow(x))
[1] 10.81665
#We take 11 as K or K=11
x.knn=knn(train = x.train, test = x.test, cl = train.group, k=11)
x.pr=data.frame(x.test$Oral, test.group, x.knn)

Oral=c(98, 70, 91, 93, 97)
Q=c(92, 89, 93, 91, 98)
> pre.new=data.frame(cbind(Oral, Q))
> pre.new
Oral  Q
1   98 92
2   70 89
3   91 93
4   93 91
5   97 98
x.knn1=knn(train = x.train, test = pre.new, cl = train.group, k=11)
table(x.knn1) 
x.knn1
A NotA 
4    1 
#We observed that 4 people got classified as students whose grade is A and 
#1 people are classified as students whose grade is not A.

#3. Using ANN classification method

setwd("Desktop")
x=read.csv("grades1.csv")
View(x)

#We classify student's grades into students who got an A and students who did 
#not get an A score using their oral and Quiz scores.
p=data.frame(x$Q, x$Oral, x$Grade)
colnames(x)=c("Oral", "Q", "Grade")
head(p)

#Split the dataset x into training and test
s=sample(nrow(x), floor(0.8*nrow(x)))
x.train=p[s, ]
x.test=p[-s, -3]
x.test.y=p[-s, 3]
head(x.test)
x.Q x.Oral
4  91.33   75.0
9  82.00   67.0
19 84.67   87.5
22 61.33   39.0
25 90.00  100.0
28 87.33   90.0
head(x.test.y)
[1] 1 0 1 0 1 1

nn=neuralnet(Grade~Q+Oral, data =x.train, hidden = 3,act.fct = "logistic", linear.output = FALSE)
plot(nn)
##Compute the error rate using test dataset
pr.test=compute(nn, x.test)
p1=pr.test$net.resulthead(p1)pred=ifelse(p1>0.5, 1, 0)
table(x.test.y, pred) 
Err.rate=6/NROW(x.test)Err.rate

###We use the ANN model to classify new students
Oral=c(94, 90, 60)
Q=c(97, 50, 70)
new.st=data.frame(cbind(Oral, Q))
head(new.st)
pr.test=compute(nn, new.st)
p1=pr.test$net.result
pred0=ifelse(p1>0.5, 1, 0)  ##dummay variablepred0





