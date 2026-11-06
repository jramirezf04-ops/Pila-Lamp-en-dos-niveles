# Pila-Lamp-en-dos-niveles

## 1. Introducción y Arquitectura (CC1)
El objetivo de esta práctica es desplegar una aplicación web separando la infraestructura en dos niveles para mejorar la seguridad.

*   **Servidor Web (Apache/PHP):** Tiene salida a Internet mediante NAT para descargar paquetes y está expuesto al anfitrión mediante reenvío de puertos (8080 -> 80).
*   **Servidor de Base de Datos (MariaDB):** Completamente aislado de Internet. Solo se comunica con el servidor web a través de una red interna privada.

### Esquema de red
* **1. Tu PC (Anfitrión):** Accede a la aplicación desde el navegador a través de `localhost:8080`.
* **2. Servidor Web (IP 192.168.50.10):** Recibe tu petición y se comunica por una red privada con la base de datos.
* **3. Servidor de Base de Datos (IP 192.168.50.20):** Almacena la información. Está totalmente aislado de Internet por seguridad.


## 2. Demostración de Funcionamiento (CC5)
En el siguiente enlace se puede ver un screencast demostrando el correcto funcionamiento de la aplicación, añadiendo un usuario que se guarda en la base de datos aislada:
**https://drive.google.com/file/d/1QGe3ys1O0aHaB-FDurGEURpmQoJcXLLx/view?usp=sharing**

### Capturas del entorno corriendo:
![Terminal Vagrant](images/terminal.png)
![Aplicación Web](images/app.png)
