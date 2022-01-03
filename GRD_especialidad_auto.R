library(readxl)
library(tidyverse)
library(dplyr)

#Cambian mes a mes
Mes <- "noviembre"
Rango <- "NOVIEMBRE 2021!A9:AH30"

BBDD_GRD_ESP_M <- "BBDD Produccion/GRD/Egresos por especialidad 2019-2020-2021.xlsx"
BBDD_GRD_ESP <- "BBDD Produccion/GRD/GRD Especialidad BBDD.xlsx"

GRD_Especialidad <- read_xlsx(BBDD_GRD_ESP_M, na = " ", col_names = FALSE, range = Rango)

GRD_Especialidad$'Año' <- 2021
GRD_Especialidad$Mes <- Mes

colnames(GRD_Especialidad)[1] <- "Especialidad"
colnames(GRD_Especialidad)[4] <- "Egresos"
colnames(GRD_Especialidad)[10] <- "Peso Medio"
colnames(GRD_Especialidad)[13] <- "Estancia Media"
colnames(GRD_Especialidad)[16] <- "Estancias"
colnames(GRD_Especialidad)[19] <- "Edad Media"
colnames(GRD_Especialidad)[21] <- "Unidades de producción hospitalaria" 
colnames(GRD_Especialidad)[25] <- "Fallecidos" 
colnames(GRD_Especialidad)[31] <- "Outliers superiores"

GRD_Especialidad <- GRD_Especialidad %>% 
  select('Año',Mes, Especialidad, Egresos, `Peso Medio`, `Estancia Media`,
         `Unidades de producción hospitalaria`, Fallecidos, `Outliers superiores`)

GRD_Especialidad_BBDD <- read_xlsx(BBDD_GRD_ESP, na = " ", col_names = TRUE)

GRD_Especialidad <- rbind(GRD_Especialidad,GRD_Especialidad_BBDD)

openxlsx::write.xlsx(GRD_Especialidad, BBDD_GRD_ESP, colNames = TRUE, sheetName = "Especialidad", overwrite = T)

