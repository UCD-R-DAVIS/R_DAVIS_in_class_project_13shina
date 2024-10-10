getwd()
'data/portal_data_joined.csv'
file_loc <- 'data/portal_data_joined.csv'
read_csv(file_loc)

surveys_base <- surveys [1:5000, c ('species_id', 'weight', 'plot_type')]
surveys_base

surveys_base <- surveys_base[complete.cases(surveys_base), ]

cool <- factor(c(surveys_base$species_id))
notcool <- factor(c(surveys_base$plot_type))

levels(cool)
class(cool)
nlevels(cool)

typeof(cool)
cool


levels(notcool)


gone <- c(surveys_base$weight)
gone[!is.na(gone)] #to remove a certain vector
gone[complete.cases(gone)]


# factor is different from character because character is just a string of text and factors stare data as levels

# We want to use factors when we have categorical data like the one we used from the survey

# An example can be like a dataset of "Food" with levels like "Pizza" "Burger" "Salads" 



