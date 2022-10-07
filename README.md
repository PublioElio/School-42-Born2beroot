# School 42 Born2beRoot
This is a repository to prepare the defense of the __School 42__ project __Born2beroot__.
For more details about this project, read the [subject](https://github.com/PublioElio/School-42-Born2beroot/blob/main/Born2beRoot.es.subject.pdf).

## Why a virtual machine(VM)?
The main purpose of __VMs__ is to use multiple __operating systems (OS)__ at the same time, on the same machine. Companies that use many applications must use different configurations of hardware, which has a high maintenance cost, in addition to taking up physical space. VMs are the answer to this and other problems, because it's like emulating an OS. This is a list of the most common reasons to install a VM:

- Try new operating systems
- Run old or incompatible software
- Develop software for other platforms
- Handle potential malware safely
- Clone a system to another machine

## APT y `aptitude`
Ambos están relacionados con la gestión de paquetes. Se usan para la búsqueda, eliminación y e instalación de paquetes, pero tienen enfoques diferentes.

### APT *(Advanced Packaging Tool)*
APT es una herramienta de código abierto creada por el proyecto __Debian__. APT está diseñada para manejar la instalación y eliminación de software; formaba parte del paquete `.deb` de Debian; sin embargo, ahora funciona con __[RPM Package Manager](https://rpm.org/)__. Incluye programas de línea de comandos: `apt`, `apt-get` y `apt-cache`.

APT busca en su lista de paquetes en caché y enumera las dependencias que deben __instalarse o actualizarse__. APT recupera, configura e instala las dependencias automáticamente.

#### Actualización de paquetes con APT

La actualización de paquetes instalados incluyen:

- `update` se utiliza para __sincronizar__ los archivos desde sus fuentes.
- `upgrade` se usa para __instalar__ las versiones más recientes de todos los paquetes actualmente instalados en el sistema desde las fuentes enumeradas en `/etc/apt/sources.list.` Los paquetes instalados con nuevas versiones disponibles __se recuperan y actualizan__; bajo ninguna circunstancia se eliminan los paquetes instalados, o se recuperan e instalan los paquetes que aún no están instalados. Las nuevas versiones que no se pueden actualizar sin cambiar el estado de paquete se mantendrán en su versión actual.
- `full-upgrade` (`apt`) y `dist-upgrade` (`apt-get`), además de actualización, también maneja de manera inteligente las dependencias cambiantes con nuevas versiones de paquetes; `apt` y `apt-get` tienen un sistema de __resolución de conflictos inteligente__ e intentarán actualizar los paquetes más importantes a expensas de los menos importantes si es necesario. El archivo `/etc/apt/sources.list` contiene una lista de ubicaciones desde las que recuperar los archivos de paquetes deseados. __`aptitude`__ tiene una función de actualización de `dist-upgrade` más inteligente llamada `full-upgrade`.

### aptitude 
`aptitude` es una interfaz para APT. Muestra una lista de paquetes de software y permite al usuario elegir de modo __interactivo__ cuáles desea instalar o eliminar. Dispone de un sistema de búsqueda que utiliza patrones flexibles, que facilitan al usuario entender las complejas relaciones de dependencia que puedan existir entre los paquetes. En un principio, se diseñó para distribuciones __GNU/Linux Debian__, pero hoy día también se puede utilizar en distribuciones basadas en paquetes __RPM__.

Necesita tres puntos indispensables: **usuario, puerto y servidor**.

Para utilizar `aptitude` por terminal de comandos, al igual que `apt-get`, hay que estar logueados como super-usuario (root) o utilizar el comando `sudo`. En [este enlace](https://wiki.debian.org/Aptitude) hay una lista de los comandos comunes de `aptitude`.

## SELinux y AppArmor

### SELinux (*Security-Enhanced Linux*) 
SELinux es una __arquitectura de seguridad__ para los sistemas Linux que permite que los administradores tengan mayor control sobre las personas que pueden acceder a ellos. SELinux define los controles de acceso para las aplicaciones, los procesos y los archivos dentro de un sistema. Utiliza políticas de seguridad, que consisten en un conjunto de __reglas para indicar a SELinux a qué elementos se puede acceder__.

### AppArmor (*Application Armor*)
AppArmor es un __módulo de seguridad__ del kernel Linux que permite al administrador del sistema __restringir las capacidades de un programa__.

## SSH (*Secure SHell*)
SSH, o intérprete de comandos seguro, es el nombre de un protocolo y el programa que lo implementa, cuya principal función es el acceso remoto a un servidor por medio de un canal seguro en el que toda la información está cifrada. Es un protocolo que facilita las __comunicaciones seguras entre dos sistemas__ usando una arquitectura __cliente/servidor__ y que permite a los usuarios conectarse a un host __remotamente__. A diferencia de otros protocolos de comunicación remota tales como FTP o Telnet, SSH __encripta__ la sesión de conexión, haciendo imposible que alguien pueda obtener contraseñas no encriptadas.

Accediendo a un servidor remoto a través del protocolo SSH los riesgos de seguridad se reducen considerablemente. Tanto en el caso del cliente como del propio sistema la seguridad se mejora gracias a la encriptación; Secure SHell se encarga de encriptar todas las sesiones. Así, resulta imposible que alguien pueda acceder a las contraseñas, los datos de acceso del cliente o a lo que éste haya escrito.

## UFW(*Uncomplicated Firewall*)
UFW es un cortafuegos que destaca por su simplicidad desarrollado por Ubuntu. Utiliza la línea de comandos para configurar las iptables usando un pequeño número de comandos simples. UFW está escrito en python y es un programa para GNU/Linux.

### Check partitions during evaluation
```
$ lsblk
```
### Add user to sudo group
```
$ adduser <username> sudo
```
### Check if an user is in a group
```
$ getent group sudo
```
### Check all sudo logs
The `sudologs file is in `var/log/sudo/sudologs`
```
$ sudo cat var/log/sudo/sudologs
```
### Check SSH status via `sudo service ssh status`
```
$ sudo service ssh status
```
### Check UFW status via sudo ufw status`
```
$ sudo ufw status verbose
```
### Check AppArmor status
```
$ sudo aa-status
```
### Password policy
- Passwords have to expire every 30 days.
- 2 must be the minimum number of days before being allowed to change a password.
- The user must receive a warning message 7 days before their password expires.
- A password must be at least 10 characters long.
- It must contain an uppercase letter and a number. Also, it must not contain more than 3 consecutive identical characters.
- The password must not include the name of the user.
- The following rule does not apply to the root password: The password must have at least 7 characters that are not part of the former password.

#### Change password
```
$ sudo passwd <user/root>
```

### Changing the Hostname
The hostname of our virtual machine must be our intra __login + 42__. Whether we correctly named it during the installation or not, we will have to change it during the evaluation. So we must know how. The following command will do the trick:
```
$ sudo hostnamectl set-hostname <new_hostname>
```
We could also change the hostname by editing the `/etc/hostname` file instead.

For the changes to take effect, we must restart the machine, which may take some time. The alternative is simply to show the hostname status after the change:
```
$ hostnamectl status
```
## User Management
At startup, there must be at least two users: root and a personal user with our intra login as a username. For the evaluation, we must also be able to show a list of all users, add or delete user accounts, change their usernames, add or remove them from groups, etc. The following commands are necessary to do all of that:

- useradd : creates a new user.
- usermod : changes the user’s parameters: -l for the username, -c for the full name, -g for groups by group ID.
- userdel -r : deletes a user and all associated files.
- id -u : displays user ID.
- users : shows a list of all currently logged in users.
- cat /etc/passwd | cut -d ":" -f 1 : displays a list of all users on the machine.
- cat /etc/passwd | awk -F '{print $1}' : same as above.
