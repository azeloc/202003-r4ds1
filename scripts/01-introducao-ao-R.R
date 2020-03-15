# Criando objetos/variáveis -----------------------------------------------

obj <- 1
obj

# Também dizemos 'guardando as saídas'
y <- seq(1, 10, length.out = 5)
y

# ATALHO para rodar o código: CTRL + ENTER
# ATALHO para a <- : ALT - (alt menos)

# O R difencia minúscula de maiúscula!

a <- 5
A <- 42

# Os nomes devem começar com uma letra. 
# Podem conter letras, números, _ e .

eu_uso_snake_case
outrasPessoasUsamCamelCase
algumas.pessoas.usam.pontos
E_algumasPoucas.Pessoas_RENUNCIAMconvenções

eu_uso_snake_case <- 10

# Vetores -----------------------------------------------------------------

# Vetores são conjuntos ordenados de números

z <- c(1, 4, 3, 10)
z = c(1, 4, 3, 10)

z <- 3:10
z <- 10:3
z <- 0:-2

# Subsetting

vetor <- c(4, 8, 16, 15, 23, 42)

vetor[1]

vetor[c(1, 3)]

vetor[-5]
vetor[-c(1, 3)]

sort(vetor)

vetor[-c(2, length(vetor)-1)]

length(vetor)
# exercícios:
# 1) crie um vetor de 0 a 5 e guarde num objeto 

resposta1 <- 0:5
resposta1 = 0:5

resposta1 <- c(0, 1, 2, 3, 4, 5)
resposta1 <- seq(0, 5)

# chamado 'zero_a_cinco'.
# Dica: usar o operador : (1:10)

# 2) extraia apenas os números 0 e 5 desse vetor

resposta1[-c(1, 6)]

resposta1[c(1, 6)]

# Tipos -------------------------------------------------------------------

# Numéricos (numeric)

a <- 10
class(a)

# Caracteres (character, strings)

obj <- c("a", 1)
obj2 <- "masculino"

class(obj)

# lógicos (logical, booleanos)

verdadeiro <- TRUE
falso <- FALSE

class(falso)

# Bases (data.frame)

mtcars
class(mtcars)

# o operador $
mtcars

mtcars[c("cyl", "mpg")]

# Exercício: selecione a coluna 'cyl' usando o $ e 
# depois extraia os valores de 4 a 8

vetor1 <- mtcars$cyl
vetor2 <- mtcars['cyl']

class(vetor1)
class(vetor2)

vetor1[c(4, 8)]
vetor2[c(4, 8)]

# Funções -----------------------------------------------------------------

# Argumentos e ordem

seq(to = 10, from = 1, by = 2)
seq(1, 10, 2)

# Funções dentro de funções

mean(seq(1, mean(1:3)+5, 2))
mean(c(1, 3, 5, 7, 9))

# Guardando as saídas

y <- seq(1, 10, length.out = 5)
y

# Exercícios

# 1) use a funcao 'sum' para somar os valores de 1 a 100

sum(c(1, 2, 3, 4, 5))

sum(1:100)

# 2) agora some os valores da coluna mpg do banco 
# de dados mtcars (dica: use o $)

sum(mtcars$mpg)
sum(mtcars$cyl)

sum(mtcars)

x <- 2
y = 2

vetor1 <- c(3,2,1)
vetor2 = c(1,2,3)

vetor3 <- c("a", "b", "c")

class(vetor3)

vetor4 <- c(TRUE, FALSE)

vetor3[vetor4]

class(mtcars)

mtcars$mpg

# Criando funções

minha_soma <- function(x, y) {
  
  soma <- x^y
  
  return(soma)
  
}

minha_soma(x = 2, y = 3)

minha_soma(y = 2, x = 3)

# Exercício: crie uma função que recebe 2 números
# e devolve a raiz quadrada da soma desses números.
# Dica: sqrt() é a função para raiz quadrada.

funcao_raiz_da_soma_de_numeros <-
  function(a = 1, b = 2) {
    z1 <- a + 10
    z <- a + b
  }

funcao_raiz_da_soma_de_numeros(a = 3)

# essa so vai funcionar se eu atribuir a alguma variavel
funcao_raiz_da_soma_de_numeros <- function(primeiro_numero, segundo_numero){

  soma <- primeiro_numero + segundo_numero
  raiz_quadrada <- sqrt(soma)

}

resposta <- funcao_raiz_da_soma_de_numeros(2, 3)  

funcao_raiz_da_soma_de_numeros <- function(primeiro_numero, segundo_numero){
  
  soma <- primeiro_numero + segundo_numero
  return(sqrt(soma))
  
}

# é equivalente a
a = 3
b = 2
z <- a+b

# Comparações lógicas ------------------------------------------------------

1 > 0
2 < 1
3 == 3
3 != 1

variavel_logica <- 1 > 0

class(variavel_logica)

5 <= c(2,4,5)

c(1, 6, 5) < c(2, 4, 5)

c(2, 4, 5) < c(1, 6, 5, 3, 4, 5)

5 %in% c(2, 4, 5)

c(3, 4) %in% c(2, 4, 5)

mtcars[mtcars$cyl %in% c(4, 8), ]

# e também
!5 %in% c(2, 4, 5)
!5 %in% c(2, 4, 5)

mtcars[mtcars$cyl %in% c(4, 8), ]


1 >= 0
2 <= 1

# Exercício: crie um vetor de números e veja o 
# que acontece se você fizer uma comparação 
# lógica com ele.


