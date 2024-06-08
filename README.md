
## This R-Script accompanies the paper titled: "Refined methodology for quantifying *Pseudomonas aeruginosa* virulence using *Galleria mellonella*" 
doi: TBD


 **Description:**
 
 This R-Script takes in mortality observations from a Galleria mellonella infection experiment and uses them
 to estimate the LT50 for a particular dose of bacteria. These LT50s can then be used in further downstream 
 analysis, as detailed in the accompanying paper. This script allows for rapid estimation of LT50s increasing
 the throughput potential of this methodology. 

 **Using the R-Script**
 
+ Key Tips Regarding Your Input File:
  + Include the following headers: Strain/dose, Time, Total Worms, Mortalities, CFU
  + The file type should be a .csv
  + The "Time" column should be hours-post-injection

