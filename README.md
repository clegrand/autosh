**NOTICE POUR LES AUTOSH** *(fr)*
=================================
Utilisation generale des Autosh
---------------------------
Pour lancer un Autosh sur votre projet:

1. Vous devez vous assurer d'utiliser le Autosh correspondant  
2. D'indiquer en premier argument l'emplacement de votre dossier:  
`sh autotest.sh le_dossier_de_mon_projet` (pour verifier un dossier local) ou  
`sh autotest.sh xlogin` (pour recuperer le dossier git du xlogin choisi)  

> La derniere commande (`sh autotest.sh xlogin`) ne fonctionne que sur les dernier Autosh

une fois dans le Autosh choisi, vous pouvez:  

* f: Pour voir les fichiers dans le dossier
* n: Pour verifier la norme
* m: Pour faire un `make re` du projet
* o: Pour tester le projet
* d: Pour supprimer certains fichier produit par l'Autosh ainsi qu'un `make fclean`
* p: Pour modifier certaines options
* q: Pour quitter le Autosh

> Pour l'option *o* chaque Autosh ont leurs facon de l'utiliser, veuillez vous referer a l'Autosh que vous avez choisi pour en savoir plus dessus

###Pour tester ft_printf [*(autoft_printf)*][autoft_printf]
Dans l'option *o* vous pouvez creer vos propres tests et les sauvegarder

Contributions sur les Autosh
----------------------------

Creer un Autosh [*(autoref.sh)*][autoref]
---------------

*Incomplet*

[autoft_printf]: https://github.com/clegrand/autosh "Lien vers le fichier autoft_printf.sh"
[autoref]: https://github.com/clegrand/autosh "Lien vers le fichier Autosh de reference"
