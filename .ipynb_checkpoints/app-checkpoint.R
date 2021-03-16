library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)
library(dashBootstrapComponents)
library(ggplot2)
library(dplyr)
library(plotly)

hr1 <- read.csv("data/processed/hr1.csv")
hr2 <- read.csv("data/processed/hr2.csv")
hr3 <- read.csv("data/processed/hr3.csv")
hr4 <- read.csv("data/processed/hr4.csv")

app = Dash$new()

hr2.arrange <- hr2$company_size %>%
    unique %>%
    purrr::map(function(col) list(label = col, value = col))
hr2.arrange <- hr2.arrange[c(1,3,7,2,8,9,6,5,4)]

app$layout(
  dbcContainer(
    list(
      htmlBr(),
      dccTabs(
        list(
          dccTab(
            label='HR perspective', 
            value='tab-1',
            list(
              htmlBr(),
              htmlBr(),
              dbcRow(
                list(
                  htmlH1("HR Analytics on Training")
                ), 
                style = list('textAlign' = 'center')
              ),
              htmlBr(),
              htmlBr(),
              dbcRow(
                list(
                  dbcCol(
                    list(
                      htmlLabel(
                        list(
                          'Please select education level:',
                          htmlBr(),
                          dccDropdown(
                            options = hr1$education_level %>%
                              unique %>%
                              purrr::map(function(col) list(label = col, value = col)),
                            value="Bachelor", 
                            placeholder = "Please enter", 
                            clearable = FALSE, 
                            searchable = FALSE,
                            id = "dropdown1"
                          )
                        )
                      ),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlLabel(
                        list(
                          'Please select education level:',
                          htmlBr(),
                          dccDropdown(
                            options = hr1$education_level %>%
                              unique %>%
                              purrr::map(function(col) list(label = col, value = col)),
                            value="Masters", 
                            placeholder = "Please enter", 
                            clearable = FALSE, 
                            searchable = FALSE,
                            id = "dropdown2"
                          ),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr()
                        )
                      )
                    )
                  ),
                  dbcCol(
                    list(
                      dccGraph(id='plot1')
                    )
                  )
                ), 
                style = list('columnCount' = 2)
              ),
              dbcRow(
                list(
                  dbcCol(
                    list(
                      htmlLabel(
                        list(
                          'Please select previous company size:',
                          htmlBr(),
                          htmlBr(),
                          dccRadioItems(
                            options = hr2.arrange,
                            value = "no experience",
                            labelStyle = list("display" = "block"),
                            id = "radio1"
                          ),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr()
                        )
                      )
                    )
                  ),
                  dbcCol(
                    list(
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      dccGraph(id='plot2')
                    )
                  )
                ), 
                style = list('columnCount' = 2)
              )
            )
          ),
          dccTab(
            label='Advertising perspective', 
            value='tab-2',
            list(
              htmlBr(),
              dbcRow(
                list(
                  htmlH1("Advertising Analytics on Job Change")
                ), 
                style = list('textAlign' = 'center')
              ),
              htmlBr(),
              htmlBr(),
              dbcRow(
                list(
                  dbcCol(
                    list(
                      htmlLabel(
                        list(
                          'Please select range of City Development Index (Left:Low Right:High):',
                          htmlBr(),
                          htmlBr(),
                          dbcCard(
                            color = "#ffd699",
                            list(
                              htmlBr(),
                              dccRangeSlider(
                                min = min(hr3$city_development_index),
                                max = max(hr3$city_development_index)+0.01,
                                step = 0.05,
                                value = list(
                                  min(hr3$city_development_index), 
                                  min(hr3$city_development_index)+0.25
                                  ),
                                id = "rangeslider1"
                              )
                            )
                          ),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr(),
                          htmlBr()
                        )
                      )
                    )
                  ),
                  dbcCol(
                    list(
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      dccGraph(id='plot3')
                    )
                  )
                ), 
                style = list('columnCount' = 2)
              ),
              dbcRow(
                list(
                  dbcCol(
                    list(
                      htmlLabel(
                        list(
                          "Please select experience level:",
                          htmlBr(),
                          htmlBr(),
                          dccDropdown(
                            options = hr4$experience_level %>%
                              unique %>%
                              purrr::map(function(col) list(label = col, value = col)),
                            value="Experienced (>=15)", 
                            placeholder = "Please enter", 
                            clearable = FALSE, 
                            searchable = FALSE,
                            id = "dropdown3"
                          )
                        )
                      ),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr()
                    )
                  ),
                  dbcCol(
                    list(
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      htmlBr(),
                      dccGraph(id='plot4')
                    )
                  )
                ), 
                style = list('columnCount' = 2)
              )
            )
          )
        )
      )
    )
  )
)

app$callback(
  output('plot1', 'figure'),
  list(input('dropdown1', 'value'),
       input('dropdown2', 'value')),
  function(edu, edu2) {
    p <- ggplot(hr1[(hr1$education_level == edu) | (hr1$education_level == edu2),2:5]) + 
      aes(x = train_level, fill = education_level) + 
      geom_bar() + 
      labs(x = 'Train Level', y = 'Total Count', fill = 'Edu Level') + 
      theme_classic() 
    ggplotly(p)
  }
)

app$callback(
  output('plot2', 'figure'),
  list(input('radio1', 'value')),
  function(size) {
    p <- ggplot(hr2[hr2$company_size == size, 1:4]) + 
      aes(x = training_hours, color = company_size, fill = company_size) + 
      geom_density(alpha = 0.5) + 
      labs(x = 'Training Hours', y = 'Hours Density', fill = 'Company Size') + 
      theme_classic()
    ggplotly(p)
  }
)

app$callback(
  output('plot3', 'figure'),
  list(input('rangeslider1', 'value')),
  function(range_val) {
    p <- ggplot(
      hr3[(hr3$city_development_index > range_val[1]) & (hr3$city_development_index < range_val[2]), 1:4] %>% 
        group_by(city_development_index, last_new_job) %>% 
        summarize(m = mean(target))) +
      aes(y = as.factor(city_development_index), x = m, fill = last_new_job) + 
      geom_bar(stat = "identity") + 
      labs(x = "Change Percentage", y = "City Development Index", fill = "Last Job") + 
      theme_classic()
    ggplotly(p)
  }
)

app$callback(
  output('plot4', 'figure'),
  list(input('dropdown3', 'value')),
  function(level) {
    p <- ggplot(hr4[hr4$experience_level == level,1:6] %>%
                  group_by(education_level, major_discipline) %>% 
                  summarize(m = mean(target))) + 
      aes(x = education_level, y = major_discipline, size = m, color = m) + 
      labs(x = "Educaiton Level", y = "Major Discipline", color = "Change Job Ratio") + 
      geom_point() + 
      theme_classic()
    ggplotly(p)
  }
)

app$run_server(host = '0.0.0.0')
