#!/bin/bash
# Script apt-get para instalação dos pacotes que uso no linux
# Rodrigo Sant'Ana
# oc.rodrigosantana@gmail.com

## Verificação se o usuário é root

if [ "$(id -u)" != 0 ]; then
echo
echo "Bocoio de mola, precisa ser super usuario para instalar pacotes no Linux, entao use o sudo para executar este shell" \n\n\n
else
echo "Parabens, voce e um super usuario"
fi

echo 
echo
echo

## Adiciona o repositorio do R e a Chave de autenticacao do mesmo

# INICIO
echo -n "
 Adicionando o repositorio do CRAN-R no sources.list"

echo
echo
echo

echo -n "
  Deseja fazer um backup do arquivo sources.list? (S/N) "
read back
if [ "$back" = "S" ]; then
  sudo cp /etc/apt/sources.list /etc/apt/sources.list-backup
else
  echo -n "
    Backup nao foi realizado por alternativa do usuario"
fi

echo
echo
echo
 
# INFORMAÇÕES
DATA=`date +%d/%m/%y`
INFO="## Uncomment the following line to add CRAN-R repo - add by shell script in $DATA"
URL="deb http://cran-r.c3sl.ufpr.br/bin/linux/ubuntu quantal/"

echo -n " Adicionando URL..."
echo >> /etc/apt/sources.list
echo >> /etc/apt/sources.list $INFO
echo >> /etc/apt/sources.list $URL
sleep 1
echo -n "                             ["
$v
echo -n " OK "
$n
echo "]"

echo
echo
echo

echo -n " Realizando o update do sources.list"
 sudo apt-get update

echo
echo
echo

echo -n " Adicionando a chave de identificacao do CRAN-R"
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9 

echo
echo
echo

gpg -a --export E084DAB9 | sudo apt-key add -

echo
echo
echo

echo -n " Realizando o update do sources.list"
 sudo apt-get update

echo
echo
echo

# FIM

## Looping para instalação dos pacotes de forma iterativa

echo "Instalar maquina virtual java? (S/N) " 
read java
if [ "$java" = "S" ]; then
  sudo add-apt-repository ppa:webupd8team/java
  sudo apt-get update
  sudo apt-get install oracle-java8-installer
else
  echo "Ok... Oracle Java 8 nao sera instalado!"
fi


echo
echo
echo

echo "Instalar pacotes essenciais para a dist do linux? (S/N) " 
read essen
if [ "$essen" = "S" ]; then
    
  echo "... instalando pacotes adicionais ubuntu-restricted-extras, build-essentials, etc..."
  sudo apt-get install build-essential ubuntu-restricted-extras ubuntu-restricted-addons synaptic
else
  echo "Ok... Nao serao instalados os pacotes adicionais no Ubuntu"
fi

echo
echo
echo

echo "Instalar pacotes multimidia para a dist do linux? (S/N) " 
read essen
if [ "$essen" = "S" ]; then
    
  echo "... instalando pacotes multimidias vlc, smplayer, mplayer, etc..."
  sudo apt-get install mplayer smplayer vlc devede
else
  echo "Ok... Nao serao instalados os pacotes multimidia no Ubuntu"
fi

echo
echo
echo

echo "Instalar pacotes de produtividade para a dist do linux? (S/N) " 
read essen
if [ "$essen" = "S" ]; then
    
  echo "... instalando pacotes de produtividade jabref, dia, gimp, etc..."
  sudo apt-get install gimp jabref abiword gnumeric pinta maxima kiki gnuplot \
    maxima kiki gnuplot ubuntu-wallpapers ubuntu-wallpapers-*

else
  echo "Ok... Nao serao instalados os pacotes de produtividade no Ubuntu"
fi

echo
echo
echo

echo "Instalar pacotes de programacao para a dist do linux? (S/N) " 
read essen
if [ "$essen" = "S" ]; then
    
  echo "... instalando pacotes de programacao gcc, gob, proj, gdal, etc..."
  sudo apt-get install gobjc gobjc++ gobjc-multilib gobjc++-multilib gfortran-multilib \
    gcc-multilib g++-multilib gawk automake autoconf openmpi-common openmpi-checkpoint \
    libopenmpi1.3 libopenmpi-dev libsprng2 libsprng2-dev pvm pvm-dev \
    unixodbc unixodbc-bin gdal-bin libgdal1-dev libproj-dev

else
  echo "Ok... Nao serao instalados os pacotes de programacao no Ubuntu"
fi

echo
echo
echo

echo "Instalar pacotes do latex para a dist do linux? (S/N) " 
read essen
if [ "$essen" = "S" ]; then
    
  echo "... instalando pacotes do LaTeX ..."
  sudo apt-get install texlive-base texlive-bibtex-extra \
    texlive-fonts-extra texlive-fonts-recommended \
    texlive-generic-extra texlive-latex-extra texlive-math-extra \
    texlive-plain-extra texlive-science latex-xcolor latex-beamer \
    cm-super cm-super-minimal cm-super-x11 

else
  echo "Ok... Nao serao instalados os pacotes do LaTeX"
fi
