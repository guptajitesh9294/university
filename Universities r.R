data <- read.csv(file.choose())
View(data)

input <- data[2:7]
View(input)

# Hierarchical university
norm_data <- scale(input)
View(norm_data)

d1 <- dist(norm_data,method = "euclidean")
fit1 <- hclust(d1,method = "complete")
windows()
plot(fit1,hang=-1)

fit2 <- hclust(d1,method = "single")
windows()
plot(fit2,hang=-1)

fit3 <- hclust(d1,method = "centroid")
windows()
plot(fit3,hang=-1)

groups <- cutree(fit1,k=5)
groups

str(groups)

windows()
plot(fit1,hang=-1)
rect.hclust(fit1,k=5,border = "blue")

cluster_no <- as.data.frame(groups)
final <- data.frame(cluster_no,data)
View(final)


aggregate(final[,3:8],by=list(final$groups),FUN=mean)
write.csv(final,file="university.csv")
getwd()
