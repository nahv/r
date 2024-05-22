import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.ticker import FormatStrFormatter

TDS_CO = pd.read_csv("Graf_TSD_CO.csv", delimiter=';')
TDS_ER = pd.read_csv("Graf_TSD_ER.csv", delimiter=';')
TDS_P = pd.read_csv("Graf_TSD_pichones_CO.csv", delimiter=';')

#CORRIENTES
# Variables para graficar
x = TDS_CO['NestAge']
y_control = TDS_CO['Control_Co']
y_protegidos = TDS_CO['Protegidos_co']
lower_control = TDS_CO['lower_cont']
upper_control = TDS_CO['upper_cont']
lower_proteccion = TDS_CO['lower_proteccion']
upper_proteccion = TDS_CO['upper_proteccion']

# Crea el canvas
plt.figure(figsize=(10, 6))

# Plot línea protegidos
plt.plot(x, y_protegidos, label='Nidos protegidos', color='#A02E1A')
# Plot línea no protegidos
plt.plot(x, y_control, label='Nidos no protegidos', color='#2D56E8')

# Intervalos de confianza
plt.fill_between(x, lower_control, upper_control, color='#ADBBEE', alpha=.3)
plt.fill_between(x, lower_proteccion, upper_proteccion, color='#F9B3A8', alpha=.3)

# Leyendas, formateos y ploteo
plt.legend(loc='lower left', fontsize = 12, frameon=False)
plt.gca().yaxis.set_major_formatter(FormatStrFormatter('%.2f'))
plt.xlabel('Edad del nido', size = 14)
plt.ylabel('Tasa de supervivencia diaria', size = 14)
TDS_CO.head()
plt.show()

#ENTRE RÍOS
# Variables para graficar
x = TDS_CO['NestAge']
y_control = TDS_ER['Control']
y_protegidos = TDS_ER['Protegidos']
lower_control = TDS_ER['lower_control']
upper_control = TDS_ER['upper_control']
lower_proteccion = TDS_ER['lower_proteccion']
upper_proteccion = TDS_ER['upper_proteccion']

# Crea el canvas
plt.figure(figsize=(10, 6))

# Línea protegidos
plt.plot(x, y_protegidos, label='Nidos protegidos', color='#A02E1A')
# Línea no protegidos
plt.plot(x, y_control, label='Nidos no protegidos', color='#2D56E8')

# Intervalos de confianza
plt.fill_between(x, lower_control, upper_control, color='#ADBBEE', alpha=.3)
plt.fill_between(x, lower_proteccion, upper_proteccion, color='#F9B3A8', alpha=.3)

# Leyendas, formateos y ploteo
plt.legend(loc='lower left', fontsize = 12, frameon=False)
plt.gca().yaxis.set_major_formatter(FormatStrFormatter('%.2f'))
plt.xlabel('Edad del nido', size = 14)
plt.ylabel('Tasa de supervivencia diaria', size = 14)
plt.show()

#PICHONES
# Variables para graficar
x = TDS_P['Time']
y_control = TDS_P['Control']
y_protegidos = TDS_P['Protegidos']
lower_control = TDS_P['L_control']
upper_control = TDS_P['U_control']
lower_proteccion = TDS_P['L_protegido']
upper_proteccion = TDS_P['U_protegido']

# Crea el canvas
plt.figure(figsize=(10, 6))

# Línea protegidos
plt.plot(x, y_protegidos, label='Nidos protegidos', color='#A02E1A')
# Línea no protegidos
plt.plot(x, y_control, label='Nidos no protegidos', color='#2D56E8')

# Intervalos de confianza
plt.fill_between(x, lower_control, upper_control, color='#ADBBEE', alpha=.3)
plt.fill_between(x, lower_proteccion, upper_proteccion, color='#F9B3A8', alpha=.3)

# Leyendas, formateos y ploteo
plt.legend(loc='lower left', fontsize = 12, frameon=False)
plt.gca().yaxis.set_major_formatter(FormatStrFormatter('%.2f'))
plt.xlabel('Avance de la temporada (días)', size = 14)
plt.ylabel('Tasa de supervivencia diaria', size = 14)
plt.ylim(0)
plt.show()