# Devops & Install repo

### Description

This repo is the devops and the entrypoint for the SSDP project.

### Guide d'installation

- Cloner le repo `git clone git@github.com:ten4ssdp/devops.git ssdp`
- Dupliquer le fichier `.env.example` et le renommer en `.env` et remplir les variables d'environnements du fichier.
- Lancer le script `./install.sh`

### Lancer une instance

La plateforme utilisée pour lancer une instance est celle d'Amazon AWS.  
Pour lancer une instance avec Terraform il faut :
* Avoir le CLI Terraform d'installé
* Avoir un compte AWS
* Ajouter un groupe dans l'onglet Gestion des identités et des accès (IAM)
  * IAM > Groupe > Créer un groupe
  * Définir la stratégie attachée à AmazonEC2FullAccess
* Ajouter un utilisateur au groupe crée
  * IAM > Users > Créer un utilisateur
  * Puis l'assigner au groupe crée
  * Récupérer l'ID de clé d'accès et la clé d'accès secrète

#### Définir les variables récupérées à l'étape précédente 

```bash
$ export AWS_ACCESS_KEY_ID="l'id de clé d'accès ici"
$ export AWS_SECRET_ACCESS_KEY="la clé d'accès"
```

#### Initialiser Terraform

```bash
$ terraform init
```
#### Vérifier les actions qui vont être effectuées

```bash
$ terraform plan
```
#### Lancer l'instance
```bash
$ terraform apply
```

Par défaut l'instance est créée dans la zone `eu-west-3` (Paris)

* Récuperer l'IP de l'instance dans l'onglet EC2 > Instances 

Ajouter l'IP dans le groupe [web] d'ansible dans le fichier [hosts](./ansible/inventory/hosts)

### Lancer le playbook ansible sur l'instance créée

...
