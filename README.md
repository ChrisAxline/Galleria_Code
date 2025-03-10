
## This R-Script accompanies the paper titled: "Refined methodology for quantifying *Pseudomonas aeruginosa* virulence using *Galleria mellonella*" 
doi: (https://doi.org/10.1128/spectrum.01666-24)


 **Description:**
 
 This R-Script takes in mortality observations from a Galleria mellonella infection experiment and uses them
 to estimate the LT50 for a particular dose of bacteria. These LT50s can then be used in further downstream 
 analysis, as detailed in the accompanying paper. This script allows for rapid estimation of LT50s increasing
 the throughput potential of this methodology. 

 **Using the R-Script**
 
+ Key Tips Regarding Your Input File:
  + Include the following headers: Strain/dose, Time, Total Larvae, Mortalities, CFU
  + The file type should be a .csv
  + The "Time" column should be hours-post-injection
 
<p align = "center">
<img width="423" alt="Screenshot 2024-07-07 at 7 09 34 PM" src="https://github.com/ChrisAxline/Galleria_Code/assets/110562794/64d35a4a-7b93-4086-aa72-46dace5552b2">
</p>

The script fits a sigmoidal curve to the mortality observations from the input file (Fig 4 in the paper linked above) and uses this fit curve to estimate the LT50 for doses where exactly 5 deaths may not have been observed by a researcher during a check.
