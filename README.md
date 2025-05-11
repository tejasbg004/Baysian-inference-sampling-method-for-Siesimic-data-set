# Corner Plot indicating joint distribution between two parameters at a time
![Alt text](https://github.com/tejasbg004/Baysian-inference-sampling-method-for-Siesimic-data-set/blob/main/Cornerplot.jpg)

# Credible and 95% predictive plot indicating 
![Alt text](https://github.com/tejasbg004/Baysian-inference-sampling-method-for-Siesimic-data-set/blob/main/intervals.jpg)

## MATLAB Files and its function
 ### 1 MCMC.m
       Contains Random Walk Metropolis algorithm that is used to generate the samples from the posterior distribution of the parameters
 ### 2 Post_samples.m
       Contains predictions of the slip-rate displacememnt for different randomly drawn parameters from the posterior distribution at every x location
 ### 3 argmin.m and minimum.m
       Evaluates the average slip-rate displacement through out x location and finds the parameter for which, the average value is minimum
 ### 4 cornerplot.m and kde2.m
       Together containes functions that performs corner plots
 ### 5  interval.m
       contains code to plot 95% Credible and predictive interval


