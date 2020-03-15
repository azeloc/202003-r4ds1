# Pacotes -----------------------------------------------------------------

library(tidyverse)

# Base de dados -----------------------------------------------------------

imdb <- read_rds("dados/imdb.rds")

# select
# group by
# filter
# mutate
# summarise
# arrange

# select ------------------------------------------------------------------

# exemplo 1

select(imdb, titulo)
imdb['titulo']

# exemplo 2

select(imdb, titulo, ano, orcamento)
imdb[c('titulo', "ano", "orcamento")]

# exemplo 3

select(imdb, starts_with("ator"))

# exemplo 4

select(imdb, -starts_with("ator"), -titulo)
select(imdb, contains("ator"))

# Exercício 1
# Crie uma tabela com apenas as colunas titulo, diretor, e orcamento. Salve em um
# objeto chamado imdb_simples.

imdb_simples <- select(imdb, titulo, diretor, orcamento)

# Exercício 2
# Remova as colunas ator_1, ator_2 e ator_3 de três formas diferentes. Salve em um
# objeto chamado imdb_sem_ator.

imdb_sem_ator_1 <- select(imdb, -ator_1, -ator_2, -ator_3)
imdb_sem_ator_2 <- select(imdb, -contains("ator"))
imdb_sem_ator_3 <- select(imdb, -starts_with("ator"))

imdb_sem_ator_4 <- imdb[,-c(13, 14, 15)]
imdb_sem_ator_5 <- imdb[,1:12]



# arrange -----------------------------------------------------------------

# exemplo 1

arrange(imdb, orcamento)

# exemplo 2

arrange(imdb, desc(orcamento))

# exemplo 3

arrange(imdb, desc(ano), titulo)

# exemplo 4
# NA

#df <- data_frame(x = c(NA, 2, 1), y = c(1, 2, 3))

df <- tibble(x = c(NA, 2, 1), y = c(1, 2, 3))
arrange(df, x)

# exercício 1
# Ordene os filmes em ordem crescente de ano e decrescente de receita e salve 
# em um objeto chamado filmes_ordenados

filmes_ordenados <- arrange(imdb, ano, desc(receita)) 

# Exercício 2 
# Selecione apenas as colunas título e orçamento 
# e então ordene de forma decrescente pelo orçamento.

passo1 <- select(imdb, titulo, orcamento)
passo2 <- arrange(aux, desc(orcamento))

arrange(select(imdb, titulo, orcamento), desc(orcamento))

# Pipe (%>%) --------------------------------------------------------------

# g(f(x)) = x %>% f() %>% g()

# Receita de bolo sem pipe. Tente entender o que é preciso fazer.

esfrie(
  asse(
    coloque(
      bata(
        acrescente(
          recipiente(
            rep(
              "farinha", 
              2
            ), 
            "água", "fermento", "leite", "óleo"
          ), 
          "farinha", até = "macio"
        ), 
        duração = "3min"
      ), 
      lugar = "forma", tipo = "grande", untada = TRUE
    ), 
    duração = "50min"
  ), 
  "geladeira", "20min"
)

# Veja como o código acima pode ser reescrito utilizando-se o pipe. 
# Agora realmente se parece com uma receita de bolo.

F(G(H(x))) de maneira equivalente a

H(x) %>% 
  G() %>% 
  F()

recipiente(rep("farinha", 2), "água", "fermento", "leite", "óleo") %>% 
  acrescente("farinha", até = "macio") %>%
  bata(duração = "3min") %>%
  coloque(lugar = "forma", tipo = "grande", untada = TRUE) %>%
  asse(duração = "50min") %>%
  esfrie("geladeira", "20min")

select(imdb, titulo, orcamento) %>% 
  arrange(desc(orcamento)) 

imdb %>% 
  select(titulo, orcamento)

# ATALHO: CTRL + SHIFT + M

# Exercício
# Refaça o exercício 2 do arrange utilizando o %>% 

imdb %>% 
  select(titulo, orcamento) %>% 
  arrange(desc(orcamento))

# filter ------------------------------------------------------------------

# exemplo 1
imdb %>% filter(nota_imdb > 9)

