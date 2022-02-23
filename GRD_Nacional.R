library(readxl)
library(tidyverse)

dir.create("datos")

download.file("https://www.portaltransparencia.cl/PortalPdT/documents/10179/62801/12.5+Distribuci%C3%B3n+de+Egresos+por+Especialidad+y+Hospital+-+Acumulado+a+Diciembre+2019-2020-2021.xlsx/eeb789f8-a99b-4c97-a3bd-2384691591fe", destfile = "datos/GRD_Nacional.xlsx", mode = "wb")


GRD_Nacional <- janitor::clean_names(read_excel("datos/GRD_Nacional.xlsx", na = " ", skip = 6) %>% 
  fill(Especialidad)) %>% filter(hospital_codigo!= is.na(hospital_codigo))
GRD_Nacional <- mutate_all(GRD_Nacional, ~replace(., is.na(.), 0))



