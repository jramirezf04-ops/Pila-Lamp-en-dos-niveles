# Pila-Lamp-en-dos-niveles

## 1. Introducción y Arquitectura (CC1)
El objetivo de esta práctica es desplegar una aplicación web separando la infraestructura en dos niveles para mejorar la seguridad.

*   **Servidor Web (Apache/PHP):** Tiene salida a Internet mediante NAT para descargar paquetes y está expuesto al anfitrión mediante reenvío de puertos (8080 -> 80).
*   **Servidor de Base de Datos (MariaDB):** Completamente aislado de Internet. Solo se comunica con el servidor web a través de una red interna privada.