filter(imdb, nota_imdb > 9)

vetor_de_logicos <- imdb$nota_imdb > 9

imdb[vetor_de_logicos,]

# exemplo 2
imdb %>%
  filter(diretor == "Quentin Tarantino")

# exercício 1
# Criar uma variável chamada `filmes_baratos` com filmes com orçamento menor do 
# que 1 milhão de dólares.

filmes_baratos <- imdb %>% 
  filter(orcamento < 1000000) %>% 
  arrange(orcamento)

# exemplo 3

imdb %>% filter(ano > 2010 & nota_imdb > 8.5)
imdb %>% filter(orcamento < 100000, receita > 1000000)

imdb %>% 
  filter(receita > orcamento + 500000000 | nota_imdb > 9) %>% 
  select(receita, orcamento, nota_imdb)

imdb %>% 
  filter(receita >  500 * 10^9)

# TRUE e TRUE = TRUE
# TRUE e FALSE = TRUE
# FALSE e TRUE = TRUE
# FALSE e FALSE = FALSE

# exemplo 4
imdb %>% filter(receita > orcamento)
imdb %>% filter(receita > orcamento + 500000000)

# exemplo 5
imdb %>% filter(ano > 2010)
imdb %>% filter(!ano > 2010)

# exercício 2
# Criar um objeto chamado bons_baratos com filmes que tiveram nota no imdb 
# maior do que 8.5 e um orcamento menor do que 1 milhão de dólares.

bons_baratos <- imdb %>% 
  filter(nota_imdb > 8.5, orcamento < 10^6)

# exercício 3
# Criar um objeto chamado curtos_legais com filmes de 1h30 ou menos de duração 
# e nota no imdb maior do que 8.5.

curtos_legais <- imdb %>% 
  filter(nota_imdb > 8.5, duracao < 90)

# exercício 4
# Criar um objeto antigo_colorido com filmes anteriores a 1950 que são 
# coloridos. Crie também um objeto antigo_bw com filmes antigos que não são coloridos.

antigo_colorido <- imdb %>% 
  filter(ano < 1950, cor == "Color")

antigo_colorido <- imdb %>% 
  filter(ano < 1950, cor != "Black and White")

antigo_bw <- imdb %>% 
  filter(ano < 1950, cor == "Black and White")

antigo_bw <- imdb %>% 
  filter(ano < 1950, cor != "Color")

# exercício 5
# Criar um objeto ww com filmes do Wes Anderson ou do Woody Allen.

objeto_diretores <- imdb %>% 
  filter(diretor == "Wes Anderson" | diretor == "Woody Allen")

imdb %>% 
  filter(diretor %in% c("Wes Anderson", "Woody Allen"))

# Exercício 6
# Crie uma tabela apenas com filmes do Woody Allen e apenas as colunas titulo e ano,
# ordenada por ano.

imdb %>% 
  filter(diretor == "Woody Allen") %>% 
  select(titulo, ano) %>% 
  arrange(ano)

# exemplo 6
# %in%

pitts <- imdb %>%
  filter(ator_1 %in% c('Angelina Jolie Pitt', "Brad Pitt"))

# exercicio 6
# Refaça o exercício 5 usando o %in%.

# exemplo 7
df <- tibble(x = c(1, NA, 3))
filter(df, x > 1)
filter(df, is.na(x) | x > 1)

# exercício 7
# Identifique os filmes que não possuem informação tanto de receita quanto de orcamento
# e salve em um objeto com nome sem_info.


# exemplo 8
# str_detect

variavel_generos <- imdb$generos

str_detect(variavel_generos, "Action")

imdb %>%
  filter(str_detect(generos, "Adventure"), str_detect(generos, "Action"))

str_detect(imdb$generos, "[0-9]{3}\\.[0-9]{3}\\.[0-9]{3}-[0-9]{2}")
str_detect(imdb$generos, "(atcg){2}")


# exercício 8
# Salve em um objeto os filmes de Ação e Comédia com nota no imdb maior do que 8.


# mutate ------------------------------------------------------------------

# exemplo 1

