library(readxl)
library(tidyverse)

BBDD_GRD_ESP <- "BBDD Produccion/GRD/GRD Especialidad BBDD.xlsx"
BBDD_GRD_ESP1 <- "BBDD Produccion/GRD/may-dic 2020.xlsx"

GRD_Especialidad <- read_xlsx(BBDD_GRD_ESP1, na = " ", col_names = FALSE, 
                              range = "ene-abr!A3:AB69") %>% 
  select(1,2,3,7,9,11,13,15,17,21,23,25)
GRD_Especialidad$Año <- 2019
GRD_Especialidad$Fallecidos <- " "

colnames(GRD_Especialidad)[1] <- "Mes"
colnames(GRD_Especialidad)[2] <- "Especialidad"
colnames(GRD_Especialidad)[3] <- "Egresos"
colnames(GRD_Especialidad)[4] <- "Peso Medio"
colnames(GRD_Especialidad)[5] <- "Edad Media"
colnames(GRD_Especialidad)[6] <- "Estancia Media"
colnames(GRD_Especialidad)[7] <- "EMAF Depurado"
colnames(GRD_Especialidad)[8] <- "Estancias" 
colnames(GRD_Especialidad)[9] <- "Unidades de producción hospitalaria" 
colnames(GRD_Especialidad)[10] <- "Exitus" 
colnames(GRD_Especialidad)[11] <- "Outliers superiores"
colnames(GRD_Especialidad)[12] <- "exceso estancias" 


GRD_Especialidad2 <- read_xlsx(BBDD_GRD_ESP1, na = " ", col_names = FALSE, 
                              range = "ene-abr!A3:AB69") %>% 
  select(1,2,4,8,10,12,14,16,18,22,24,26)
GRD_Especialidad2$Año <- 2020
GRD_Especialidad2$Fallecidos <- " "
colnames(GRD_Especialidad2)[1] <- "Mes"
colnames(GRD_Especialidad2)[2] <- "Especialidad"
colnames(GRD_Especialidad2)[3] <- "Egresos"
colnames(GRD_Especialidad2)[4] <- "Peso Medio"
colnames(GRD_Especialidad2)[5] <- "Edad Media"
colnames(GRD_Especialidad2)[6] <- "Estancia Media"
colnames(GRD_Especialidad2)[7] <- "EMAF Depurado"
colnames(GRD_Especialidad2)[8] <- "Estancias" 
colnames(GRD_Especialidad2)[9] <- "Unidades de producción hospitalaria" 
colnames(GRD_Especialidad2)[10] <- "Exitus" 
colnames(GRD_Especialidad2)[11] <- "Outliers superiores"
colnames(GRD_Especialidad2)[12] <- "exceso estancias"

GRD_Especialidad <- rbind(GRD_Especialidad,GRD_Especialidad2)

#parte 2
GRD_Especialidad2 <- read_xlsx(BBDD_GRD_ESP1, na = " ", col_names = FALSE, 
                               range = "may-dic!A3:V167") %>% 
  select(1,2,3,7,9,11,13,15,17,21)
GRD_Especialidad2$Año <- 2019
colnames(GRD_Especialidad2)[1] <- "Mes"
colnames(GRD_Especialidad2)[2] <- "Especialidad"
colnames(GRD_Especialidad2)[3] <- "Egresos"
colnames(GRD_Especialidad2)[4] <- "Peso Medio"
colnames(GRD_Especialidad2)[5] <- "Estancia Media"
colnames(GRD_Especialidad2)[6] <- "Estancias"
colnames(GRD_Especialidad2)[7] <- "Edad Media"
colnames(GRD_Especialidad2)[8] <- "Unidades de producción hospitalaria" 
colnames(GRD_Especialidad2)[9] <- "Fallecidos" 
colnames(GRD_Especialidad2)[10] <- "Outliers superiores"
colnames(GRD_Especialidad2)[11] <- "Año" 

GRD_Especialidad3 <- read_xlsx(BBDD_GRD_ESP1, na = " ", col_names = FALSE, 
                               range = "may-dic!A3:V167") %>% 
select(1,2,4,8,10,12,14,16,18,22)
GRD_Especialidad3$'Año' <- 2020
colnames(GRD_Especialidad3)[1] <- "Mes"
colnames(GRD_Especialidad3)[2] <- "Especialidad"
colnames(GRD_Especialidad3)[3] <- "Egresos"
colnames(GRD_Especialidad3)[4] <- "Peso Medio"
colnames(GRD_Especialidad3)[5] <- "Estancia Media"
colnames(GRD_Especialidad3)[6] <- "Estancias"
colnames(GRD_Especialidad3)[7] <- "Edad Media"
colnames(GRD_Especialidad3)[8] <- "Unidades de producción hospitalaria" 
colnames(GRD_Especialidad3)[9] <- "Fallecidos" 
colnames(GRD_Especialidad3)[10] <- "Outliers superiores"
colnames(GRD_Especialidad3)[11] <- "Año" 

GRD_Especialidad2 <- rbind(GRD_Especialidad2,GRD_Especialidad3)

GRD_Especialidad <- GRD_Especialidad %>% select('Año',Mes, Especialidad, Egresos, `Peso Medio`, `Estancia Media`, `Unidades de producción hospitalaria`, Fallecidos, `Outliers superiores`)
GRD_Especialidad2 <- GRD_Especialidad2 %>% select('Año',Mes, Especialidad, Egresos, `Peso Medio`, `Estancia Media`, `Unidades de producción hospitalaria`, Fallecidos, `Outliers superiores`)
GRD_Especialidad <- rbind(GRD_Especialidad,GRD_Especialidad2)

openxlsx::write.xlsx(GRD_Especialidad, BBDD_GRD_ESP, colNames = TRUE, sheetName = "Especialidad")
