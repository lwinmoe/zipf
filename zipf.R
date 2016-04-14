#!/usr/bin/Rscript
data <- read.csv("count_1w.txt", header=TRUE,sep="\t")
data <- data[order(data$FREQ,decreasing=TRUE),]
order.FREQ <- order(data$FREQ,data$WORD,decreasing=TRUE)
data$rank <- NA
data$rank[order.FREQ] <- 1:nrow(data)
jpeg('zipf_log.jpg')
plot(log(data$rank), log(data$FREQ),xlab='log(Rank)', ylab='log(Freq(Rank)')
dev.off()
jpeg('zipf_raw.jpg')
plot(data$rank, data$FREQ, xlab="Rank", ylab="Freq")
dev.off()

