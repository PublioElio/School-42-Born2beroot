<div id="header" align="center">
  <img src="https://media.giphy.com/media/lRLzrbhmh5pFf4jOga/giphy.gif" width="250"/>
</div>

<h1 align="center">Born2beRoot</h1>

> School 42 Málaga cursus project

This is a repository to prepare the evaluation of the __School 42__ project __Born2beRoot__.
All the contents of this `README.md` are listed to help during the evaluation of the project, with useful commands, code and the explanation of functionalities and tasks that will be tested.

For more details about this project, read the [subject](https://github.com/PublioElio/School-42-Born2beroot/blob/main/Born2beRoot.es.subject.pdf).

## Table of contens
1. [Why a virtual machine(VM)?](#why-a-virtual-machinevm)
2. [Differences between CENTOS and Debian](#differences-between-centos-and-debian)
3. [APT and aptitude](#apt-and-aptitude)
    - [APT *(Advanced Packaging Tool)*](#apt-advanced-packaging-tool)
        - [Updating packages with APT](#updating-packages-with-apt)
    - [aptitude](#aptitude)
        - [Differences between aptitude and APT](#differences-between-aptitude-and-apt)  
4. [SELinux and AppArmor](#selinux-and-apparmor)
    - [SSELinux (*Security-Enhanced Linux*)](#selinux-security-enhanced-linux)
    - [AppArmor (*Application Armor*)](#apparmor-application-armor)
       - [Password Strength](#password-strength)
5. [UFW(*Uncomplicated Firewall*)](#ufw-uncomplicated-firewall)
6. [Password policy](#password-policy)
7. [LVM *(Logical Volume Manager)*](#lvm-Logical-volume-manager)
    - [Advantages of LVM](#advantages-of-lvm)
8. [SSH (Secure SHell)](#ssh-secure-shell)
9. [Cron](#cron)
    - [monitoring.sh and sleep.sh](#monitoringsh-and-sleepsh)
10. [Lightttpd](#lightttpd)
11. [Fail2ban](#fail2ban)

## Why a virtual machine(VM)?
The main purpose of __VMs__ is to use multiple __operating systems (OS)__ at the same time, on the same machine. Companies that use many applications must use different configurations of hardware, which has a high maintenance cost, in addition to taking up physical space. VMs are the answer to this and other problems, because it's like emulating an OS. This is a list of the most common reasons to install a VM:

- Test software for a different OS
- Run old or incompatible software
- Develop software for other platforms
- Handle potential malware safely
- Clone a system to another machine

## Differences between CENTOS and Debian

<div id="header" align="center">
  <a href="https://1gbits.com/blog/debian-vs-centos/"><img src="https://github.com/PublioElio/School-42-Born2beroot/blob/main/img/CENTOS_vs_DEBIAN.png" alt="comparison between CENTOS and DEBIAN"/></a>
</div>

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

Aptitude is vaster in functionality than `apt-get` and integrates functionalities of `apt-get` and its other variants including `apt-mark` and `apt-cache`. While `apt-get` handles all the package installation, up-gradation, system-upgradation, purging package, resolving dependencies etc. Aptitude handles lot more stuff than APT, including functionalities of `apt-mark` and `apt-cache` i.e. searching for a package in list of installed packages, marking a package to be automatically or manually installed, holding a package making it unavailable for up-gradation and so on. [(source)](https://www.tecmint.com/difference-between-apt-and-aptitude/)

## SELinux and AppArmor

<div id="SELinux" align="center">
  <img src="https://github.com/PublioElio/School-42-Born2beroot/blob/main/img/SELinux%20logo.png" height="200" alt="SELinux logo" />
</div>

### SELinux (*Security-Enhanced Linux*)
SELinux is a __security architecture__ for Linux systems that allows administrators more control over who can access them. SELinux defines access controls for applications, processes, and files within a system. It uses security policies, which consist of a set of __rules to tell SELinux which elements can be accessed__.

<div id="apparmor" align="center">
  <img src="https://github.com/PublioElio/School-42-Born2beroot/blob/main/img/apparmor-logo.png" height="200" alt="AppArmor logo" />
</div>

### AppArmor (*Application Armor*)
AppArmor is a Linux kernel __security module__ that allows the system administrator to __restrict the capabilities of a program__.

## UFW(*Uncomplicated Firewall*)
__UFW__ is a firewall developed by Ubuntu that stands out for its simplicity . Use the command line to configure iptables using a small number of simple commands. UFW is written in __python__ and is a GNU/Linux program.

__Check UFW status via `sudo ufw status`__
```
$ sudo ufw status verbose
```
__Check AppArmor status__
```
$ sudo aa-status
```
__Check OS (Operating System)__
```
$ lsb_release -a
```
__Add user to a group__
```
$ sudo adduser <username> <group>
```
__Check if an user is in a group__
```
$ getent group <groupname>
```
__Get all groups of an user__
```
$ id -Gn <username>
```
__List all groups and users__
```
$ getent group
```
## Password policy
- Passwords have to expire every 30 days.
- 2 must be the minimum number of days before being allowed to change a password.
- The user must receive a warning message 7 days before their password expires.
- A password must be at least 10 characters long.
- It must contain an uppercase letter and a number. Also, it must not contain more than 3 consecutive identical characters.
- The password must not include the name of the user.
- The following rule does not apply to the root password: The password must have at least 7 characters that are not part of the former password.

__Check password rules__
```
$ sudo cat /etc/login.defs
```
This three values are changed in the `login.defs` document, the *Password aging controls* section:
```
PASS_MAX_DAYS 30
PASS_MIN_DAYS 2
PASS_WARN_AGE 7
```
Now, we have to check the `/etc/security/pwquality.conf` configuration file. :
```
$ sudo cat /etc/security/pwquality.conf
```
This are the values that need to be modified in the configuration file:
```
# Number of characters in the new password that must not be present in the old password.
difok = 7
# The minimum acceptable size for the new password (plus one if credits are not disabled which is the default).
minlen = 10
# The maximum credit for having digits in the new password. If less than 0 it is the minimun number of digits in the new password.
dcredit = -1
# The maximum credit for having uppercase characters in the new password. If less than 0 it is the minimun number of uppercase characters in the new password.
ucredit = -1
# The maximum number of allowed consecutive same characters in the new password. The check is disabled if the value is 0.
maxrepeat = 3
# Whether to check it it contains the user name in some form. The check is disabled if the value is 0.
usercheck = 1
# Prompt user at most N times before returning with error. The default is 1.
retry = 3
# Enforces pwquality checks on the root user password. Enabled if the option is present.
enforce_for_root
```
__Add a new user__
```
$ sudo useradd <username>
```
__List users__
```
$ less /etc/passwd
```
__Create user login password__
```
$ sudo passwd <username>
```
__Create a new group__
```
$ groupadd <groupname>
```
__Check the hostname__
```
$ hostnamectl
```
__Change the hostname__

After modify the hostname is necessary to reboot the machine to apply the changes.

```
$ sudo nano /etc/hostname
```
Another way of doing this is:
```
$ sudo hostnamectl set-hostname <new_hostname>
```
__Then, reboot the machine__
```
$ reboot
```
__Change from user to root user__

Remember to use the __root password__!
```
$ sudo su
```
__Check partitions during evaluation__
```
$ lsblk
```
## LVM *(Logical Volume Manager)*
LVM is a software that allows the implementation of RAID *(Redundant Array of Inexpensive Disks)* from partitions and offer them to the operating system as new devices. For its operation, it assigns the disks to one or more physical volumes that must be partitioned as LVM type. LVM storage volumes have the ability to be resized and transported depending on user needs and using up-to-date appliance tools.

### Advantages of LVM 
- __restrictions of physical devices are eliminated__. 
- Performs __Snapshots__ that allow the current state of a logical volume to be stored and make a backup copy of the file system. And it's also fault tolerant, so a drive is easily replaceable, should it ever fail.

__Check all sudo logs__
The file is in `var/log/sudo/sudo.log`
```
$ sudo cat /var/log/sudo/sudo.log
```
<div id="cronjobs" align="center">
  <img src="https://github.com/PublioElio/School-42-Born2beroot/blob/main/img/cron%20jobs.png" width="600"/>
</div>

## Cron
Cron (or crontab, short for chrono table) is a program that enables the execution of scripts or software in an automatic way, at a certain date and time or at a specified interval. It is installed by default in Debian (we can check this with the `apt list cron command`). To test and understand the Cron service, you can use [this page](https://crontab.guru/#*_*_*_*_*).

__Check the Cron service__
```
$ crontab -e
```
__Check the crontab jobs__
```
$ sudo cat /var/spool/cron/crontabs/<username/root>
```
__Disable Cron service__
```
$ sudo systemctl disable cron
```
### `monitoring.sh` and `sleep.sh`
`monitoring.sh` is a script that displays a message on the terminals of all logged-in users. It searchs for certain values and saves them on variables to print on screen. `sleep.sh`calculates the amount of time that the virtual machine has been turned on to print the `monitoring.sh` message on the screen every ten minutes since the system was started.

__Check `monitoring.sh` (Cron service archives)__
```
$ sudo cat /root/monitoring.sh
```
__Check `sleep.sh` (create a sleep delay)__
```
$ sudo cat /root/sleep.sh
```
## SSH (*Secure SHell*)
SSH is the name of a protocol and the program that implements it, whose main function is __remote access to a server through a secure channel__ in which __all information is encrypted__. It is a protocol that allows secure communications between two systems using a __client/server architecture__ and authorizes users to connect to a host remotely. Unlike other remote communication protocols such as FTP or Telnet, SSH encrypts the connection session, making it impossible for anyone to obtain unencrypted passwords.

By accessing a remote server through the SSH protocol, security risks are considerably reduced. Both in the case of the client and the system itself, security is improved thanks to encryption; SSH takes care of encrypting all sessions. Thus, it is impossible for someone to access the passwords, the client's access data or what the client has written.

__Connect the VM via SSH__
```
$ ssh <username>@localhost -p 4242
```
__Check SSH status via `sudo service ssh status`__
```
$ sudo service ssh status
```
__Check SSH config file__
```
$ sudo cat /etc/ssh/sshd_config
```
## Lightttpd
__Lighttpd__ (pronounced *'lighty'*) is an open-source web server optimized for speed-critical environments while remaining standards-compliant, secure and flexible.

__Check lighttpd__ 
```
$ sudo systemctl status lighttpd
```
To check that lightspeed is working: in a browser on the host machine, connect to the following address and port (login into Wordpress): [http://127.0.0.1:8080](http://127.0.0.1:8080).

We can also check that PHP is correctly installed: [http://127.0.0.1:8080/info.php](http://127.0.0.1:8080/info.php)

__Check PHP version__
```
$ php -v
```
## Fail2ban
__Fail2ban__ is a program that analyses server logs to identify and ban __suspicious IP addresses__. If it finds multiple failed login attempts or automated attacks from an IP address, it can block it with the firewall, either temporarily or permanently.

__Check Fail2ban__
```
$ sudo systemctl status fail2ban
```
__Get VM disk ID__
```
$ shasum <path-to.vdi>
```
