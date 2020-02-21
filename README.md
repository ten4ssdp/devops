# Devops & Install repo

### Description

This repo is the devops and the entrypoint for the SSDP project.

### Guide d'installation du projet

- Cloner le repo `git clone git@github.com:ten4ssdp/devops.git ssdp`
- Dupliquer le fichier `.env.example` et le renommer en `.env` et remplir les variables d'environnements du fichier.
- Lancer le script `./install.sh`

### Informations complémentaires

[Cliquez-ici pour accéder au Notion du projet](https://www.notion.so/Groupe-10-657ad39759404d0ea9f6217de1690b5e)

### Collaborateurs sur la partie DevOps

* [Kevin MANSSAT](https://github.com/Rayzors)
* [Paartheepan RAVEENTHIRAN](https://github.com/punkte)

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

Définir les variables suivantes dans les [group_vars](./ansible/inventory/group_vars/all)
```
site_project_name
site_api_port
site_front_port
site_db_port
site_db_name
site_db_username
site_db_password
site_jwtsecret
site_api_base_url       # IP de l'instance lancée 
```
 

Puis lancer la commande 
```bash
$ ansible-playbook -i ./inventory/hosts deploy.yml --ask-vault-pass
```

### Roles

* Docker => Installe docker sur le server
* Pip => Installe python sur le server
* Sites => Installe les modules python docker , docker-compose sur le server puis lance les containers


