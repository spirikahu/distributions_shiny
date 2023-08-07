#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Discrete distributions"),

    # Binomial distribution 
    sidebarLayout(
        sidebarPanel(
          h5("Binomial distribution"),
            #  adding slider for n parameter 
            sliderInput("n", "Number of trials, n:",
                        min = 1, max = 100,
                        value = 1),
            # 
            sliderInput("p", "Probability of success, p:",
                        min = 0, max = 1.0,
                        value = 0.5),
            
            sliderInput("N", "Number of samples:",
                        min = 1, max = 100,
                        value = 50)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("binomPlot")
        )
    ),
    # Geometric distribution
    sidebarLayout(
      sidebarPanel(
        h5("Geometric distribution"),
        # 
        sliderInput("p_geom", "Probability of success, p:",
                    min = 0, max = 1.0,
                    value = 0.5),
        
        sliderInput("N_geom", "Number of samples:",
                    min = 1, max = 100,
                    value = 50)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        plotOutput("geomPlot")
      )
    ),
    # Negative binomial distribution
        sidebarLayout(
          sidebarPanel(
            h5("Negative binomial distribution"),
            #  adding slider for n parameter 
            sliderInput("r", "Target number of successes, n:",
                        min = 1, max = 100,
                        value = 1),
            # 
            sliderInput("p_ngb", "Probability of success, p:",
                        min = 0, max = 1.0,
                        value = 0.5),
            
            sliderInput("N_ngb", "Number of samples:",
                        min = 1, max = 100,
                        value = 50)
          ),
          
          # Show a plot of the generated distribution
          mainPanel(
            plotOutput("nbinomPlot")
          )
    ),
    
    # Hypergeometric distribution
    sidebarLayout(
      sidebarPanel(
        h5("Hypergeometric distribution"),
        #  adding slider for n parameter 
        sliderInput("n_hyp", "Size of sample, n:",
                    min = 1, max = 100,
                    value = 20),
        # 
        sliderInput("K_hyp", "Total number subjects with attribute, K:",
                    min = 0, max = 100,
                    value = 10),
        
        sliderInput("nn_hyp", "Population size N:",
                    min = 1, max = 1000,
                    value = 200)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        plotOutput("hyperPlot")
      )
    ),

    # Poisson distribution
    sidebarLayout(
      sidebarPanel(
        h5("Poisson distribution"),
        #  adding slider for n parameter 
        sliderInput("n_pois", "Size of sample, n:",
                    min = 1, max = 1000,
                    value = 100),
        # 
        sliderInput("lambda_pois", "Rate, lambda:",
                    min = 0, max = 10,
                    value = 1)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        plotOutput("poisPlot")
      )
    )
)


