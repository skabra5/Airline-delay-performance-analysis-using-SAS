# Airline-delay-performance-analysis-using-SAS
The dataset is obtained from Bureau of Transportation Statistics: https://www.transtats.bts.gov/DL_SelectFields.asp?Table_ID=236&DB_Short_Name=On%20-Time

Created macro variables and functions for data cleaning; Used multiple imputation to handle missing values; Used data-steps to create new variables and perform variable transformations.

Conducted regression analysis to study departure delays using PROC Reg & GLM and poisson regression using PROC Genmode to analyze delay count, which determines the count of number of times an airplane delays by more than 15 minutes. Also experimented how different sort orders of data affect the regression results.
