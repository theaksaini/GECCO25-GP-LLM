setwd('~/Downloads')
testing <- read.csv('validation_results_stat.csv', header = TRUE, stringsAsFactors = FALSE)

# Total trials for each condition
trials <- rep(20, 5)

# Initialize an empty list to store results for all rows
all_fisher_results <- list()

# Iterate over rows 1 to 25
for (row in 1:25) {
  # Extract successes for the current row
  successes <- as.numeric(testing[row, c("Austin2021_both", "ChenEqual_both", "ChenReturn_both", "Sharlin2024_both", "Wen2024_both")])
  
  # Failures for each condition
  failures <- trials - successes
  
  # Initialize a list to store results for the current row
  fisher_results <- list()
  
  # Perform pairwise comparisons
  for (i in 1:(length(successes) - 1)) {
    for (j in (i + 1):length(successes)) {
      # Create a 2x2 contingency table
      contingency_table <- matrix(
        c(successes[i], failures[i], successes[j], failures[j]),
        nrow = 2, byrow = TRUE
      )
      # Perform Fisher's exact test
      test <- fisher.test(contingency_table, alternative = "two.sided")
      # Store the result with group info
      fisher_results[[paste("Condition", i, "vs", j)]] <- test$p.value
    }
  }
  
  # Adjust p-values using Bonferroni correction
  adjusted_p <- p.adjust(unlist(fisher_results), method = "holm")
  
  # Store results for the current row
  all_fisher_results[[paste("Row", row)]] <- list(
    raw_p_values = fisher_results,
    adjusted_p_values = adjusted_p
  )
}

# Display all results
all_fisher_results