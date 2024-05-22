library(ggplot2)

# Data
data <- data.frame(
  YEAR = c(2015, 2017, 2018, 2019, 2021, 2022),
  TSD = c(0.9428571, 0.9692256, 0.9720621, 0.9555439, 0.8714378, 0.9605573),
  EE = c(0.0392347, 0.0095891, 0.0087174, 0.0108733, 0.023553, 0.0136733)
)

# Plot
ggplot(data, aes(x = as.factor(YEAR), y = TSD)) +
  geom_bar(stat = "identity", 
           fill = "grey", 
           position = "identity",
           width = .8,
           colour = "black") +
  geom_errorbar(aes(ymin = TSD - EE, ymax = TSD + EE), width = 0.2, position = position_dodge(0.9)) +
  labs(title = "",
       x = "Año",
       y = "Tasa de supervivencia diaria") +
  theme_classic() +
  scale_x_discrete(expand = c(0, 0))+
  theme(axis.text.x = element_text(color = "black"),
        axis.text.y = element_text(color = "black"),
        axis.title.x = element_text(size = 14),
        axis.title.y = element_text(size = 14)) +
  scale_y_continuous(expand = c(0, 0), 
                     limits = c(0.8, 1),  
                     na.value = .1)

