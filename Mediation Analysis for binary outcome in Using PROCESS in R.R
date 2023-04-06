# Read the data
data_mediation <-
  read.csv("https://raw.githubusercontent.com/tidydatayt/binary_mediation/main/binary_outcome_mediation_data.csv")

# show the first 6 rows of the data
head(data_mediation)

# key mediation statement
process(data = data_mediation, y = "Y", x = "X", m ="M", model = 4)
