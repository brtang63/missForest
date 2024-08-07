library(matrixStats)

data <- as.data.frame(matrix(rnorm(1000*100), nrow = 1000))

# Introduce missing values: 5% of the total
total_values <- 1000*100
num_missing <- total_values * 0.05
missing_indices <- sample(1:total_values, num_missing)

for(index in missing_indices) {
  data[as.integer((index-1)/100) + 1, (index-1) %% 100 + 1] <- NA
}

# library(missForest)

require(doParallel)
# registerDoParallel(cores=3)

missForest(data, ntree = 10, mtry = 10)

