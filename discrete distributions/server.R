#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
function(input, output, session) {
  
  sliderValues <- reactive({
    data.frame(
      Name = c("n","p","N",
                "p_geom","N_geom",
               "r","p_ngb","N_ngb",
                "n_hyp", "k_hyp", "nn_hyp",
                "n_pois", "lambda_pois"),
      Value = as.character(c(input$ineger,input$decimal, input$integer,
                             input$integer,input$decimal, input$integer))
      )
  }) # Binomial distribution 
    output$binomPlot <- renderPlot({
     
        # generate random numbers from the binomal distribution 
        data  <- data.frame(x=rbinom(n=input$N, size=input$n, prob=input$p))

        # plot distribution
        ggplot(aes(x=x),data=data) + geom_bar() + theme_bw()

    })    # Geomertic distribution 
    output$geomPlot <- renderPlot({
      
      # generate random numbers from the geometric distribution  
      data  <- data.frame(x=rgeom(n=input$N_geom, prob=input$p_geom))
      
      # plot distribution 
      ggplot(aes(x=x),data=data) + geom_bar() + theme_bw()
      
    })    # Negative binomial distribution 
    output$nbinomPlot <- renderPlot({
      
      # generate random numbers from the negative binomial distribution 
      data  <- data.frame(x=rnbinom(n=input$N_ngb, size=input$r, prob=input$p_ngb))
      
      # plot distribution 
      ggplot(aes(x=x),data=data) + geom_bar() + theme_bw()
      
    })    # Hypergeometric distribution 
    output$hyperPlot <- renderPlot({
      # the specification of the hypergeometric distribution in R is not the standard
      # K^C_k* {N-K}C_{n-k} / N^C_n
      # nn_hyp = N (= m + n)
      # m = K
      # k = n
      
      # re defining the input parameters
      k <- input$n_hyp
      N <- input$nn_hyp
      m <- input$K_hyp
      n <- N - m
      
      # generate random numbers from the hypergeometric distribution  
      data  <- data.frame(x=rhyper(nn=N, m=m, n=n, k=k))
      
      # plot distribution 
      ggplot(aes(x=x),data=data) + geom_bar() + theme_bw()
      
    }) # Poisson distribution 
    output$poisPlot <- renderPlot({
      
      # generate random numbers from the Poisson distribution  
      data  <- data.frame(x=rpois(n=input$n_pois, lambda=input$lambda_pois))
      
      # plot distribution 
      ggplot(aes(x=x),data=data) + geom_bar() + theme_bw()
      
    })
}