# Valores especiais -------------------------------------------------------

# Existem valores reservados para representar dados faltantes, 
# infinitos, e indefinições matemáticas.

NA   # (Not Available) significa dado faltante/indisponível. 

NaN  # (Not a Number) representa indefinições matemáticas, como 0/0 e log(-1). 
# Um NaN é um NA, mas a recíproca não é verdadeira.

Inf  # (Infinito) é um número muito grande ou o limite matemático, por exemplo, 
# 1/0 e 10^310. Aceita sinal negativo -Inf.

100/.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001

Inf+1
Inf-1
Inf*(-1)
Inf - Inf
Inf/Inf
Inf*0
(1/Inf)
Inf^0
sqrt(Inf)

NULL # representa a ausência de informação.

mtcars$coluna

vetor[vetor < 1]

# Comparação lógica com valores especiais --------------------------------
# Use as funções is.na(), is.nan(), is.infinite() e is.null() 
# para testar se um objeto é um desses valores.

mtcars[1,2] <- NA

is.na(mtcars$cyl)

x <- NA
is.na(x)

mtcars$cyl[1] == NA
0/0 == NaN
is.nan(0/0)

a <- c(1, 2, 3, NA, 5)
is.na(a)

# família de funções que começam com is.*()
is.numeric()
is.character()
is.data.frame()
is.logical()
is.na()
is.nan()
is.null()

# Identação ---------------------------------------------------------------

funcao_com_muitos_argumentos(
  argumento_1 = 10,
  argumento_2 = 14,
  argumento_3 = 30,
  argumento_4 = 11
)
# ATALHO: CTRL+I

# Pacotes -----------------------------------------------------------------

# Para instalar pacotes

pacotes <- c("tidyverse", "rmarkdown", "devtools")

# Para carregar pacotes

library(dplyr)

# Também é possível acessar as funções usando ::

dplyr::select()


# Categorização ------------------------------------------------------------

x <- -10:30

x[3]
x[c(3, 6)]

x[c(FALSE, TRUE)]

x[1:10] <- "negativo"
x[-c(1:10)] <- "positivo"

indica_se_eh_menor_que_zero <- x < 0
indica_se_eh_maior_que_zero_ou_zero <- x >= 0

x[indica_se_eh_menor_que_zero] <- "negativo"
x[indica_se_eh_maior_que_zero_ou_zero] <- "positivo"

x_categorizado <- c("negativo", "negativo", "negativo", "negativo", "negativo", 
                    "negativo", "negativo", "negativo", "negativo", "negativo", "positivo", 
                    "positivo", "positivo", "positivo", "positivo", "positivo", "positivo", 
                    "positivo", "positivo", "positivo", "positivo", "positivo", "positivo", 
                    "positivo", "positivo", "positivo", "positivo", "positivo", "positivo", 
                    "positivo", "positivo", "positivo", "positivo", "positivo", "positivo", 
                    "positivo", "positivo", "positivo", "positivo", "positivo", "positivo"
)


vetor1[1] <- 10

vetor1[c(1, 3)] <- 10

mtcars[1,2] <- NA

# fazer um codigo que partindo de x traz só os negativos/positivos


x_categorizado <- ifelse(x < 0, "negativo", "positivo")

a <- ifelse(blablabla, "valor1", "valor2")
# equivalente a
a[blablabla] <- "valor1"
a[!blablabla] <- "valor2"

vetor_logico <- x < 0
x_categorizado <- ifelse(x < 0, "negativo", "positivo")
x_categorizado[vetor_logico] <- "negativo"
x_categorizado[!vetor_logico] <- "positivo"


# Operações vetoriais  -----------------------------------------------------

a <- 1:4
b <- 4:9

a + 1
a ^ 2
b * 5
b / a

a + b
b * a

# exercícios: crie um vetor 'mpg2' que receba a coluna 
# 'mpg' do mtcars, mas com seus valores ao quadrado.

mpg <- mtcars$mpg
mpg2 <- mpg^2
mpg2 <- mtcars$mpg^2

# Coerção ------------------------------------------------------------------
class(c(1, 2, 3))
class(c("a", "b", "c"))
class(c(TRUE, TRUE, FALSE))


# Misturando diferentes classes
c(1, 2, 3, "a")
c(TRUE, FALSE, "a")
c(1L, "a", "2")
class(c(TRUE, FALSE, 1L, 100L))

# Ordem de coerção
# logico < inteiro < numerico < caracter


# Uma das coerções mais importantes: lógico para numérico
x <- runif(100)

sum(x < .1)

x < .1
as.numeric(x < .1)
sum(x < 4)
x[x < 4]
sum(x[x < 4])

# exemplo mais complexo!
mtcars$mpg[mtcars$wt >= 3]


# Exercícios:
# 1) crie um vetor lógico 'maior_que_300' que indique 
# se o vetor mpg2 é maior que 300.

mpg2 <- mtcars$mpg^2

maior_que_300 <- mpg2 > 300

maior_que_300 <- 300 < mpg2

maior_que_300 <- ifelse(mpg2 > 300, TRUE, FALSE)

# outro exemplo

maior_que_300 <- ifelse(mpg2 > 300, "maior que 300", "menor que 300")

mpg2[maior_que_300]

indices <- which(maior_que_300)

mpg2[indices]

# 2) Calcule a soma do objeto maior_que_300 
# (utilize a função sum()).

sum(maior_que_300)
