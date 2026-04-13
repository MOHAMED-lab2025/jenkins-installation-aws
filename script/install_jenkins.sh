#!/bin/bash

# Mise à jour du système
echo "Mise à jour du système..."
sudo yum update -y

# Installation de Java (requis pour Jenkins)
echo "Installation de Java..."
sudo yum install -y java-17-amazon-corretto

# Ajouter le repo Jenkins
echo "Ajout du repository Jenkins..."
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Importer la clé Jenkins
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Installer Jenkins
echo "Installation de Jenkins..."
sudo yum install -y jenkins

# Démarrer Jenkins
echo "Démarrage du service Jenkins..."
sudo systemctl start jenkins

# Activer Jenkins au démarrage
sudo systemctl enable jenkins

# Vérifier le statut
echo "Statut de Jenkins :"
sudo systemctl status jenkins

# Afficher le mot de passe initial
echo "Mot de passe initial Jenkins :"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword