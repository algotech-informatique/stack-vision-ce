## Vision Stack Community Edition

## PréRequis
| Environnement | Description           |
| ------ | --------------------- |
| **SYSTEM**  | RAM : 4 Go min  |
|             | OS: Ubuntu Server 18.04/20.04 LTS |
|             | Plateform: Docker CE 19.03 ou supp |
|             | Software: curl jq |
| **CLIENT**  | Navigateur : Basé sur Chromium |

## Installation de la BASE
### Docker
Docker Community Edition (Docker CE)
L'installation de Docker-Ce (v19.03 ou supérieure) est nécessaire pour lancer la plateforme vision.
Suivre la procédure d'installation [**suivante**](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
### Dependencies
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
#cat /etc/hosts
127.0.0.1 localhost vision-localhost
```

#### Démarrage de la stack
```
$docker compose up
```
#### Init (la première fois)
```
$./init/stack-vision
```
##### note
Les identifiants de connection par défaut de la plateforme sont:
 
 * utilisateur : vision-sadmin-user 
 * mot de passe: vision-sadmin-password

Pour les modifier veuillez éditer le fichier (./init/stack-vision) et modifier les variables (VISION_SADMIN_USER et VISION_SADMIN_PASSWORD) avant de lancer le script
#### Navigation

Le studio de la plateforme est disponible http://vision-localhost/studio

Le player de vos applications est disponible http://vision-localhost/player
