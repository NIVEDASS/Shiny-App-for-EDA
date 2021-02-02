shinyServer(function(input, output, session) {
  
  datadata <- Ass1Data
  makeReactiveBinding("datadata")
  
  newData <- reactive({
    
    input$goButton
    isolate({
  
      suppressWarnings({
      #All the stations dataset is under the folder named 'weather stations'. Once given this main path, it automatically fetches all the dataset inside this root folder.
      half_path = file.path("C:/Users/NIVEDITHA/Desktop/Fire Season Severity prediction using Machine Learning/dataset/Weather_stations", input$station_code)
      last_path = str_c(c(input$station_code, "wx.xlsx"), collapse = "-")
      full_path = file.path(half_path, last_path)
      print(full_path)
      sheet_name = str_c(c(input$station_code, "old"), collapse = "-")
      #print(sheet_name)
      dat <- read_excel(full_path, sheet = sheet_name)
      dat$Date<- as.Date(dat$Date)
      #Chosen only first 900 observations for clear understanding of charts, whole dataset can be used.
      datadata <- as.data.frame(dat)[1:900,]
      
      
      })
      
    })
  })
  
  
  output$Assign1 <- DT::renderDataTable({
    Ass1Data <- newData()
    DT::datatable(data = as.data.frame(Ass1Data), style = "bootstrap")
  })
  
  output$dcplot <- renderPlot({
    Ass1Data <- newData()
    
    
    data7 <- subset(Ass1Data, select = c(DC,DSR,BUI,Date))[1:980,]
    
    my1 <-  str_c(c(str(input$year_to_plot), "07-01"), collapse = "-")
    my2 <- str_c(c(str(input$year_to_plot), "07-01"), collapse = "-")
    one_year <- data7 %>%
      filter(Date >= as.Date(paste(input$year_to_plot, "07-01",sep = "-")) & Date <= as.Date(paste(input$year_to_plot1, "07-01",sep = "-")))
    
  
    p <- ggplot(one_year, aes(y = DC , x = Date))
    p + geom_line() + geom_point()

  })
  
  output$dsrplot <- renderPlot({
    Ass1Data <- newData()
    
    
    data8 <- subset(Ass1Data, select = c(DC,DSR,BUI,Date))[1:980,]
    
    my1 <-  str_c(c(str(input$year_to_plot), "07-01"), collapse = "-")
    my2 <- str_c(c(str(input$year_to_plot), "07-01"), collapse = "-")
    one_year <- data8 %>%
      filter(Date >= as.Date(paste(input$year_to_plot, "07-01",sep = "-")) & Date <= as.Date(paste(input$year_to_plot1, "07-01",sep = "-")))
    
    q <- ggplot(one_year, aes(y = DSR , x = Date))
    q + geom_line() + geom_point()
   
  })
  
  output$buiplot <- renderPlot({
    Ass1Data <- newData()
   
    
    data9 <- subset(Ass1Data, select = c(DC,DSR,BUI,Date))[1:980,]
    
    my1 <-  str_c(c(str(input$year_to_plot), "07-01"), collapse = "-")
    my2 <- str_c(c(str(input$year_to_plot), "07-01"), collapse = "-")
    one_year <- data9 %>%
      filter(Date >= as.Date(paste(input$year_to_plot, "07-01",sep = "-")) & Date <= as.Date(paste(input$year_to_plot1, "07-01",sep = "-")))
    
    r <- ggplot(one_year, aes(y = BUI , x = Date))
    r + geom_line() + geom_point()
  })
  
  output$Plot <- renderPlot({
    
    print(nrows(Ass1Data))
    plot(Ass1Data)
  })
  
  output$SummaryA1 <- renderPrint({
    Ass1Data <- newData()
    glimpse(Ass1Data)
  })
  
  output$SummaryA2 <- renderPrint({
    Ass1Data <- newData()
    summary(Ass1Data)
  })
  
  output$Boxplot <- renderPlot({
    Ass1Data <- newData()
    data <- as.matrix(Ass1Data[c("DC","BUI","DSR","Temp","RH","Rain","FFMC","DMC","ISI","FWI","FFI")])
    data <- scale(data, center = input$standardise, scale = input$standardise)
    car::Boxplot(formula = ~., data = data, ylab=NA, use.cols = TRUE, notch = FALSE, varwidth = FALSE,  
            horizontal = FALSE, outline = input$outliers, 
            col = brewer.pal(n = dim(Ass1Data)[2], name = "RdBu"),
            range = input$range, main = "Boxplot of Data")
  })
  
  output$Boxplot2 <- renderPlot({
    Ass1Data <- newData()
    formula <- as.formula(paste("~",paste(input$VariablesB, collapse = " + ")))
    data <- as.matrix(Ass1Data[c("DC","BUI","DSR","Temp","RH","Rain","FFMC","DMC","ISI","FWI","FFI")])
    data <- scale(data, center = input$standardise, scale = input$standardise)
    car::Boxplot(formula = formula, data = data, ylab=NA, use.cols = TRUE, notch = FALSE, varwidth = FALSE,  
                 horizontal = FALSE, outline = input$outliers, 
                 col = brewer.pal(n = dim(Ass1Data)[2], name = "RdBu"),
                 range = input$range5, main = "Boxplot of Data")
  })
  
  
  output$Boxplot1 <- renderPlotly({
    Ass1Data <- newData()
    ggplotly(ggplot(stack(Ass1Data[c("DC","BUI","DSR","Temp","RH","Rain","FFMC","DMC","ISI","FWI","FFI")]), aes(x = ind, y = values)) + geom_boxplot())
    
  })
  
  
  output$Corrgram <- renderPlot({
    Ass1Data <- newData()
    corrgram::corrgram(Ass1Data[c("DC","BUI","DSR","Temp","RH","Rain","FFMC","DMC","ISI","FWI","FFI")], 
             order = input$Group, 
             abs = input$abs, 
             cor.method = input$CorrMeth,
             main = "Correlation of Data")
  })
  
  output$Missing <- renderPlot({
    Ass1Data <- newData()
    visdat::vis_miss(Ass1Data, cluster = input$cluster) +
      labs(title = "Missingness of Data")
  })
  
  output$Missing2 <- renderPlot({
    Ass1Data <- newData()
    visdat::vis_dat(Ass1Data)+
      labs(title = "Missingness of Data")
  })
  
  output$Missing1 <- renderPlot({
    Ass1Data <- newData()
    visdat::vis_miss(Ass1Data[input$selecter])+
      labs(title = "Missingness of one Variable")
  })
  
 
  # output$Rising <- renderPlot({
  #   Ass1Data <- newData()
  #   d <- Ass1Data[c("DC","BUI","DSR","Temp","RH","Rain","FFMC","DMC","ISI","FWI","FFI")]
  #   for (col in 1:ncol(d)) {
  #     d[,col] <- d[order(d[,col]),col] #sort each column in ascending order
  #   }
  #   d <- scale(x = d, center = TRUE, scale = TRUE)  # scale so they can be graphed with a shared Y axis 
  #   mypalette <- rainbow(ncol(d))
  #   matplot(x = seq(1, 100, length.out = nrow(d)), y = d, type = "l", xlab = "Percentile (%)", ylab = "Standardised Values", lty = 1, lwd = 1, col = mypalette, main = "Rising Value Chart")
  #   legend(legend = colnames(d), x = "topleft", y = "top", lty = 1, lwd = 1, col = mypalette, ncol = round(ncol(d)^0.3))
  # })
  
})
