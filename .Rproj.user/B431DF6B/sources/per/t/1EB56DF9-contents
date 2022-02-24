library(readxl)
library(tidyverse)

dir.create("datos")

download.file("https://www.portaltransparencia.cl/PortalPdT/documents/10179/62801/12.5+Distribuci%C3%B3n+de+Egresos+por+Especialidad+y+Hospital+-+Acumulado+a+Diciembre+2019-2020-2021.xlsx/eeb789f8-a99b-4c97-a3bd-2384691591fe", destfile = "datos/GRD_Nacional.xlsx", mode = "wb")


GRD_Nacional <- janitor::clean_names(read_excel("datos/GRD_Nacional.xlsx", na = " ", skip = 6) %>% 
  fill(Especialidad)) %>% filter(hospital_codigo!= is.na(hospital_codigo))
GRD_Nacional <- mutate_all(GRD_Nacional, ~replace(., is.na(.), 0))

GRD_2019 <- GRD_Nacional %>% select(especialidad_descripcion, hospital_descripcion, x2019_5, x2019_11, x2019_14, x2019_17) %>% 
 mutate("Año"=2019, "Especialidad"=especialidad_descripcion, "Hospital"=hospital_descripcion,
        "Egresos"=x2019_5, "Peso_Medio"=x2019_11, "Estancia_Media"=x2019_14, "Edad_Media"=x2019_17)
GRD_2019 <- GRD_2019[,7:13]

GRD_2020 <- GRD_Nacional %>% select(especialidad_descripcion, hospital_descripcion, x2020_6, x2020_12, x2020_15, x2020_18) %>% 
  mutate("Año"=2020, "Especialidad"=especialidad_descripcion, "Hospital"=hospital_descripcion,
         "Egresos"=x2020_6, "Peso_Medio"=x2020_12, "Estancia_Media"=x2020_15, "Edad_Media"=x2020_18)
GRD_2020 <- GRD_2020[,7:13]

GRD_2021 <- GRD_Nacional %>% select(especialidad_descripcion, hospital_descripcion, x2021_7, x2021_13, x2021_16, x2021_19) %>% 
  mutate("Año"=2021, "Especialidad"=especialidad_descripcion, "Hospital"=hospital_descripcion,
         "Egresos"=x2021_7, "Peso_Medio"=x2021_13, "Estancia_Media"=x2021_16, "Edad_Media"=x2021_19)
GRD_2021 <- GRD_2021[,7:13]

GRD_Nacional <-rbind(GRD_2021, GRD_2020, GRD_2019)
rm(GRD_2021, GRD_2020, GRD_2019)

openxlsx::write.xlsx(GRD_Nacional, "datos/GRD_Nacional_Tableau.xlsx", 
                     colNames = TRUE, sheetName = "GRD", overwrite = T)
