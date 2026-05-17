source("rdocs/source/packages.R")

# ---------------------------------------------------------------------------- #

#        ______   _____  ________      ________ 
#      |  ____| / ____| |__   __| /\  |__   __|
#     | |__    | (___     | |   /  \    | |   
#    |  __|    \___ \    | |  / /\ \   | |   
#   | |____   ____) |   | |  /____ \  | |   
#  |______   |_____/   |_| /_/    \_\|_|   
#  
#         Consultoria estatística 
#

# ---------------------------------------------------------------------------- #
# ############################## README ###################################### #
# Consultor, favor utilizar este arquivo .R para realizar as análises
# alocadas a você neste projeto pelo gerente responsável, salvo instrução 
# explícita do gerente para mudança.
#
# Escreva seu código da forma mais clara e legível possível, eliminando códigos
# de teste depreciados, ou ao menos deixando como comentário. Dê preferência
# as funções dos pacotes contidos no Tidyverse para realizar suas análises.
# ---------------------------------------------------------------------------- #
install.packages("rlang")
Session -> Restart R
library(tidyverse)
install.packages("readxl")
library(readxl) 
install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
library(ggplot2)
read.csv("pixel110011.xlsx")

infos_jogadores <- read_excel("pixel110011.xlsx", sheet = "infos_jogadores") # dentro desse usar a idade 
infos_jogadores_jogos <- read_excel("pixel110011.xlsx", sheet = "infos_jogadores_jogos") # dentro desse usar onde_jogam

idade_ondejogam <-(infos_jogadores$idade)$(infos_jogadores_jogo$onde_jogam)

# Fazer o gráfico -> ggplot
ggplot(idade_ondejogam) +
  aes(x=factor("idade"), y= onde_jogam) +
  geom_boxplot(fill=c("#A11D21"), width = 0.5) +
  guides(fill=FALSE) +
  stat_summary(fun="mean", geom="point", shape=23, size=3, fill="white") +
  labs(x="Idade dos jogadores (Anos)", y="Onde os jogadores estam jogando") +
  theme_estat()


ggplot(idade_ondejogam) +
  aes(x = reorder(onde_jogam, idade, FUN = median), y = idade) +
  geom_boxplot(fill = c("#A11D21"), width = 0.5) +
  stat_summary(fun = "mean", geom = "point", shape = 23, size = 3, fill = "white") +
  labs(x = "Aparelho eletrônico usado pelos jogadores", y = "Idade dos jogadores (Anos)") +
  theme_estat()
ggsave("box_bi.pdf", width = 158, height = 93, units = "mm")





         