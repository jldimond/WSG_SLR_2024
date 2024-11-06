setwd("/Users/molecularlab/Documents/WSG_SLR_2024/Katharina/results/angsd/")

library(ggplot2)

#import sample info
samples <- read.delim("samples.txt", sep = "\t", header = FALSE)

#import ibsMat file
m <- as.matrix(read.table("kath_all.ibsMat"))
mds <- cmdscale(as.dist(m))
mds_samples <- as.data.frame(cbind(samples, mds))
mds_samples$V2 <- as.factor(mds_samples$V2)
colnames(mds_samples) <- c("sample","site","X1", "X2")

ggplot(mds_samples, aes(x = X1, y = X2, color = site, label = sample)) +
  geom_point() +
  geom_text()


m2 <- as.matrix(read.table("kath_all.covMat"))
e2 <- eigen(m)
e2_matrix <- as.matrix(e2$vectors)
pca_samples <- as.data.frame(cbind(samples, e2_matrix))
pca_samples$V2 <- as.factor(pca_samples$V2)
colnames(pca_samples)[3] <- "X1"
colnames(pca_samples)[4] <- "X2"

ggplot(pca_samples, aes(x = X1, y = X2, color = V2, label = V1)) +
  geom_point() +
  geom_text()

#scree plot
plot(e2$values, type = "l")
