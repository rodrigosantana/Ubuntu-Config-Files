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
Deseja fazer um backup do arquivo sources.list e adicionar o repositorio do R? (S/N) "
read back
if [ "$back" = "S" ]; then
sudo cp /etc/apt/sources.list /etc/apt/sources.list-backup

echo
echo
echo
 
# INFORMAÇÕES
DATA=`date +%d/%m/%y`
INFO="## Uncomment the following line to add CRAN-R repo - add by shell script in $DATA"
URL="deb http://cran-r.c3sl.ufpr.br/bin/linux/ubuntu `lsb_release -sc`/"

echo -n " Adicionando URL..."
echo >> /etc/apt/sources.list
echo >> /etc/apt/sources.list $INFO
echo >> /etc/apt/sources.list $URL
sleep 1
echo -n " ["
$v
echo -n " OK "
$n
echo "]"

echo
echo
echo

echo -n " Adicionando a chave de identificacao do CRAN-R"
 sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

echo -n " Realizando o update do sources.list"
 sudo apt-get update

echo
echo
echo

else
echo "Nao foi adicionado o repositorio do R nem feito backup do sources-list"
fi

# FIM

## Looping para instalação dos pacotes de forma iterativa

echo "Instalar maquina virtual java? (S/N) "
read java
if [ "$java" = "S" ]; then
sudo add-apt-repository ppa:webupd8team/java
  sudo apt-get update
  sudo apt-get install -y oracle-java8-installer
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
  sudo apt-get install -y build-essential ubuntu-restricted-extras ubuntu-restricted-addons synaptic
else
echo "Ok... Nao serao instalados os pacotes adicionais no Ubuntu"
fi

echo
echo
echo

echo "Instalar pacotes de suporte de internet para a dist do linux? (S/N) "
read essen
if [ "$essen" = "S" ]; then
echo "... instalando pacotes de suporte de internet chromium-browser, etc..."
  sudo apt-get install -y chromium-browser 
else
echo "Ok... Nao serao instalados os pacotes de suporte de internet no Ubuntu"
fi

echo
echo
echo

echo "Instalar pacotes multimidia para a dist do linux? (S/N) "
read essen
if [ "$essen" = "S" ]; then
echo "... instalando pacotes multimidias vlc, smplayer, mplayer, etc..."
  sudo apt-get install -y mplayer smplayer vlc devede
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
  sudo apt-get install -y gimp jabref abiword gnumeric pinta maxima kiki gnuplot \
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
  sudo apt-get install -y gobjc gobjc++ gobjc-multilib gobjc++-multilib gfortran-multilib \
    gcc-multilib g++-multilib gawk automake autoconf openmpi-common openmpi-checkpoint \
    libopenmpi1.3 libopenmpi-dev libsprng2 libsprng2-dev pvm pvm-dev \
    unixodbc unixodbc-bin gdal-bin libgdal1-dev libproj-dev git git-all bwidget markdown pandoc

else
echo "Ok... Nao serao instalados os pacotes de programacao no Ubuntu"
fi

echo
echo
echo

echo "Instalar dependencias para o RGL? (S/N)"
read essen
if [ "$essen" = "S" ]; then
echo "... instalando dependencias do RGL ..."
  sudo apt-get install -y cdbs dh-translations intltool libdrm-dev \
      libgl1-mesa-dev libglu1-mesa-dev libx11-xcb-dev libxcb-glx0-dev \
      libxdamage-dev libxfixes-dev libxxf86vm-dev mesa-common-dev python-scour \
      x11proto-damage-dev x11proto-dri2-dev x11proto-fixes-dev x11proto-gl-dev \
      x11proto-xf86vidmode-dev
fi

echo
echo
echo

echo "Instalar pacotes do latex para a dist do linux? (S/N) "
read essen
if [ "$essen" = "S" ]; then
echo "... instalando pacotes do LaTeX ..."
  sudo apt-get install -y texlive-base texlive-bibtex-extra \
    texlive-fonts-extra texlive-fonts-recommended \
    texlive-generic-extra texlive-latex-extra texlive-math-extra \
    texlive-plain-extra texlive-science latex-xcolor latex-beamer \
    cm-super cm-super-minimal cm-super-x11

else
echo "Ok... Nao serao instalados os pacotes do LaTeX"
fi

