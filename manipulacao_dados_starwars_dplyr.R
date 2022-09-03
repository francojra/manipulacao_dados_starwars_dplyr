
# Manipulação da Base Star Wars com Dplyr --------------------------------------------
# Autora do script: Jeanne Franco ----------------------------------------------------
# Data: 02/09/22 ---------------------------------------------------------------------

# Carregar pacotes -------------------------------------------------------------------------------------------------------------------------

library(dplyr)

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

## select

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
