# Método de uso del directorio dotfiles

El directorio dotfiles es usado para organizar y tener seguimiento de todos los archivos de configuracion 
mediante enlaces simbólicos. Para ello estoy usando la herramienta GNU stow 
y para llevar un control de versiones de los archivos y los cambios hago uso de git.

## Instalación de stow

```shell
sudo dnf install git stow
```
## Creación del directorio dotfiles

Debemos crear un directorio hijo en el que guardaremos los archivos de configuración, en nuestro caso le hemos
llamado dotfiles.

```shell
mkdir ~/dotfiles
cd ~/dotfiles
```
## Utilización de stow

Una vez dentro del directorio, movemos los archivos de configuración desde $HOME a $HOME/dotfiles.

```Shell
mv ~/.bashrc ~/.bashrc
```
Ahora solo debemos usar stow para crear enlaces simbólicos de los archivos que empiezan por 
un punto y los crea en el directorio padre del directorio indicado. La manera mas sencilla de 
usar esto es mediante el comando `stow .`. Si estámos situados en el directorio dotfiles, no es 
necesario indicar ni el directorio sobre el que queremos realizar stow ni al que queremos copiar 
esos archivos. 

```shell
# Manera en la que funciona el comando stow
stow [options] [action flag] package ...
```
Por defecto, stow tiene una lista de archivos a los cuales no hace seguimiento o no les crea 
enlaces simbólicos.
```shell
# Comments and blank lines are allowed.

RCS
.+,v

CVS
\.\#.+       # CVS conflict files / emacs lock files
\.cvsignore

\.svn
_darcs
\.hg

\.git
\.gitignore
\.gitmodules

.+~          # emacs backup files
\#.*\#       # emacs autosave files

^/README.*
^/LICENSE.*
^/COPYING
```
Si queremos, podemos crear un archivo llamado `.stow-local-ignore` o bien `~/.stow-global-ignore` e introducir 
las expresiones para las que no queremos que stow cree enlaces simbólicos.

Toda esta información y más la podemos encontrar en el manual del paquete o en la propia documentación[https://www.gnu.org/software/stow/manual/stow.html] de stow.

Ahora lo que haremos será iniciar git en el directorio dotfiles para hacer un seguimiento de los
archivos de configuración
 
```shell
git init .
git add .
git commit -m "..."
```
## Uso de la bandera `--dotfiles`

Una de las inconveniencias de este directorio es que necesitamos usar la bandera `-l` para ver los archivos,
stow soluciona esto mediante el uso de la bandera `--dotfiles` ya que todos los archivos que comiencen por
`dot-`, los convierte en un archivo empezado por punto en el directorio padre.

```shell
# Este es un ejemplo estando situados en el directorio ~/dotfiles
mv ~/.bashrc dot-bashrc
stow --dotfiles .
# Esto crea el siguiente enlace: ~/.bashrc -> ~/dotfiles/dot-bashrc
```

## Agrupar los archivos en diferentes directorios

Si queremos tener los archivos guardados en distintas carpetas dentro del directorio *dotfiles*, 
lo que hacemos marcar esos directorios como origen, sin cambiar el destino.

Imaginemos que tenemos los archivos de configuración de vim en una carpeta llamada vim dentro de la
carpeta dotfiles y otra igual para las configuraciones que tengan que ver con bash, lo que tendriamos que hacer
es lo siguiente:

```shell
mkdir -p ~/dotfiles/bash 
mkdir ~/dotfiles/vim
mv ~/.vim ~/dotfiles/vim/dot-vim
mv ~/.vimrc ~/dotfiles/vim/dot-vimrc
mv ~/.bashrc ~/dotfiles/bash/dot-bashrc

# Guardamos los cambios
git add .
git commit -m "..."

# Realizamos el stow
stow --dotfiles bash vim
```