echo
echo
echo

echo "Instalar o emacs? (S/N)"
read essen
if [ "$essen" = "S" ]; then
echo "... instalando emacs ess emacs-goodies-el ..."
  sudo apt-get install -y emacs ess emacs-goodies-el
else
echo "Ok... nao sera instalado o Emacs"
fi

echo
echo
echo

echo "Instalar fontes extras? (S/N)"
read essen
if [ "$essen" = "S" ]; then
echo "... instalando fontes extras ..."
  sudo apt-get install -y ttf-bitstream-vera ttf-dejavu ttf-inconsolata \
       ttf-liberation ttf-linux-libertine
else
echo "Ok... Nao seram instalados as fontes extras"
fi

echo
echo
echo

echo "Instalar fontes nonfree do LaTeX? (S/N)"
read essen
if [ "$essen" = "S" ]; then
    echo
    echo Baixando o instalador de tug.org
    wget http://tug.org/fonts/getnonfreefonts/install-getnonfreefonts
    echo
    echo Instalando o programa
    texlua install-getnonfreefonts
    echo
    echo Baixando e instalando todas as fontes nonfree
    getnonfreefonts-sys -a
    updmap-sys
    texhash
    echo
    echo Removendo instalador...
    rm install-getnonfreefonts
else
echo "Ok... nao serao instalados os pacotes nonfree de fonts"
fi

echo
echo
echo

echo "Instalar utilitarios para desktop? (S/N)"
read essen
if [ "$essen" = "S" ]; then
  sudo apt-get install -y shutter python-gpgme # para o dropbox daemon
else
echo "Ok... opcao nao instalada"
fi

echo
echo
echo

echo "Instalar repositorio Medibunte e libdvdcss2? (S/N)"
read essen
if [ "$essen" = "S" ]; then
    echo Baixando Medibuntu e colocando em /etc/apt/sources.list.d/
    echo
    wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list 
    sudo apt-get update 
    sudo apt-get --yes --allow-unauthenticated install medibuntu-keyring 
    sudo apt-get update
    echo
    echo
    echo Instalando libdvdcss2
    sudo apt-get install -y libdvdcss2
else
echo "Nao foram instalados os pacotes acima"
fi

echo
echo
echo

echo "Instalar as dependencias do R na dist do linux? (S/N) "
read essen
if [ "$essen" = "S" ]; then
echo "... instalando dependencias do R ..."
  sudo apt-get build-dep r-base r-base-core
else
echo "Ok... Nao serao instalados as deps do R"
fi

echo 
echo 
echo 

echo "Baixar e compilar o R? (S/N)"
read essen
if [ "$essen" = "S" ] ; then
    echo Antes, verficar se o diretorio Programas ja existe
    if [ -e ~/Programas ]; then
        echo ~/Programas ja foi criado
    else
        echo ~/Programas ausente, vou criar
        mkdir ~/Programas
        echo
        echo Continuando...
    fi
    echo Agora verifica se Programas/arquivos foi criado
    if [ -e ~/Programas/arquivos ]; then
        echo ~/Programas/arquivos ja foi criado
    else
        echo ~/Programas/arquivo ausente, vou criar
        mkdir ~/Programas/arquivos
        echo
        echo Continuando...
    fi
    echo
    echo Baixando o R de cran-r.c3sl.ufpr.br
    echo
    echo Digite a versao do R, apenas numeros
    read Rver
    wget -O ~/Programas/arquivos/R-$Rver.tar.gz http://cran-r.c3sl.ufpr.br/src/base/R-3/R-$Rver.tar.gz
    echo
    echo Extraindo R-$Rver para ~/Programas
    tar -zxvf ~/Programas/arquivos/R-$Rver.tar.gz -C ~/Programas
    echo
    echo
    echo Rodando ./configure --enable-R-shlib
    echo
    cd ~/Programas/R-$Rver
    ./configure --enable-R-shlib
    echo
    echo
    echo Compilando...
    echo
    make
    echo
    echo
    echo Rodando make check...
    echo
    make check
    echo
    echo
    echo Instalando...
    echo
    sudo make install
    echo
    echo
    echo R $Rver compilado e instalado
    echo
    echo
else
echo "Ok... Nao sera baixado e compilado o R"
fi

exit
