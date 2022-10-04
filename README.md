# School 42 Born2beRoot
This is a repository to prepare the defense of the __School 42__ project __Born2beroot__.
For more details about this project, read the subjet, [also included in this repository](https://github.com/PublioElio/School-42-Born2beroot/blob/main/Born2beRoot.es.subject.pdf).

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

Para utilizar `aptitude` por terminal de comandos, al igual que `apt-get`, hay que estar logueados como super-usuario (root) o utilizar el comando `sudo`. En [este enlace](https://wiki.debian.org/Aptitude) hay una lista de los comandos comunes de `aptitude`.

## SELinux y AppArmor

### *Security-Enhanced Linux* (SELinux)
SELinux es una __arquitectura de seguridad__ para los sistemas Linux que permite que los administradores tengan mayor control sobre las personas que pueden acceder a ellos. 

### AppArmor (*Application Armor*)
AppArmor es un __módulo de seguridad__ del kernel Linux que permite al administrador del sistema __restringir las capacidades de un programa__. 
