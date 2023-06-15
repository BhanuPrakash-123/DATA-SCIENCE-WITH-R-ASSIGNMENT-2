#Question-"a"
data(iris)

par(mfrow = c(1, 2))  
boxplot(Sepal.Length ~ Species, data = iris, main = "Sepal Length by Species")
boxplot(Petal.Length ~ Species, data = iris, main = "Petal Length by Species")

plot(iris$Sepal.Length, iris$Petal.Length, col = iris$Species,
     xlab = "Sepal Length", ylab = "Petal Length", main = "Scatterplot of Sepal.Length and Petal.Length")
legend("topright", legend = unique(iris$Species), col = unique(iris$Species), pch = 1)
___________________________________________________________________________________________________

#Question-"c"
library(MASS)
data(ships)
incident_counts <- tapply(ships$incidents, ships$type, sum)
barplot(incident_counts, 
        main = "Total Number of Incidents by Ship Type",
        xlab = "Ship Type",
        ylab = "Total Number of Incidents",
        col = "steelblue")
_____________________________________________________________________________________________________
#Question-"d"
library(rvest)

list = data.frame()

for (page in 1:13855) {
  
  link = paste0("https://stats.stackexchange.com/questions?tab=votes&page=","page")
  page_link = read_html(link)
  
  The_title_of_the_questions = page_link %>% html_nodes("#questions .s-link") %>% html_text()
  The_notes_of_votes = page_link %>% html_nodes(".s-post-summary--stats-item__emphasized .s-post-summary--stats-item-number") %>% html_text()
  The_number_of_views = page_link %>% html_nodes(".is-supernova .s-post-summary--stats-item-number") %>% html_text()
  The_number_of_answers = page_link %>% html_nodes(".has-answers .s-post-summary--stats-item-number") %>% html_text()
  
  list = rbind(list, data.frame(The_title_of_the_questions,The_notes_of_votes,The_number_of_views,The_number_of_answers,stringsAsFactors = FALSE))
  
}
____________________________________________________________________________________________________________________
#question-"e"
trials <- 100000
total_days <- 0
for (i in 1:trials) {
  days <- 0
  tablets <- 100
  while (tablets > 0) {
    days <- days + 1
    if (runif(1) < tablets / (tablets + days - 1)) {
      break
    }
    tablets <- tablets - 1
  }
  total_days <- total_days + days
}
average_days <- total_days / trials
average_days
