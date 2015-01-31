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

* F: Pour voir les fichiers dans le dossier
* N: Pour verifier la norme
* M: Pour faire un `make re` du projet
* U: Pour tester le projet (cette option se nomme *o* dans les precedentes version)
* D: Pour supprimer certains fichiers produits par l'Autosh ainsi qu'un `make fclean`
* P: Pour modifier certaines options
* Q: Pour quitter le Autosh

> Pour l'option *U* (*o*) chaque Autosh ont leurs facon de l'utiliser, veuillez vous referer a l'Autosh que vous avez choisi pour en savoir plus dessus

### Pour tester ft_printf [*(autoft_printf)*][autoft_printf]
Dans l'option *U* vous pouvez creer vos propres tests et les sauvegarder  
Dans les parametres *P* vous pouvez (en plus des options de base):

* Modifier les headers a chercher pour la recherche automatique
* Modifier le mode de creation de test:
	* `Normal`: Creer des test et les sauvegardes
	* `Only printf`: Test uniquement le printf de base

#### Utilisation de l'option *U*
Pour creer un test et le sauvegarder suivez les instructions suivantes:

1. Une fois dans l'otpion le message: `Do you want to create a test ? --- actual y: for yes` s'affiche, appuyer sur *y*
2. Ensuite vous aurez: `Enter argument for ft_printf or 'q' for quit and 'return' for execute:`  
Vous pouvez ecrire votre test (ex: `"test %d: %10s -> %4d", 1, "Salut", 42`) puis appuyer sur *return* pour valider
3. Vous pouvez relancer autant de test que vous desirez et pour quitter appuyer sur *q* puis *return*

> Lors de la creation de test vous ne pourez pas mettre de *\n* mais il y en a automatiquement un qui s'ajoute a chaque fin de vos tests

#### Ameliorations

##### Disponible *(ajouter)*
* Recherche automatiquement les header (plus besoins d'aller dans les parametres (*P*) pour modifier leur dossier)  
(par defaut recherche le dossier ou ce trouve *ft_printf.h* et *libft.h*)
* Petite animation d'attente lors du test de la norme (*N*)
* Jauge de reussite et d'echec des tests
* Mode "Only printf" permetant de tester le comportement de printf sans compiler notre projet

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

### Pour tester libft [*(autolibft2)*][autolibft]
Le plus ancien, 1ere version *(comme en piscine)*  
Ne check pas les 5 dernier bonus *(test uniquement `ft_lstnew` dans les bonus)*  

#### Utilisation
Pour l'utiliser entrer en argument le dossier du projet a tester:  
`sh autolibft2.sh link_directory_of_project`  
Vous n'aurez plus qu'a suivre les instructions  
A la fin du programme vous pouvez visualiser quelques fonction ainsi que le Makefile et les bonus  
Une fois fini vous pouvez utiliser les main de test de l'Autosh commencant par `t_`:  
`t_namefuntion arguments ...`

> Si l'Autosh se termine bien, il nettoie les *.o* pour pouvoir naviguer plus facilement

#### Partie 1
La verification est manuel par comparaison par apport a la vrai fonction:  
Vous pouvez directement reperer 2 lignes pour chaque test et verifier si elle son identique  
`Libc: return_of_function` Retour de la fonction de base  
`Out : return_of_function` Retour de la fonction a tester

#### Partie 2
La verification est manuel par deduction  
Dans chaque test vous pouvez voir les parametres des tests pour les fonctions et son resultat  
Verifier la reponse de la fonction

#### Bonus
La verification est automatique  
Vous avez juste a verifier si tout est vert

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
[autolibft]: https://github.com/clegrand/autosh/tree/master/t_libft "Lien vers le fichier autolibft2.sh"
[autoref]: https://github.com/clegrand/autosh "Lien vers le fichier Autosh de reference"
