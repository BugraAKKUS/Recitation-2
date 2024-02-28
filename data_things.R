file_path <- file.choose()
data <- read.csv(file_path)
data
colnames(data) <- c("Name", "Sex", "Age", "Height", "Weight")
plot(data$Height, data$Weight, col = "lightblue", lwd = 3,
     xlab = "Height", ylab = "Weight", 
     main = "REaltion betwen height and weight")

#print the plot as apdf

dev.print(pdf, "part_vi.pdf")

###
install.packages("babynames")
library(babynames)
View(babynames)
baby_10 <- babynames[sample(nrow(babynames), size = , replace = F),]
barplot(baby_10$n, names.arg = baby_10$name,
        col = ifelse(baby_10$sex == "F", "pink", "lightblue"),
        cex.names = 0.8, beside = T)

legend("topright", legend = unique(baby_10$sex, fill = c("pink", "lightblue"),
                                   title = "Sex"))
