library(readr)
setwd('~/Desktop/GECCO25_GP_LLM')

# Read the CSV file
data <- read_csv("succ_rate.csv")

# Initialize a list to store results
results <- list()

# Iterate over each row and run the pairwise proportion test
for (i in 1:nrow(data)) {
  problem <- data$Problem[i]
  a1 <- data$PushGP[i]
  a2 <- data$`GPT-4o (Data)`[i]
  a3 <- data$`GPT-4o (Text)`[i]
  
  # Perform the pairwise proportion test
  test_result <- pairwise.prop.test(c(a1, a2, a3), c(100, 100, 100))
  
  # Store result in the list
  results[[problem]] <- test_result
}

# Print the results
print(results)
