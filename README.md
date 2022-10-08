# School 42 Born2beRoot
This is a repository to prepare the defense of the __School 42__ project __Born2beroot__.
For more details about this project, read the [subject](https://github.com/PublioElio/School-42-Born2beroot/blob/main/Born2beRoot.es.subject.pdf).

## Why a virtual machine(VM)?
The main purpose of __VMs__ is to use multiple __operating systems (OS)__ at the same time, on the same machine. Companies that use many applications must use different configurations of hardware, which has a high maintenance cost, in addition to taking up physical space. VMs are the answer to this and other problems, because it's like emulating an OS. This is a list of the most common reasons to install a VM:

- Test software for a different OS
- Run old or incompatible software
- Develop software for other platforms
- Handle potential malware safely
- Clone a system to another machine

## APT and `aptitude`
Both are related to package management. They are used for package search, removal, and installation, but have different approaches.

### APT *(Advanced Packaging Tool)*
APT is an open source tool created for the __Debian__ project. APT is designed to handle the installation and removal of software; it was part of the Debian `.deb` package; however, it now works with __[RPM Package Manager](https://rpm.org/)__. It includes command line programs: `apt`, `apt-get` and `apt-cache`.

APT searchs in a list of cached packages and shows the dependencies that need to be __installed or updated__. APT automatically downloads, configures, and installs dependencies.

#### Updating packages with APT

Update installed packages includes:

- `update` is used to __sync__ files from their sources.
- `upgrade` is used to __install__ the latest versions of all packages currently installed on the system from the sources listed in `/etc/apt/sources.list`. Installed packages with new versions available are __downloaded and updated__; under no circumstances installed packages are removed, or packages that are not yet installed are downloaded and installed. New versions that cannot be updated without changing the package state will remain at their current version.
- `full-upgrade` (`apt`) y `dist-upgrade` (`apt-get`), in addition to updating, also handles changing dependencies with new package versions; apt and `apt-get` have __smart conflict resolution system__ and will try to update more important packages at the expense of less important ones if necessary. The `/etc/apt/sources.list` file contains a list of locations from which to download the desired package files. `aptitude` has a smarter dist-upgrade function called `full-upgrade`.

### aptitude 
`aptitude` is an interface to APT. Displays a list of software packages and allows the user to __interactively__ choose which ones to install or remove. It has a search system that uses flexible patterns, which make it easy for the user to understand the complex dependency relationships that may exist between packages. Originally it was designed for __GNU/Linux Debian__ distributions, but nowadays it can also be used in distributions based on __RPM__ packages.

You need three essential points: **user, port and server**.

To use `aptitude` by command terminal, like `apt-get`, you must be logged in as super-user (root) or use the `sudo` command. In [this link](https://wiki.debian.org/Aptitude) you can find list of common aptitude commands.

#### Differences between `aptitude` and APT

The main difference is that __aptitude is a high-level package manager while APT is lower-level package manager__ which can be used by other higher-level package managers, other main highlights that separate these two package managers are:

Aptitude is vaster in functionality than `apt-get` and integrates functionalities of `apt-get` and its other variants including `apt-mark` and `apt-cache`. While `apt-get` handles all the package installation, up-gradation, system-upgradation, purging package, resolving dependencies etc., Aptitude handles lot more stuff than APT, including functionalities of `apt-mark` and `apt-cache` i.e. searching for a package in list of installed packages, marking a package to be automatically or manually installed, holding a package making it unavailable for up-gradation and so on. [(source)](https://www.tecmint.com/difference-between-apt-and-aptitude/)

## SELinux y AppArmor

### SELinux (*Security-Enhanced Linux*) 
SELinux es una __arquitectura de seguridad__ para los sistemas Linux que permite que los administradores tengan mayor control sobre las personas que pueden acceder a ellos. SELinux define los controles de acceso para las aplicaciones, los procesos y los archivos dentro de un sistema. Utiliza políticas de seguridad, que consisten en un conjunto de __reglas para indicar a SELinux a qué elementos se puede acceder__.

### AppArmor (*Application Armor*)
AppArmor es un __módulo de seguridad__ del kernel Linux que permite al administrador del sistema __restringir las capacidades de un programa__.

## UFW(*Uncomplicated Firewall*)
UFW es un cortafuegos que destaca por su simplicidad desarrollado por Ubuntu. Utiliza la línea de comandos para configurar las iptables usando un pequeño número de comandos simples. UFW está escrito en python y es un programa para GNU/Linux.

## SSH (*Secure SHell*)
SSH, o intérprete de comandos seguro, es el nombre de un protocolo y el programa que lo implementa, cuya principal función es el acceso remoto a un servidor por medio de un canal seguro en el que toda la información está cifrada. Es un protocolo que facilita las __comunicaciones seguras entre dos sistemas__ usando una arquitectura __cliente/servidor__ y que permite a los usuarios conectarse a un host __remotamente__. A diferencia de otros protocolos de comunicación remota tales como FTP o Telnet, SSH __encripta__ la sesión de conexión, haciendo imposible que alguien pueda obtener contraseñas no encriptadas.

Accediendo a un servidor remoto a través del protocolo SSH los riesgos de seguridad se reducen considerablemente. Tanto en el caso del cliente como del propio sistema la seguridad se mejora gracias a la encriptación; Secure SHell se encarga de encriptar todas las sesiones. Así, resulta imposible que alguien pueda acceder a las contraseñas, los datos de acceso del cliente o a lo que éste haya escrito.

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
The `sudologs file is in `var/log/sudo/sudo.log`
```
$ sudo cat /var/log/sudo/sudo.log
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
### Check monitoring / Cron service archives
```
$ sudo cat /root/monitoring.sh
```
Check the archive to timing the messages in console:
```
$ sudo cat /root/sleep.sh
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
### Connect the VM via SSH
```
$ ssh adiaz-be@localhost -p 4242
```
### Check PHP version
```
$ php -v
```
### Check lighttpd 
```
$ sudo systemctl status lighttpd
```
To check that lightspeed is working: in a browser on the host machine, connect to the following address and port: : [http://127.0.0.1:8080](http://127.0.0.1:8080)
Now, check that PHP is correctly installed: [http://127.0.0.1:8080/info.php](http://127.0.0.1:8080/info.php)

### Check VM status
```
$ shasum 2022-10-08T12-09-27-035734000Z.sav
```

## User Management
At startup, there must be at least two users: root and a personal user with our intra login as a username. For the evaluation, we must also be able to show a list of all users, add or delete user accounts, change their usernames, add or remove them from groups, etc. The following commands are necessary to do all of that:

- `useradd` : creates a new user.
- `usermod` : changes the user’s parameters: -l for the username, -c for the full name, -g for groups by group ID.
- `userdel -r` : deletes a user and all associated files.
- `id -u` : displays user ID.
- `users` : shows a list of all currently logged in users.
- `cat /etc/passwd | cut -d ":" -f 1` : displays a list of all users on the machine.
- `cat /etc/passwd | awk -F '{print $1}'` : same as above.

## Group Management
In the same way, we will have to manage user groups. Our default personal user must be in the `sudo` and `user42` groups. The following commands need to be mastered for the evaluation:

- `groupadd`: creates a new group.
- `gpasswd -a`: adds a user to a group.
- `gpasswd -d`: removes a user from a group.
- `groupdel`: deletes a group.
- `groups`: displays the groups of a user.
- `id -g`: shows a user’s main group ID.
- `getent group`: displays a list of all users in a group.
