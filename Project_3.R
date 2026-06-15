#Hamidullah Rezae 
#ID: 40054
#ITC 360

setwd("Desktop/ITC360")
x=read.csv("employee.csv")


# We try to predict employee's Salary using a vector of relevant variables such 
#as Tax, Spending, and WrH. 
x.s = data.frame(x$Tax, x$Salary, x$Spending, x$WrH)
x.cor=cor(x.s)
x.cor

#The correlation between salary and tax is 98%.
#The correlation between salary and spending is 97%.
#The correlation between salary and WrH is 87%.

library(corrplot)
corrplot(x.cor, method = "pie", 
                 type="lower")
#We can have a visual representation of the correlations between different
#variable using the above formula. 

nrow(x)
[1] 30

#i choose to predict 70% of employee's salary:
0.7*30
#i got 21 so i inlcude 21 observations
b=sample(nrow(x), 21)
x.train=x[b, ]
x.test=x[-b, ]

#Let's construct prediction models using x.train dataset
#1. We predict the correlation between salary and spending 
lm1 = lm(Salary~Spending, data  = x.train)
#we use the test dataset to predict salary with lm1
lm1.test = predict(lm1, x.test)
SSE1 = sum((x.test$Salary - lm1.test)^2)
SSE1
[1] 79.43358
#We predicted that there are 79% correlation between salary and spending 

#2. We construct the 2nd model
lm2 = lm(Salary~Spending + Tax, data  = x.train)
lm2.test = predict(lm2, x.test)
SSE2 = sum((x.test$Salary - lm2.test)^2)
SSE2
[1] 14.82179

#3. we construct the 3rd model
lm3 = lm(Salary~Spending + Tax + WrH, data  = x.train)
lm3.test = predict(lm3, x.test)
SSE3 = sum((x.test$Salary - lm3.test)^2)
SSE3
[1] 47.69199

#Comparing the above three constructed models, we came to a conclusion that we 
#choose the 2nd model from the other three because it is the lowest of them all.

