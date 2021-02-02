shinyUI(

  fluidPage(#theme = shinytheme("cerulean"),
            
            inlineCSS("#Mosaic { font-size:30px; }
                 .Mosaic { color: red; border: 1px solid black;}
                  .navbar-default { background-color: #9615DB !important;}"),
            theme = shinytheme("cerulean"), 
            #shinythemes::themeSelector(),
    useShinyjs(),
    #titlePanel("Fire Season Severity Data", windowTitle = "Shiny App"), br(),
     
    #tabsetPanel(
      
    navbarPage("FIRE SEASON SEVERITY DATA",
               #tabPanel("RAW DATA", icon = icon("table"),
                        #tabsetPanel(
               sidebarLayout(
     #tabPanel("Select Station",
              br(),
              
              sidebarPanel(
              selectInput(inputId = "station_code", label ="Station Code:", choices = list("APA" = "APA",
                                                                                           "APP" = "APP",
                                                                                           "ASH" = "ASH",
                                                                                           "ASY" = "ASY",
                                                                                           "ATH" = "ATH",
                                                                                           "AWV" = "AWV",
                                                                                           "BGO" = "BGO",
                                                                                           "BML" = "BML",
                                                                                           "BMT" = "BMT",
                                                                                           "BPO" = "BPO",
                                                                                           "BRP" = "BRP",
                                                                                           "BTL" = "BTL",
                                                                                           "Bucklands_Raws" = "Bucklands_Raws",
                                                                                           "BUR" = "BUR",
                                                                                           "Butchers_Dam_Raws" = "Butchers_Dam_Raws",
                                                                                           "Cape Campbell" = "Cape Campbell",
                                                                                           "CDT" = "CDT",
                                                                                           "CHA" = "CHA",
                                                                                           "CLV" = "CLV",
                                                                                           "CLY" = "CLY",
                                                                                           "COR" = "COR",
                                                                                           "CPX" = "CPX",
                                                                                           "CRK" = "CRK",
                                                                                           "CRM" = "CRM",
                                                                                           "CRT" = "CRT",
                                                                                           "CYB" = "CYB",
                                                                                           "DAR" = "DAR",
                                                                                           "DNA" = "DAR",
                                                                                           "DNP" = "DNP",
                                                                                           "DOV" = "DOV",
                                                                                           "DPS" = "DPS",
                                                                                           "ELT" = "ELT",
                                                                                           "GAL" = "GAL",
                                                                                           "GBI" = "GBI",
                                                                                           "GLD" = "GLD",
                                                                                           "GSA" = "GSA",
                                                                                           "GWA" = "GWA",
                                                                                           "HAN" = "HAN",
                                                                                           "HAW" = "HAW",
                                                                                           "Hicks Bay SYNOP" = "Hicks Bay SYNOP",
                                                                                           "HIR" = "HIR",
                                                                                           "HKA" = "HKA",
                                                                                           "HNA" = "HNA",
                                                                                           "HOK" = "HOK",
                                                                                           "HRB" = "HRB",
                                                                                           "HWT" = "HWT",
                                                                                           "KAI" = "KAI",
                                                                                           "KAW" = "KAW",
                                                                                           "KHD" = "KHD",
                                                                                           "KIX" = "KIX",
                                                                                           "KOE" = "KOE",
                                                                                           "KWK" = "KWK",
                                                                                           "KX" = "KX",
                                                                                           "LAE" = "LAE",
                                                                                           "LBX" = "LBX",
                                                                                           "LEV" = "LEV",
                                                                                           "LNX" = "LNX",
                                                                                           "LUX" = "LUX",
                                                                                           "MAH" = "MAH",
                                                                                           "MCR" = "MCR",
                                                                                           "MHX" = "MHX",
                                                                                           "MIN" = "MIN",
                                                                                           "MKA" = "MKA",
                                                                                           "MLX" = "MLX",
                                                                                           "MOS" = "MOS",
                                                                                           "MSD" = "MSD",
                                                                                           "MSX" = "MSX",
                                                                                           "MTB" = "MTB",
                                                                                           "MTE" = "MTE",
                                                                                           "MTK" = "MTK",
                                                                                           "MTS" = "MTS",
                                                                                           "MUR" = "MUR",
                                                                                           "NGX" = "NGX",
                                                                                           "NPA" = "NPA",
                                                                                           "NRA" = "NRA",
                                                                                           "NRB" = "NRB",
                                                                                           "NSA" = "NSA",
                                                                                           "NVA" = "NVA",
                                                                                           "OKT" = "OKT",
                                                                                           "ONG" = "ONG",
                                                                                           "OPO" = "OPO",
                                                                                           "OSN" = "OSN",
                                                                                           "OUA" = "OUA",
                                                                                           "Patumahoe" = "Patumahoe",
                                                                                           "PAX" = "PAX",
                                                                                           "PEX" = "PEX",
                                                                                           "PKA" = "PKA",
                                                                                           "PTU" = "PTU",
                                                                                           "RAI" = "RAI",
                                                                                           "RHU" = "RHU",
                                                                                           "RLY" = "RLY",
                                                                                           "RNP" = "RNP",
                                                                                           "ROA" = "ROA",
                                                                                           "ROT" = "ROT",
                                                                                           "RUX" = "RUX",
                                                                                           "SDN" = "SDN",
                                                                                           "SLP" = "SLP",
                                                                                           "TAH" = "TAH",
                                                                                           "TEK" = "TEK",
                                                                                           "TEP" = "TEP",
                                                                                           "TGA" = "TGA",
                                                                                           "THA" = "THA",
                                                                                           "THE" = "THE",
                                                                                           "TPE" = "TPE",
                                                                                           "TPN" = "TPN",
                                                                                           "TRQ" = "TRQ",
                                                                                           "TRX" = "TRX",
                                                                                           "TUA" = "TUA",
                                                                                           "TUT" = "TUT",
                                                                                           "WAH" = "WAH",
                                                                                           "Waharau Raws" = "Waharau Raws",
                                                                                           "Waitomo Raws" = "Waitomo Raws",
                                                                                           "WAV" = "WAV",
                                                                                           "WBA" = "WBA",
                                                                                           "WBD" = "WBD",
                                                                                           "WDH" = "WDH",
                                                                                           "WFA" = "WFA",
                                                                                           "WGF" = "WGF",
                                                                                           "WGM" = "WGM",
                                                                                           "WGO" = "WGO",
                                                                                           "WHB" = "WHB",
                                                                                           "WHG" = "WHG",
                                                                                           "WHR" = "WHR",
                                                                                           "WKA" = "WKA",
                                                                                           "WKB" = "WKB",
                                                                                           "WNA" = "WNA",
                                                                                           "WND" = "WND",
                                                                                           "WPK" = "WPK",
                                                                                           "WRA" = "WRA",
                                                                                           "WRY" = "WRY",
                                                                                           "WSA" = "WSA",
                                                                                           "WTA" = "WTA",
                                                                                           "WUA" = "WUA"), selected = "APA"),
              actionButton("goButton", "Submit"),
            
              width = 3)
              ),
     
     mainPanel(
       
     
       navbarPage("",
      tabPanel("Overview of Dataset",
               #h3("Dataset"),
               tabsetPanel(
                 
                
                navbarMenu("Summary",
                              
                 
                 tabPanel("Summary1",
                          withSpinner(
                            verbatimTextOutput(outputId = "SummaryA1"), type = 5, color = "#4eaff2", size = 1)
                 ),
                 tabPanel("Summary2",
                          withSpinner(
                          verbatimTextOutput(outputId = "SummaryA2"),type = 5, color = "#4eaff2", size = 1)
                 )),
                 tabPanel("Raw Data",
                          withSpinner(
                          DT::dataTableOutput(outputId = "Assign1"), type = 5, color = "#4eaff2", size = 1)
                 )
                 )
               ),
    
      tabPanel("Visualisation",
               #h3("Plots"),
               
               tabsetPanel(
                 
                 tabPanel("Timeseries Plots", 
                          br(),
                          
                          selectInput(inputId = "year_to_plot", label ="From:", choices = c("1970","1971","1972","1973", "1974","1975","1993","1994","1995"), multiple = FALSE, selected = "1973"),
                          selectInput(inputId = "year_to_plot1", label ="To:", choices = c("1970","1971","1972","1973", "1974","1975","1993","1994","1995"), multiple = FALSE, selected = "1974"),
                        tabsetPanel(
                            tabPanel("DSR Plot",
                                     br(),
                                     
                                     withSpinner(
                                       
                                       plotOutput(outputId = "dsrplot"), type = 5, color = "#f0d90a", size = 1
                                     )
                                     
                            ),
                            tabPanel("DC Plot",
                                     br(),
                                     # selectInput(inputId = "year_to_plot", label ="From:", choices = c("1970","1971","1972","1973", "1974","1975"), multiple = FALSE, selected = "1973"),
                                     # selectInput(inputId = "year_to_plot1", label ="To:", choices = c("1970","1971","1972","1973", "1974","1975"), multiple = FALSE, selected = "1974"),
                                     withSpinner(
                                       
                                       plotOutput(outputId = "dcplot"), type = 5, color = "#f0d90a", size = 1
                                     )
                                     
                            ),
                            tabPanel("BUI Plot",
                                     br(),
                                     # selectInput(inputId = "year_to_plot", label ="From:", choices = c("1970","1971","1972","1973", "1974","1975"), multiple = FALSE, selected = "1973"),
                                     # selectInput(inputId = "year_to_plot1", label ="To:", choices = c("1970","1971","1972","1973", "1974","1975"), multiple = FALSE, selected = "1974"),
                                     withSpinner(
                                       
                                       plotOutput(outputId = "buiplot"), type = 5, color = "#f0d90a", size = 1
                                     )
                                     
                            )
      
                         
                 )
                 ),
                 
               tabPanel("Boxplot",
                        br(),
                        
                        tabsetPanel(
                          navbarMenu("Outliers",
                          tabPanel("All Variables",
                                   br(),
                                    withSpinner(
                                    
                                    plotOutput(outputId = "Boxplot"), type = 5, color = "#f0d90a", size = 1
                                    ),
                          
                                    checkboxInput(inputId = "standardise", label = "Show standardized", value = TRUE),
                                    checkboxInput(inputId = "outliers", label = "Show outliers", value = TRUE),
                                    sliderInput(inputId = "range", label = "IQR Multiplier", min = 0, max = 5, step = 0.1, value = 1.5),
                          ),
                       
                        
               
                          tabPanel("One Variable",
                                   br(),
                                   
                                   selectInput(inputId = "VariablesB", label = "Choose Variable:", choices =  c("DC","BUI","DSR","Temp","RH","WS","Rain","FFMC","DMC","ISI","FWI","FFI"), selected = "DC"),
                                   br(),
                                   withSpinner(
                                     plotOutput(outputId = "Boxplot2"), type = 5, color = "#f0d90a", size = 1
                                   ),
                                   
                                   
                                   checkboxInput(inputId = "standardise", label = "Show standardized", value = FALSE),
                                   checkboxInput(inputId = "outliers", label = "Show outliers", value = TRUE),
                                   sliderInput(inputId = "range5", label = "IQR Multiplier", min = 0, max = 5, step = 0.1, value = 1.5),
                          )),
                          
                          tabPanel("HoverOver :: Information",
                                   br(),
                                   withSpinner(plotlyOutput(outputId = "Boxplot1"), type = 5, color = "#0dc5c1", size = 1),
                                   
                          )
                      
                          
                        
                        )
               ),
               
               tabPanel("Corrgram",
                        br(),
                        withSpinner(
                        plotOutput(outputId = "Corrgram"), type = 5, color = "#f0d90a", size = 1
                        ),
                        checkboxInput(inputId = "abs", label = "Uses absolute correlation", value = TRUE),
                        selectInput(inputId = "CorrMeth", label = "Correlation method", choices = c("pearson","spearman","kendall"), selected = "pearson"),
                        selectInput(inputId = "Group", label = "Grouping method", choices = list("none"=FALSE,"OLO"="OLO","GW"="GW","HC"="HC"), selected = "OLO"),
                        hr()
                        ),
               
               tabPanel("Missing Data",
                        br(),
                        
                        tabsetPanel(
                          navbarMenu("Missing Value Plot",
                          tabPanel("All Variables",
                           br(),
                          withSpinner(
                          plotOutput(outputId = "Missing"), type = 5, color = "#f0d90a", size = 1
                        ),
                        checkboxInput(inputId = "cluster", label = "Cluster missingness", value = FALSE),
                        hr()
                        ),
                        
                        tabPanel("One Variable",
                                 br(),
                                 
                                 selectInput('selecter', "Choose:", choices = 
                                               list("BUI" = "BUI",
                                                    "DC" = "DC",
                                                    "DSR" = "DSR",
                                                    "Rainfall" = "Rain",
                                                    "Temperature" = "Temp",
                                                    "Relative Humidity" = "RH",
                                                    "Wind Speed" = "WS")),
                                 withSpinner(
                                   plotOutput(outputId = "Missing1"), type = 5, color = "#f0d90a", size = 1
                                 ),
                                 
                                 checkboxInput(inputId = "cluster", label = "Cluster missingness", value = FALSE),
                                 hr()
                        )),
                        
                        
                        tabPanel("Datatype",
                                 withSpinner(
                                   plotOutput(outputId = "Missing2"), type = 5, color = "#f0d90a", size = 1
                                 ),
                        )
                       
                        )
               )
                      
       
               # tabPanel("Rising Value Chart",
               #          withSpinner(
               #          plotOutput(outputId = "Rising", height = 600), type = 5, color = "#f0d90a", size = 1
               #          
               #          )
               #          )
              
               )
             )
)
)
)
))