imdb2 <- imdb %>% 
  mutate(duracao_horas = duracao/60,
         antes_de_2000 = ano < 2000,
         antes_de_2000_texto = ifelse(ano < 2000,
                                      "filme velhão", "filme d+")) %>% 
  select(titulo, diretor, contains("duracao"), ano, contains("antes_de"), everything())

mutate(imdb, duracao = duracao/60)

# exemplo 2

imdb %>% mutate(duracao = duracao/60) %>% View

# exercício 1
# Crie uma variável chamada lucro. Salve em um objeto chamado imdb_lucro.

imdb_lucro <- imdb %>% 
  mutate(lucro = receita-orcamento)

# exercicio 2
# Modifique a variável lucro para ficar na escala de milhões de dólares.

imdb_lucro_milhoes <- imdb_lucro %>% 
  mutate(lucro_milhoes = lucro/10^6)

imdb_lucro_milhoes <- imdb %>% 
  mutate(
    lucro = receita-orcamento,
    lucro_milhoes = lucro/10^6
  )

# exercício 3
# Filtre apenas os filmes com prejuízo maior do que 3 milhões de dólares. 
# Deixe essa tabela ordenada com o maior prejuízo primeiro. Salve o resultado em 
# um objeto chamado filmes_prejuizo.

#filmes_prejuizo <- 
  
imdb %>% 
  mutate(
    lucro = receita-orcamento,
    lucro_milhoes = lucro/10^6,
    prejuizo = -1*lucro,
    prejuizo = -lucro,
    prejuizo_milhoes = prejuizo/10^6
  ) %>% 
  filter(lucro_milhoes < -3) %>% 
  #filter(prejuizo > 3*10^6) %>% 
  #filter(prejuizo_milhoes > 3) %>% 
  #arrange(lucro_milhoes) %>% 
  arrange(desc(prejuizo_milhoes)) %>% 
  select(titulo, lucro_milhoes, prejuizo_milhoes)
  
# exemplo 3
# gêneros

#install.packages("gender")
library(gender)

gender(c("William"), years = 2012)
gender(c("Amanda"), years = 2012)
gender(c("Robin"), years = 2012)

gender(c("Madison", "Hillary"), years = 1930, method = "ssa")
gender(c("Madison", "Hillary"), years = 2010, method = "ssa")

gender("Matheus", years = 1920)
gender("Matheus", years = 2012)

library(tidyverse)

# Base com o gênero dos diretores
imdb_generos <- read_rds("dados/imdb_generos.rds")

imdb_generos %>% View

# imdb_generos <- imdb %>%
#   select(diretor, ano) %>%
#   mutate(
#      genero = gender(diretor, year = ano)
# )

imdb_generos %>%
  mutate(
    variavel_do_everton = ifelse(genero == "male", 1, 0)
  ) %>% 
  filter(!is.na(genero)) %>% 
  count(genero) %>% 
  mutate(
    total = sum(n),
    porcentagem = n/total
  )

# Pacote análogo para nomes brasileiros
# https://github.com/meirelesff/genderBR

# summarise ---------------------------------------------------------------

# exemplo 1

imdb %>%
  summarise(media_orcamento = mean(orcamento, na.rm = TRUE))

imdb %>% 
  filter(!is.na(orcamento)) %>% 
  summarise(media_orcamento = mean(orcamento))

# exemplo 2

imdb %>% summarise(
  media_orcamento = mean(orcamento, na.rm = TRUE),
  mediana_orcamento = median(orcamento, na.rm = TRUE),
  qtd = n(),
  qtd_diretores = n_distinct(diretor)
)

# exemplo 3

imdb_generos %>%
  summarise(n_diretora = sum(genero == "female", na.rm = TRUE))

# exercício 1
# Use o `summarise` para calcular a proporção de filmes com diretoras.

imdb_generos %>% 
  summarise(
    n_diretoras = sum(genero == "female", na.rm = TRUE),
    n_diretores = sum(genero == "male", na.rm = TRUE),
    proporcao_de_mulheres = n_diretoras/(n_diretores+n_diretoras),
    prop_mu_2 = n_diretoras/n(),
    prop_mu_3 = mean(genero == "female", na.rm = TRUE)
  )

