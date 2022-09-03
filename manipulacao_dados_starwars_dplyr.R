
# Manipulação da Base Star Wars com Dplyr --------------------------------------------
# Autora do script: Jeanne Franco ----------------------------------------------------
# Data: 02/09/22 ---------------------------------------------------------------------

# Carregar pacotes -------------------------------------------------------------------------------------------------------------------------

library(dplyr)
library(tibble)

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

dplyr::starwars
wars <- starwars
View(wars)

# Manipular dados --------------------------------------------------------------------------------------------------------------------------

## Principais funções do dplyr

# 1. select (ends_with; starts_with; contains; matches; where)
# 2. filter (==; =!; |; &; xor(); %in%; >; <; >=; <=; any; all; slice_max; slice_min; between; near)
# 3. rename
# 4. group_by
# 5. arrange (desc)
# 6. summarise

## Função select

starwars %>%
  select(ends_with("color"))

starwars %>%
  select(starts_with("h"))

starwars %>%
  select(contains("h"))

starwars %>%
  select(matches("mass"))

starwars %>%
  select(matches("year"))

starwars %>%
  select(matches("color"))

starwars %>%
  select(where(is.numeric))

## Função filter

starwars %>%
  filter(hair_color == "brown",
         sex == "male")

starwars %>%
  filter(height <= 100,
         mass >= 20)

starwars %>%
  filter(eye_color != "blue" &
         between(birth_year, 20, 100))

starwars %>%
  select(eye_color, birth_year, name) %>%
  filter(eye_color != "blue",
         near(birth_year, 20, 100))

starwars %>%
  filter(eye_color != "red" &
         xor(mass < 20, height < 150)) %>%
  View()

starwars %>%
  select(eye_color, height, name) %>%
  filter(eye_color != "red") %>%
  View()

starwars <- as.tibble(starwars)

starwars %>%
  select(eye_color, height, name) %>%
  slice_head(n = 5) %>%
  View()

starwars %>%
  select(eye_color, height, name) %>%
  slice_tail(n = 8) %>%
  View()

starwars %>%
  select(height, name) %>%
  slice_max(height, n = 3) %>%
  View()




