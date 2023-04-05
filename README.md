## Vision Stack Community Edition

## PréRequis
| Environnement | Description           |
| ------ | --------------------- |
| **SYSTEM**  | RAM : 4 Go min  |
|             | OS: Ubuntu Server 18.04/20.04 LTS |
<<<<<<< HEAD
|             | Plateform: Docker CE 19.03 ou supp |
|             | Software: curl jq |
=======
|             | Plateforme: Docker CE 19.03 ou supp |
|             | Dépendances: curl jq |
>>>>>>> a0ffcb8... First Version
| **CLIENT**  | Navigateur : Basé sur Chromium |

## Installation de la BASE
### Docker
Docker Community Edition (Docker CE)
L'installation de Docker-Ce (v19.03 ou supérieure) est nécessaire pour lancer la plateforme vision.
Suivre la procédure d'installation [**suivante**](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
<<<<<<< HEAD
### Dependencies
=======
### Dépendances
>>>>>>> a0ffcb8... First Version
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
<<<<<<< HEAD

```
#cat /etc/hosts
=======
```
#nano /etc/hosts
>>>>>>> a0ffcb8... First Version
127.0.0.1 localhost vision-localhost
```

#### Démarrage de la stack
```
<<<<<<< HEAD
$docker compose up
```
#### Init (la première fois)
```
$./init/stack-vision
=======
~$cd stack-vision-ce
stack-vision-ce$docker compose up
```


#### Init (la première fois)
Vérifiez que la stack a totalement démarré en allant sur :
http://vision-localhost/studio

Vous devriez avoir cette page:
![stack-ready-to-init](./init/stack-init-ready.png)
Vous pouvez maintenant initialiser la plateforme en tapant la commande suivante:

```
stack-vision-ce$./init/stack-vision
>>>>>>> a0ffcb8... First Version
```
##### note
Les identifiants de connection par défaut de la plateforme sont:
 
 * utilisateur : vision-sadmin-user 
 * mot de passe: vision-sadmin-password

Pour les modifier veuillez éditer le fichier (./init/stack-vision) et modifier les variables (VISION_SADMIN_USER et VISION_SADMIN_PASSWORD) avant de lancer le script
#### Navigation

Le studio de la plateforme est disponible http://vision-localhost/studio

Le player de vos applications est disponible http://vision-localhost/player
