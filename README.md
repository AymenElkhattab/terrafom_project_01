# Déploiement EC2 Ubuntu 24.04 avec Terraform + GitHub Actions

## Structure du projet

```
.
├── .github/
│   └── workflows/
│       └── deploy.yml et destroy.yml        # Pipeline GitHub Actions
└── terraform/
    ├── main.tf               # Ressources AWS (EC2, Security Group, AMI)
    ├── variables.tf          # Variables configurables
    └── outputs.tf            # Sorties (IP, DNS, commande SSH)



```

---

## Prérequis

- Un compte AWS avec les droits EC2
- La clé **vockey** existante dans AWS (us-east-1)
- Un dépôt GitHub

---

## Configuration des Secrets GitHub

Dans ton dépôt GitHub → **Settings** → **Secrets and variables** → **Actions**, ajoute ces 3 secrets :

| Nom du secret          | Valeur                        |
|------------------------|-------------------------------|
| `AWS_ACCESS_KEY_ID`    | Ton `aws_access_key_id`       |
| `AWS_SECRET_ACCESS_KEY`| Ton `aws_secret_access_key`   |
| `AWS_SESSION_TOKEN`    | Ton `aws_session_token`       |

> ⚠️ Ne jamais mettre les credentials directement dans le code !

---

## Déploiement

### Automatique
Le pipeline se déclenche automatiquement à chaque `push` sur la branche `main`.

### Manuel
Dans GitHub → **Actions** → **Deploy AWS EC2 with Terraform** → **Run workflow**

---

## Ressources créées

- **Instance EC2** : Ubuntu 24.04 LTS, t2.large, IP publique
- **Security Group** : Ports 22, 80, 443 ouverts + tout le trafic entrant/sortant
- **Clé SSH** : vockey (doit exister dans AWS)
- **Volume** : 20 Go gp3

---

## Se connecter à la VM après déploiement

```bash
ssh -i ~/.ssh/vockey.pem ubuntu@<PUBLIC_IP>
```

L'IP publique est affichée dans les outputs du pipeline GitHub Actions.

---

## Personnalisation (variables.tf)

| Variable          | Défaut            | Description                    |
|-------------------|-------------------|--------------------------------|
| `aws_region`      | `us-east-1`       | Région AWS                     |
| `instance_type`   | `t2.large`        | Type d'instance                |
| `instance_name`   | `ubuntu-24-04-vm` | Nom de l'instance              |
| `key_name`        | `vockey`          | Nom de la key pair AWS         |
| `root_volume_size`| `20`              | Taille disque (Go)             |

---

## Détruire l'infrastructure

Pour éviter des frais, exécute en local :

```bash
cd terraform
terraform destroy
```
