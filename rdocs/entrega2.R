
source("rdocs/source/packages.R")
readxl::read_excel(
  +     "C:\\Users\\Alex Sovat\\Documents\\PS - ESTAT\\Projeto-Fantasma-2026.1\\pixel110011.xlsx" )
library(tidyverse)
library(lubridate)
library(dplyr)

# 2. A receita do jogo “Minecraft” ao longo dos meses de 2025 
# A cliente gostaria de entender como está sendo a receita total, em dólares, do jogo 
# “Minecraft” ao longo dos meses de 2025, de janeiro a dezembro, a fim de 
# compreender se houve aumento ou diminuição na receita produzida ao longo do 
# tempo. Considere a cotação do dólar a 5,19 reais. 
# Prazo: 17/05 

getwd()

library(tidyverse)
library(lubridate)

library(readxl)
compras <- read_excel("~/PS - ESTAT/pixel110011.xlsx", sheet = "info_compras")
jogos <- read_excel("~/PS - ESTAT/pixel110011.xlsx", sheet = "info_jogos")
analise_mine <- compras %>%
  left_join(jogos, by = c("gam5_id" = "ga8e_id")) %>%
  filter(jogo == "Minecraft", year(as.Date(data_compra)) == 2025) %>%
  mutate(receita_usd = (quantidade * `preco_unitario_R$`) / 5.19) %>%
  group_by(mes = month(as.Date(data_compra), label = TRUE, abbr = FALSE)) %>%
  summarise(total_receita_usd = sum(receita_usd, na.rm = TRUE))

print(analise_minecraft)

library(ggplot2)
grafico_receita <- ggplot(analise_mine) + 
  aes(x = mes , y = total_receita_usd, group = 1) +
  geom_line(size = 1, colour = "#a11d21") + geom_point(colour = "#a11d21",
                                                       size = 2) +
  labs(x = "Mêses de 2025" , y = "Receita Total") +
  theme_estat() 

print(grafico_receita)

analise_minecraft %>% 
  print_quadro_resumo(var_name = total_receita_usd)




