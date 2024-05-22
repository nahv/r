library(ggplot2)
library(readr)

df <- read_csv("superficies_cobertura_grafico.csv")
df$superficie <- as.numeric(gsub(",", ".", df$superficie))

# Colores
colors <- c(
  "Bañado" = "#dda15e",
  "Pastizal\nbajo" = "#bc6c25",
  "Pastizal\nalto" = "#dee38d",
  "Suelo\nexpuesto" = "#e78aab",
  "Monte\nnativo" = "#5a6634",
  "Forestación" = "#283618",
  "Agua" = "#3ca7e8"
)

# Orden
custom_order <- c("Bañado", "Pastizal bajo", "Pastizal alto", "Monte nativo", "Suelo expuesto", "Forestación", "Agua")
df$cobertura <- factor(df$cobertura, levels = custom_order)
df$cobertura <- factor(df$cobertura, levels = custom_order,
                       labels = c("Bañado", "Pastizal\nbajo", "Pastizal\nalto", "Monte\nnativo", "Suelo\nexpuesto", "Forestación", "Agua"))
# Boxplot
plot <- ggplot(df, aes(x = cobertura, y = superficie, fill = cobertura)) +
  geom_boxplot() +
  scale_fill_manual(values = colors) +
  labs(x = "Cobertura", y = "Superficie (ha)", title = "") +
  theme_minimal() +
  theme(
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.line = element_line(color = "black"),
    text = element_text(family = "Times New Roman", color = "black", size = 16),
    # Acá jugale con los tamaños 
    # 'axis.text.x' son las coberturas y 'axis.title.y' es el título de "y", "Superficie ha"
    axis.text.x = element_text(family = "Times New Roman", color = "black", size = 15, margin = margin(0, 0, 10, 0)),
    axis.title.y = element_text(family = "Times New Roman", color = "black", size = 15, margin = margin(0, 10, 0, 0)),
    legend.position = "none"  
  )

# Guardar archivo
ggsave("boxplot.jpg", plot, width = 10, height = 6, units = "in", dpi = 300)
