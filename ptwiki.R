
# Download do Dump ---------------------------------------------------------
# Os links para download podem ser encontrados aqui:
# https://dumps.wikimedia.org/backup-index.html

download.file(
  "https://dumps.wikimedia.org/ptwiki/20161101/ptwiki-20161101-pages-articles.xml.bz2",
  "ptwiki-20161101-pages-articles.xml.bz2"
)


# Descompactar ------------------------------------------------------------
# Comando encontrado aqui:
# http://superuser.com/questions/480950/how-to-decompress-a-bz2-file

system("bzip2 -dk ptwiki-20161101-pages-articles.xml.bz2")


# Pré-Processar -----------------------------------------------------------
# Usar o arquivo .pl escrito por Matt Mahoney para deixar apenas o texto
# que é visível para um usuário. Mais infos:
# 
# http://mattmahoney.net/dc/textdata.html
#
# Program to filter Wikipedia XML dumps to "clean" text consisting only of lowercase
# letters (a-z, converted from A-Z), and spaces (never consecutive).  
# All other characters are converted to spaces.  Only text which normally appears 
# in the web browser is displayed.  Tables are removed.  Image captions are 
# preserved.  Links are converted to normal text.  Digits are spelled out.

system("perl wikifil.pl ptwiki-20161101-pages-articles.xml > ptwiki-20161101-pages-articles.txt")


# Tokenizar em sentenças --------------------------------------------------

x <- readLines("ptwiki-20161101-pages-articles.txt", n = 1)

