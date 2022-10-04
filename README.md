# School-42-Born2beroot
This is a repository to prepare the defense of the School 42 project Born2beroot

## Comandos APT y aptitude
Ambos están relacionados con la gestión de paquetes. Se usan para la búsqueda, eliminación y e instalación de paquetes, pero tienen enfoques diferentes.

### APT *(Advanced Packaging Tool)*
APT es una herramienta de código abierto creada por el proyecto Debian. APT está diseñada para manejar la instalación y eliminación de software. APT formaba parte del paquete .deb de Debian; sin embargo, ahora funciona con [RPM Package Manager](https://rpm.org/). Incluye programas de línea de comandos que son: `apt`, `apt-get` y `apt-cache`.

APT busca en su lista de paquetes en caché y enumera las dependencias que deben instalarse o actualizarse. APT recupera, configura e instala las dependencias automáticamente.

#### Actualización de paquetes con APT

La actualización de paquetes instalados incluyen:

`update` se utiliza para sincronizar los archivos desde sus fuentes.
`upgrade` se usa para instalar las versiones más recientes de todos los paquetes actualmente instalados en el sistema desde las fuentes enumeradas en `/etc/apt/sources.list.` Los paquetes actualmente instalados con nuevas versiones disponibles se recuperan y actualizan; bajo ninguna circunstancia se eliminan los paquetes instalados, o se recuperan e instalan los paquetes que aún no están instalados. Las nuevas versiones de los paquetes actualmente instalados que no se pueden actualizar sin cambiar el estado de instalación de otro paquete se mantendrán en su versión actual.
`full-upgrade` (`apt`) y `dist-upgrade` (`apt-get`), además de realizar la función de actualización, también maneja de manera inteligente las dependencias cambiantes con nuevas versiones de paquetes; apt y apt-get tienen un sistema de resolución de conflictos inteligente e intentarán actualizar los paquetes más importantes a expensas de los menos importantes si es necesario. El archivo /etc/apt/sources.list contiene una lista de ubicaciones desde las que recuperar los archivos de paquetes deseados. aptitude tiene una función de actualización de dist-upgrade más inteligente llamada full-upgrade.

