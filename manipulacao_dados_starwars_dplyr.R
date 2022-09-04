
# Manipulação da Base Star Wars com Dplyr --------------------------------------------
# Autora do script: Jeanne Franco ----------------------------------------------------
# Data: 02/09/22 ---------------------------------------------------------------------
# Referência: https://www.youtube.com/watch?v=qKGdU5yAK8s ----------------------------

# Carregar pacotes -------------------------------------------------------------------------------------------------------------------------

library(dplyr)
library(tibble)

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

dplyr::starwars
wars <- starwars
View(wars)

# Manipular dados --------------------------------------------------------------------------------------------------------------------------

### Principais funções do dplyr

# 1. select (ends_with; starts_with; contains; matches; where)
# 2. filter (==; =!; |; &; xor(); %in%; >; <; >=; <=; any; all; slice_max; slice_min; between; near)
# 3. rename
# 4. mutate
# 5. arrange (desc)
# 6. group_by
# 7. summarise

# Função select ----------------------------------------------------------------------------------------------------------------------------

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

# Função filter ----------------------------------------------------------------------------------------------------------------------------

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

# Função rename ----------------------------------------------------------------------------------------------------------------------------

starwars %>%
  select(height, name) %>%
  rename(nomes = name, altura =  height) %>%
  View()

starwars %>%
  select(mass, name) %>%
  rename_with(tolower) %>%
  View()

starwars %>%
  select(mass, name) %>%
  rename_with(toupper) %>%
  View()

starwars %>%
  rename_with( ~ gsub("_", ".", .x)) %>%
  View()

# Função mutate ----------------------------------------------------------------------------------------------------------------------------

starwars %>%
  select(name, height, mass) %>%
  mutate(height = height/100, IMC = mass/(height)^2) %>%
  View()

starwars %>%
  select(name, height, mass) %>%
  mutate(height_cumulative = cumsum(height)) %>%
  View()

### Criando uma função para aplicar no mutate

multiplica_2 <- function(x) (x*2)

starwars %>%
  select(name, height, mass) %>%
  mutate_if(is.double, multiplica_2) %>%
  View()

# Função arrange ---------------------------------------------------------------------------------------------------------------------------

starwars %>%
  select(birth_year, height, mass) %>%
  arrange(height) %>%
  view()

starwars %>%
  select(birth_year, height, mass) %>%
  arrange(mass) %>%
  view()

starwars %>%
  select(birth_year, height, mass) %>%
  arrange(desc(birth_year)) %>%
  view()

starwars %>%
  select(birth_year, height, mass) %>%
  arrange(desc(birth_year), mass, height) %>%
  view()

# Função summarise -------------------------------------------------------------------------------------------------------------------------

### Média central: mean(), median()
### Variação: sd(), IQR(), mad()
### Amplitude: min(), max(), quantile()
### Posição: first(), last(), nth()
### Frequência: n(), n_distinct()
### Lógicas: any(), all()

starwars %>%
  select(height, mass, hair_color, eye_color, homeworld) %>%
  group_by(homeworld) %>%
  summarise(media_alt = mean(height),
            media_mass = mean(mass, na.rm = T)) %>%  # na.rm = na remove
  view()

starwars %>%
  select(height, mass, hair_color, eye_color, homeworld) %>%
  na.remove() %>%
  group_by(hair_color) %>%
  summarise(sd_alt = sd(height),
            sd_mass = sd(mass)) %>%  
  view()