imdb_sem_na <- imdb_generos %>% 
  drop_na() %>% 
  count(genero) %>% 
  mutate(proporcao = n/sum(n))

# exercício 2
# Calcule a duração média e mediana dos filmes da base.

imdb %>% 
  summarise(
    duracao_media = mean(duracao, na.rm = TRUE),
    duracao_mediana = median(duracao, na.rm = TRUE)
  )

# exercício 3
# Calcule o lucro médio dos filmes com duracao < 60 minutos. E o lucro médio dos filmes com
# mais de 2 horas.

imdb %>% 
  mutate(
    grupos_de_interese = ifelse(duracao < 60, "filminho", "filmao"),
    grupos_de_interese2 = ifelse(duracao > 120, "filmaço", grupos_de_interese),
    lucro = receita-orcamento
  ) %>% 
  filter(is.na(grupos_de_interese))

# group_by + summarise ----------------------------------------------------

# exemplo 1

imdb %>% group_by(ano)

# exemplo 2

imdb %>% 
  group_by(ano) %>% 
  summarise(qtd_filmes = mean(nota_imdb))

# exemplo 3

imdb %>% 
  group_by(diretor) %>% 
  summarise(qtd_filmes = n(),
            qtd_filmes2 = n()^2)

imdb %>% 
  mutate(valor = 1) %>% 
  group_by(diretor) %>%
  summarise(qtde_filmes = sum(valor),
            diretor = 1)

imdb %>% 
  count(diretor)

# exercício 1
# Crie uma tabela com apenas o nome dos diretores com mais de 10 filmes.

imdb %>% 
  #group_by(diretor) %>% 
  # summarise(
  #   qtde_filmes = n()
  # ) %>% 
  count(diretor) %>% 
  #filter(qtde_filmes > 10, !is.na(diretor)) %>% 
  filter(n > 10, !is.na(diretor)) %>% 
  #arrange(desc(qtde_filmes))
  arrange(desc(n))

# exercício 2
# Crie uma tabela com a receita média e mediana dos filmes por ano.

imdb %>% 
  group_by(ano) %>% 
  summarise(
    receta_media = mean(receita, na.rm = TRUE),
    receta_mediana = median(receita, na.rm = TRUE)
  )

# exercício 3
# Crie uma tabela com a nota média do imdb dos filmes por tipo de classificacao.

imdb %>% 
  group_by(classificacao) %>% 
  summarise(
    nota_media_imdb = mean(nota_imdb)
  )

# exemplo 4

imdb %>%
  filter(str_detect(generos, "Action"), !is.na(diretor)) %>%
  group_by(diretor) %>%
  summarise(qtd_filmes = n()) %>%
  arrange(desc(qtd_filmes))

# exemplo 5

imdb %>% 
  filter(ator_1 %in% c("Brad Pitt", "Angelina Jolie Pitt")) %>%
  group_by(ator_1) %>%
  summarise(orcamento = mean(orcamento), receita = mean(receita), qtd = n())

# left join ---------------------------------------------------------------

# exemplo 1

imdb_completa <- imdb %>%
  #mutate(genero = generos) %>% 
  left_join(imdb_generos, by = c("diretor", "ano"))

View(imdb_completa)

# exemplo 2

depara_cores <- tibble(
  cor = c("Color", "Black and White"),
  cor2 = c("colorido", "pretoEbranco")
)

imdb_cor <- left_join(imdb, depara_cores, by = c("cor"))

# exercicio 1
# Calcule a média dos orçamentos e receitas para filmes feitos por
# gênero do diretor.

#imdb_completa %>% 
  #group_by(genero) %>% 

imdb %>% 
  left_join(imdb_generos) %>% 
  group_by(genero) %>% 
  summarise(media_orcamento = mean(orcamento, na.rm = TRUE),
            media_receita = mean(receita, na.rm = TRUE))

# gather ------------------------------------------------------------------

# exemplo 1

imdb_gather <- gather(imdb, "importancia_ator", "nome_ator", starts_with("ator"))

# spread ------------------------------------------------------------------

# exemplo 1

imdb <- spread(imdb_gather, importancia_ator, nome_ator)

