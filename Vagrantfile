Vagrant.configure("2") do |config|
  # Box base para ambas máquinas: Debian 12
  config.vm.box = "debian/bookworm64"


  # MÁQUINA 1: SERVIDOR WEB (APACHE + PHP)

  config.vm.define "web" do |web|
    web.vm.hostname = "JavierApache"
    
    # Interfaz 1: NAT (Vagrant la crea por defecto, da salida a Internet)
    
    # Interfaz 2: Red interna para comunicarse con la base de datos
    web.vm.network "private_network", ip: "192.168.50.10", virtualbox__intnet: "red_backend"
    
    # Reenvío de puertos: Acceso a la web desde tu PC por el puerto 8080
    web.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
    
    # Aprovisionamiento del servidor Web
    web.vm.provision "shell", path: "instalar_web.sh"
  end

  # MÁQUINA 2: SERVIDOR DE BASE DE DATOS (MYSQL)

  config.vm.define "db" do |db|
    db.vm.hostname = "JavierMysql"
    
    # Interfaz 2: Red interna conectada al mismo "switch" virtual que el servidor web
    db.vm.network "private_network", ip: "192.168.50.20", virtualbox__intnet: "red_backend"
    
    # Aprovisionamiento de la Base de Datos
    db.vm.provision "shell", path: "instalar_db.sh"
  end
end