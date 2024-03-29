library(rstan)
setwd(paste(getwd(),"bayesian multilevel learning",sep = '/'))


# Data --------------------------------------------------------------------
schools_data <- list(
    J = 8, 
    y = c(28,  8, -3,  7, -1,  1, 18, 12),
    sigma = c(15, 10, 16, 11,  9, 11, 10, 18)
)



# Fit ---------------------------------------------------------------------
fit1 <- stan(
    file = "schools.stan",  # Stan program
    data = schools_data,    # named list of data
    chains = 4,             # number of Markov chains
    warmup = 1000,          # number of warmup iterations per chain
    iter = 2000,            # total number of iterations per chain
    cores = 2,              # number of cores (using 2 just for the vignette)
    refresh = 1000          # show progress every 'refresh' iterations
)