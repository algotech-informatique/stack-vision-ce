## Vision Stack Community Edition

## PréRequis
| Environnement | Description           |
| ------ | --------------------- |
| **SYSTEM**  | RAM : 4 Go min  |
|             | Os: Ubuntu/Debian |
|             | Plateforme: Docker CE 20 ou supp |
|             | Dépendances: curl jq git|
| **CLIENT**  | Navigateur : Basé sur Chromium |
| **NOTIFICATIONS** |Gestion des notifications par E-mail via un serveur SMTP sécurisé (TLS) + authentification    |
|                   |SMTP_HOST : serveur smtp                 |
|                   |SMTP_PORT : port smtp 587/TLS (+ certificat valide) |
|                   |SMTP_FROM : adresse source (from)        |
|                   |SMTP_USER : l'utilisateur                |
|                   |SMTP_PASS : le mot de passe              |

### Important
A l'exception de l'utilisateur "super-admin", l'ajout de nouveau utilisateur nécéssitera le paramétrage des variables SMTP (cf docker-compose.yml) afin que les notifications par E-mail soient fonctionnelles et qu'il puisse recevoir le lien d'initialisation de leur compte.

## Installation de la BASE
### Docker
Docker Community Edition (Docker CE)
L'installation de Docker-Ce (v20 ou supérieure) est nécessaire pour lancer la plateforme vision.
Suivre la procédure d'installation [**suivante**](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
### Dépendances
```
sudo apt-get install jq curl git
```
## Plateforme Vision
### Récupération de la stack Vision
```
git clone https://github.com/algotech-informatique/stack-vision-ce.git
```
#### Configuration
ajouter 'vision-localhost' dans votre fichier hosts (exemple)
```
sudo nano /etc/hosts

127.0.0.1 localhost vision-localhost
```

#### Démarrage de la stack
```
cd stack-vision-ce && docker compose up

```

#### Initialisation (au premier démarrage)

Dans un autre terminal initialisez la plateforme:

```
cd stack-vision-ce && ./init/stack-vision
Tapez votre Login: my-user-login
Tapez votre Password: mysuperpassword
Tapez votre Prénom: Dark
Tapez votre Nom: Vador
Tapez votre Email: dark-vador@vision-localhost.me
```

#### Navigation

La plateforme vision est disponible http://vision-localhost/

## License

[Mozilla Public License v2.0](https://github.com/algotech-informatique/stack-vision-ce/blob/main/LICENSE)