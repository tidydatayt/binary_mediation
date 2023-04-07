# Notes:

#1. The author accepts no responsibility for the topicality, correctness, completeness, 
# or quality of the information provided.
#2. This pdf is part of a YouTube tutorial: https://youtu.be/Fh_xtfWZajc
#3. This pdf is for your own personal use only. Please do not distribute.


## Step 1 Read data

# Read the data
data_mediation <-
  read.csv("https://raw.githubusercontent.com/tidydatayt/binary_mediation/main/binary_outcome_mediation_data.csv")


# Step 2: write the basic function

Mediation_function_binary_outcome<-function(data_used,i)
{
  # Sample a data
  data_temp=data_used[i,]
  
  # a path
  result_a<-lm(M~X, data = data_temp)
  a_0<-result_a$coefficients[1]
  a_1<-result_a$coefficients[2]
  
  # b path
  result_b<-glm(Y~M+X, data = data_temp,family = "binomial")
  b_0<-result_b$coefficients[1]
  b_1<-result_b$coefficients[2]
  c_1_apostrophe<-result_b$coefficients[3]
  
  #calculating the indirect effect
  indirect_effect<-a_1*b_1
  return(indirect_effect)
}


## Step 3: 

# use boot() to do bootstrapping mediation analysis
boot_mediation <- boot(Mediation_data, Serial_Mediation_function, R=5000)

# print out confidence intervals
boot.ci(boot.out = boot_mediation, type = c("norm", "perc"))




