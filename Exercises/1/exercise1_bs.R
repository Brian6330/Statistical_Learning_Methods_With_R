# Brian Schweigler (16-102-071)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#pasquale.derosa@unine.ch

#######
# 1. For each variable, compute
# the mean,
# the median,
# the standard deviation,
# the minimum and
# maximum value
#######

data = read.csv("education.txt", header = TRUE, sep = "\t")

# Mean, median, min and max can be gotten via the summary function
data.summarized = summary(data)

# The standard deviation (sd) must be handled separately
id.sd = sd(data$ID)
education.sd = sd(data$Education)
gender.sd = sd(data$Gender)
wage.sd = sd(data$Wage)

#######
# 2. As the variable Gender is a categorical (binary data), select the
# Wage and Education values corresponding to each of the two
# possible Gender values.
# Compute the mean,
# 				the median,
# 				the standard deviation
# 				the minimum and maximum value
# for each Gender separately.
# What can you infer from these values?
#######

# select data by gender (1 = male, 2 = female; source: Education.pdf)
female = data[which(data$Gender == 2),]
female.summarized = summary(female)
female.id.sd = sd(female$ID)
female.education.sd = sd(female$Education)
female.gender.sd = sd(female$Gender) # Should be 0 as only 1 gender!
female.wage.sd = sd(female$Wage)

male = data[which(data$Gender == 1),]
male.summarized = summary(male)
male.id.sd = sd(male$ID)
male.education.sd = sd(male$Education)
male.gender.sd = sd(male$Gender) # Should be 0 as only 1 gender!
male.wage.sd = sd(male$Wage)

print("Male average wage within the dataset is higher than female wage, the total range is also a lot larger for female than male.")
print("The best way to compare wage would be via the diferent quartiles. Furthermore of interest is that despite having similar years in education, the females still earn less than males.")


#######
# 3. Can you detect some inconsistencies in the data?
# If yes, what would you do to handle them?
#######
print("The minimal years of education for females is -12, which is an invalid value. Negative years of education (and wage) could just be removed from the dataset.")
print("Furthermore, ID is not useful in the analysis, as they are just from 1 to 500. (but important for the data entries themself).")
print("Lastly, wage of 41.8 for females seems really low. Here, more information about how the data would be required, to know if values e.g. below 1000.- are valid or not.")
print("There is also an invalid gender of '20', which needs to be removed or adjusted to '2'")
#######
# 4. What can you infer from all the other variables when the main
# focus is to predict the values for Wage?
#######
print("As we are missing age, we can only establish a possible correlation between years of education and wage, split by gender.")
print("Furthermore, the relationship between gender and wage, as mentioned in the second question, can also be looked at.")
print("Lastly, the difference in the median and mean salaries, as well as the 1st and 3rd quartile for male and female, could be worth another look. As the max wage for female and female are similar, but the quartiles aren't, we can infer more information about how many people (25%, 50%, or 75% of a specific gender) earn how much money in this dataset.")
