#created by Dr. Nathan Pincus, MD, PhD and Dr. Travis Kochan, PhD

#Load drc package
library(drc)

##########################################################################
##########################################################################
##########################################################################

#Read in input data for all experiments (including time, starting worms, surviving worms)
input <- read.csv("~/Desktop/InputFile.csv", header = TRUE)

##########################################################################
##########################################################################
##########################################################################

#make a list of all unique strains
strains <- unique(input$Strain)

#Create a data frame to hold a summary of all experiments for each strain
mort <- as.data.frame(matrix(nrow=length(strains),ncol=4))
rownames(mort) <- strains
colnames(mort) <- c("time","total","dead","CFU")

#Initialize empty lists for time, total worms, and mortalities.  This will be a list of vectors, where each vector is the corresponding data for all experiments with a given strain
d <- list()
tot <- list()
m <- list()
p <- list()

# Iterate through each unique strain
# Create a sub-table including just the experiments with that strain
# extract all time, total worms, and mortality data from these strains to the above vectors
for(strain in strains){
  print(strain)
 # print(which(input$Strain == strain))
  t <- input[which(input$Strain == strain),]
  d[[strain]] <- t[,2]
  tot[[strain]] <- t[,3]
  m[[strain]] <- t[,4]
  p[[strain]] <- t[,5]
}

# Use the time, total worms, and mortality lists to fill the summary data frame
mort$time <- d
mort$total <- tot
mort$dead <- m
mort$dose <- p

#Create a data frame to hold LT50 and SD for each strain
#also create a data frame to hold LT50s and SD if calculated using non-log10 transformed times
LT50s <- as.data.frame(matrix(nrow=length(strains),ncol=3))
colnames(LT50s) <- c("SD","LT50","CFU")
LT50s_nonlog <- LT50s

# For each strain extract the time, total worms, and mortality information from the mort table
# Try to fit to bionomial distribution using drc (drm) - if possible put in LT50s table
# Done with logtime = 10 as well to compare to case when you convert back to raw time before fitting to model
for(strain in strains){
  times <- unlist(mort[strain,"time"])
  total_worms <- unlist(mort[strain,"total"])
  mortalities <- unlist(mort[strain,"dead"])
  dose <- unlist(mort[strain,"dose"])
  print(strain)
  try({
    model <- drm(mortalities/total_worms ~ times, weights = total_worms, fct = LL.2(), type = "binomial")
    LT50s[strain,"LT50"] <- ED(model,50)[1]
    LT50s[strain,"SD"] <- ED(model,50)[2]
    plot(model, xlab = "Times", ylab = "% Dead")
    abline(v = LT50s[strain,"LT50"], col = "red")
    title(strain)
    
  })
}

#Fill CFU column in the LT50s dataframe
for(strain in strains){
    dose <- unlist(mort[strain,"dose"])
    print (dose[1])
    LT50s[(strain),("CFU")] <- (dose[1])
}







##########################################################################
##########################################################################
##########################################################################

write.csv(LT50s, file="~/Desktop/OutputFile.csv")


##########################################################################
##########################################################################
##########################################################################
