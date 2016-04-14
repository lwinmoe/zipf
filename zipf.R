#!/usr/bin/Rscript

# read in the data file
data <- read.csv("count_1w.txt", header=TRUE,sep="\t")

# order the data in decreasing order by the FREQ column
data <- data[order(data$FREQ,decreasing=TRUE),]

# in decreasing order by the FREQ column
order.FREQ <- order(data$FREQ,data$WORD,decreasing=TRUE)

# to add a new column (RANK) using order.FREQ defined above
data$rank <- NA
data$rank[order.FREQ] <- 1:nrow(data)

# Plot rank and FREQ using log function, and save to a file
jpeg('zipf_log.jpg')
plot(log(data$rank), log(data$FREQ),xlab='log(Rank)', ylab='log(Freq(Rank)')
dev.off()

# Plot raw without using log, and save to a file
jpeg('zipf_raw.jpg')
plot(data$rank, data$FREQ, xlab="Rank", ylab="Freq")
dev.off()

