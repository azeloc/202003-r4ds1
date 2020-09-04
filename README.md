
<!-- README.md is generated from README.Rmd. Please edit that file -->

## Configuração inicial

#### Passo 1: Instalar pacotes

``` r
install.packages("remotes")

# instalar pacote da Curso-R
remotes::install_github("curso-r/CursoR")

# instalar pacotes que vamos usar durante o curso
CursoR::instalar_dependencias()
```

#### Passo 2: Criar um projeto do RStudio

Faça um projeto do RStudio para usar durante todo o curso e em seguida
abra-o.

``` r
install.packages("usethis")
usethis::create_package("caminho_ate_o_projeto/nome_do_projeto")
```

#### Passo 3: Baixar o material

Certifique que você está dentro do projeto criado no passo 2 e rode o
código abaixo.

**Observação**: Assim que rodar o código abaixo, o programa vai pedir
uma escolha de opções. Escolha o número correspondente ao curso de R
para Ciência de Dados 1\!

``` r
# Baixar ou atualizar material do curso
CursoR::atualizar_material()
```

## Slides

| slide                              | link                                                                       |
| :--------------------------------- | :------------------------------------------------------------------------- |
| slides/01-introducao-ao-curso.html | <https://curso-r.github.io/main-r4ds-1/slides/01-introducao-ao-curso.html> |
| slides/02-introducao-ao-r.html     | <https://curso-r.github.io/main-r4ds-1/slides/02-introducao-ao-r.html>     |
| slides/03-importacao.html          | <https://curso-r.github.io/main-r4ds-1/slides/03-importacao.html>          |
| slides/04-manipulacao.html         | <https://curso-r.github.io/main-r4ds-1/slides/04-manipulacao.html>         |
| slides/05-ggplot2.html             | <https://curso-r.github.io/main-r4ds-1/slides/05-ggplot2.html>             |

## Scripts usados em aula

| script                      | link                                                                          |
| :-------------------------- | :---------------------------------------------------------------------------- |
| 00-exemplo-relatorio-R.docx | <https://curso-r.github.io/202003-r4ds-1/scripts/00-exemplo-relatorio-R.docx> |
| 00-exemplo-relatorio-R.pdf  | <https://curso-r.github.io/202003-r4ds-1/scripts/00-exemplo-relatorio-R.pdf>  |
| 00-exemplo-relatorio-R.Rmd  | <https://curso-r.github.io/202003-r4ds-1/scripts/00-exemplo-relatorio-R.Rmd>  |
| 00-exemplo-script-r.R       | <https://curso-r.github.io/202003-r4ds-1/scripts/00-exemplo-script-r.R>       |
| 01-introducao-ao-R.R        | <https://curso-r.github.io/202003-r4ds-1/scripts/01-introducao-ao-R.R>        |
| 02-importacao.R             | <https://curso-r.github.io/202003-r4ds-1/scripts/02-importacao.R>             |
| 03-manipulacao.R            | <https://curso-r.github.io/202003-r4ds-1/scripts/03-manipulacao.R>            |
| 04-ggplot2.Rmd              | <https://curso-r.github.io/202003-r4ds-1/scripts/04-ggplot2.Rmd>              |
| 05-case.Rmd                 | <https://curso-r.github.io/202003-r4ds-1/scripts/05-case.Rmd>                 |
| 06-avaliacao.R              | <https://curso-r.github.io/202003-r4ds-1/scripts/06-avaliacao.R>              |
| dicas\_rapidas.R            | <https://curso-r.github.io/202003-r4ds-1/scripts/dicas_rapidas.R>             |
