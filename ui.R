library(shiny)
shinyUI(pageWithSidebar(
        headerPanel(
                h1('Miles per Gallon Prediction App', windowTitle = 'Miles per Gallon Prediction App')
                ),
        sidebarPanel(
                h3('ENTER Predictors of MPG'),
                numericInput('hp', 'Gross horsepower:', 140, min = 50, max = 330, step = 10), # example of numeric input
                radioButtons('cyl', 'Number of cylinders:', c('4' = 4, '6' = 6, '8' = 8), selected = '4', inline = TRUE), # example of radio button input
                numericInput('wt', 'Weight (lbs):', 3200, min = 1500, max = 5500, step = 100)
                ),
        mainPanel(
                h3('Developing Data Products - Course Project, Shiny Application and Reproducible Pitch'),
                p('Author: Tamas Izsak | Date: 2016'),
                h4('Instructions'),
                p('Enter the gross horsepower, the number of cylinders, and the weight of the
                  car on the left sidebar.'),
                p('The predicted MPG will be shown on the main frame in the RESULTS section.'),
                h4('Method'),
                p('I fit a linear model to the mtcars dataset, modeling the effect of 
                  horsepower, number of cylinders, and weight on the mpg.  Since the 
                  only valid possibilities for number of cylinders in the dataset were 
                  4, 6, and 8, I limited the choice using radio buttons.  For the weight,
                  reactive() is used to convert the user input weight into the units 
                  used by the model, lb/1000.  Finally, a pre-set function using the 
                  linear model is used to predict the mpg based on the three variables 
                  input by the user.'),
                p('------------------------------------------------------'),
                h2('RESULTS'),
                h4('Predictors you entered:'),
                verbatimTextOutput("inputValues"),
                p('------------------------------------------------------'),
                h4('Results based on the predictors:'),
                verbatimTextOutput("prediction"),
                p('------------------------------------------------------'),
                h4('MPG relative to cars in mtcars data set:'),
                plotOutput('plots')
                )
        ))