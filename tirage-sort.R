# Petit programme pour tirer au sort les groupes qui passeront en semaine 9



# 00 - Chargement de la base et des packages ------------------------------
library(readxl)
groupes = read_xlsx('C:/Users/yann1/Downloads/Groupes Projet Econom�trie.xlsx')
View(groupes)

# 01 - Param�tres � d�finir -----------------------------------------------

# Fonction de tirage au sort:
groupe_pr�sentation = function(liste_groupes,nb_a_trouver){
  sample(liste_groupes,nb_a_trouver,replace=F)
} 


# Param�tres pour la fonction : 
nb = 2 # Il manque trois groupes

# Liste des groupes pr�f�rant la S10:
liste_potentielle = groupes$`Groupe n�`[groupes$`Semaine 9`!="pr�fer�e" | is.na(groupes$`Semaine 9`)] 

# Ex�cution de la fonction : 
set.seed(82619) # Gra�ne d'al�atoire pour retrouver nos r�sultats
groupes_select = groupe_pr�sentation(liste_groupes = liste_potentielle, # Fonction !
                    nb_a_trouver = nb)


cat("S�ance 9, groupes suppl�mentaires :",
    paste0("Groupe ",sort(groupes_select)," - ",
           groupes$`Noms et Pr�noms des Etudiants du groupe (Groupes de 2 ou 3)`[groupes$`Groupe n�`%in%sort(groupes_select)]), 
    sep="\n")



# Tirage au sort de l'ordre de passage ------------------------------------

# S�ance 9:
liste_9 = c(groupes$`Groupe n�`[groupes$`Semaine 9`=="pr�fer�e" & !is.na(groupes$`Semaine 9`)],
            groupes_select)

set.seed(82619) # Gra�ne d'al�atoire pour retrouver nos r�sultats
ordre_seance_9 = groupe_pr�sentation(liste_groupes = liste_9, # Fonction !
                                     nb_a_trouver = length(liste_9))

cat("S�ance 9, ordre de passage :",
    paste0("Groupe ",ordre_seance_9," - ",
           groupes[ordre_seance_9,]$`Noms et Pr�noms des Etudiants du groupe (Groupes de 2 ou 3)`), 
    sep="\n")



# S�ance 10:
liste_10 = groupes$`Groupe n�`[!(groupes$`Groupe n�`%in%liste_9)]

set.seed(82619) # Gra�ne d'al�atoire pour retrouver nos r�sultats
ordre_seance_10 = groupe_pr�sentation(liste_groupes = liste_10, # Fonction !
                                     nb_a_trouver = length(liste_10))

cat("S�ance 10, ordre de passage :",
    paste0("Groupe ",ordre_seance_10," - ",
           groupes[ordre_seance_10,]$`Noms et Pr�noms des Etudiants du groupe (Groupes de 2 ou 3)`), 
    sep="\n")


# Ordre de passage pour q/r en s�ance 8:


ordre = groupe_pr�sentation(liste_groupes = seq(1:11), # Fonction !
                    nb_a_trouver = 11)


cat("Aujourd'hui, ordre de passage :",
    paste0("Groupe ",ordre," - ",
           groupes[ordre,]$`Noms et Pr�noms des Etudiants du groupe (Groupes de 2 ou 3)`), 
    sep="\n")
