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
* d: Pour supprimer certains fichiers produits par l'Autosh ainsi qu'un `make fclean`
* p: Pour modifier certaines options
* q: Pour quitter le Autosh

> Pour l'option *o* chaque Autosh ont leurs facon de l'utiliser, veuillez vous referer a l'Autosh que vous avez choisi pour en savoir plus dessus

### Pour tester ft_printf [*(autoft_printf)*][autoft_printf]
Dans l'option *o* vous pouvez creer vos propres tests et les sauvegarder  

#### Utilisation de l'option *o*
Pour creer un test et le sauvegarder suivez les instructions suivantes:

1. `Do you want to create a test ? --- actual y: for yes` Appuyer sur *y*
2. Ensuite vous aurez: `Enter argument for ft_printf or 'q' for quit and 'return' for execute:`  
Vous pouvez ecrire votre test (ex: `"test %d: %10s -> %4d", 1, "Salut", 42`) puis appuyer sur entrer pour valider
3. Vous pouvez relancer autant de test que vous desirez et pour quitter appuyer sur *q* puis entrer

> Lors de la creation de test vous ne pourez pas mettre de *\n* mais il y en a automatiquement un qui s'ajoute a chaque fin de vos tests

#### Ameliorations

##### Disponible *(ajouter)*
*Aucune amelioration pour le moment*

##### Indisponible *(en cours ou prochainement)*
* Chaque nouveau test creerons un nouveau dossier avec:  
    * Un fichier.c pour le printf
    * Un fichier.c pour le ft_printf
    * Un fichier.txt pour la sortie du printf
    * Un fichier.txt pour la sortie du ft_printf
    * Un executable pour le printf
    * Un executable pour le ft_printf
    * Un fichier.txt de sortie de la fonction `diff fichier1 fichier 2`  
Cela permetra les comparaisons automatiques des sorties standards
* Triage des tests par types en dossier  
vous pourez donc choisir dans quel dossier creer votre test, de le retrouver plus facilement et pouvoir faire les tests d'un type specifique uniquement  
ex: *type_d/* Tout les tests pour le *%d*

### Pour tester fdf [*(autofdf)*][autofdf]
L'option *o* vous permet de comparer et lancer automatiquement des maps de tests avec le fdf de demonstration  
(pour passer au test suivant vous devez fermer le votre fdf)  
*(ne pas oublier de fermer celui de demonstration avant au risque de compiler plusieurs fenetres)*

### Pour tester ft_ls [*(autoft_ls)*][autoft_ls]
*Incomplet*

### Pour tester get_next_line [*(autoget_next_line)*][autoget_next_line]
Ancien Autosh, ne dispose pas de git clone ni de menu  
*Incomplet*

Contributions sur les Autosh
----------------------------
Les prochaines versions des Autosh serons plus apte pour ajouter du code par d'autre fichier et des fonctions  
*Incomplet*

Creer un Autosh [*(autoref.sh)*][autoref]
---------------
*Incomplet*

[autoft_printf]: https://github.com/clegrand/autosh/tree/master/t_ft_printf "Lien vers le fichier autoft_printf.sh"
[autofdf]: https://github.com/clegrand/autosh/tree/master/t_fdf "Lien vers le fichier autofdf.sh"
[autoft_ls]: https://github.com/clegrand/autosh/tree/master/t_ft_ls "Lien vers le fichier autoft_ls.sh"
[autoget_next_line]: https://github.com/clegrand/autosh/tree/master/t_get_next_line "Lien vers le fichier autoget_next_line.sh"
[autoref]: https://github.com/clegrand/autosh "Lien vers le fichier Autosh de reference"
