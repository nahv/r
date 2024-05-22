library(ggplot2)
library(tidyr)
library(dplyr)

data <- data.frame(
  provincia = c("Entre Ríos", "Entre Ríos", "Corrientes", "Corrientes"),
  TSD = c(0.894274, 0.9289504, 0.9325329, 0.9537241),
  EE = c(0.0114651, 0.0106298, 0.0168873, 0.0051224),
  Categoria = c("Parasitado", "No parasitado", "Parasitado", "No parasitado")
)

print(data)

ggplot(data, aes(x = provincia, y = TSD, fill = Categoria)) +
  geom_bar(stat = "identity", 
           position = position_dodge(width = 0.4), 
           width = 0.4,
           colour = "black") + 
  geom_errorbar(aes(ymin = pmax(TSD - EE, 0.5), ymax = TSD + EE), 
                position = position_dodge(width = 0.4), width = 0.15, colour = "black") +
  labs(x = "Provincia", y = "Tasa de supervivencia diaria", title = "") +
  theme_classic() +
  scale_fill_manual(name=NULL,
                    values = c("Parasitado" = "#5f5f5b", 
                            "No parasitado" = "lightgrey")) +
  scale_y_continuous(expand = c(0, 0), 
                     limits = c(0.8, 1),  
                     na.value = .1)+
  theme(axis.text.x = element_text(color = "black"),
        axis.text.y = element_text(color = "black"))

