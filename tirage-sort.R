# Petit programme pour tirer au sort les groupes qui passeront en semaine 9



# 00 - Chargement de la base et des packages ------------------------------
library(readxl)
groupes = read_xlsx('C:/Users/yann1/Downloads/Groupes Projet Econométrie.xlsx')
View(groupes)

# 01 - Paramètres à définir -----------------------------------------------

# Fonction de tirage au sort:
groupe_présentation = function(liste_groupes,nb_a_trouver){
  sample(liste_groupes,nb_a_trouver,replace=F)
} 


# Paramètres pour la fonction : 
nb = 3 # Il manque trois groupes

# Liste des groupes préférant la S10:
liste_potentielle = groupes$`Groupe n°`[groupes$`Semaine 9`!="préferée" | is.na(groupes$`Semaine 9`)] 

# Exécution de la fonction : 
set.seed(68109) # Graîne d'aléatoire pour retrouver nos résultats
groupes_select = groupe_présentation(liste_groupes = liste_potentielle, # Fonction !
                    nb_a_trouver = nb)


cat("Séance 9, groupes supplémentaires :",
    paste0("Groupe ",sort(groupes_select)," - ",
           groupes$`Noms et Prénoms des Etudiants du groupe (Groupes de 2 ou 3)`[groupes$`Groupe n°`%in%sort(groupes_select)]), 
    sep="\n")



# Tirage au sort de l'ordre de passage ------------------------------------

# Séance 9:
liste_9 = c(groupes$`Groupe n°`[groupes$`Semaine 9`=="préferée" & !is.na(groupes$`Semaine 9`)],
            groupes_select)

set.seed(68109) # Graîne d'aléatoire pour retrouver nos résultats
ordre_seance_9 = groupe_présentation(liste_groupes = liste_9, # Fonction !
                                     nb_a_trouver = length(liste_9))

cat("Séance 9, ordre de passage :",
    paste0("Groupe ",ordre_seance_9," - ",
           groupes[ordre_seance_9,]$`Noms et Prénoms des Etudiants du groupe (Groupes de 2 ou 3)`), 
    sep="\n")



# Séance 10:
liste_10 = groupes$`Groupe n°`[!(groupes$`Groupe n°`%in%liste_9)]

set.seed(68109) # Graîne d'aléatoire pour retrouver nos résultats
ordre_seance_10 = groupe_présentation(liste_groupes = liste_10, # Fonction !
                                     nb_a_trouver = length(liste_10))

cat("Séance 10, ordre de passage :",
    paste0("Groupe ",ordre_seance_10," - ",
           groupes[ordre_seance_10,]$`Noms et Prénoms des Etudiants du groupe (Groupes de 2 ou 3)`), 
    sep="\n")


# Ordre de passage pour q/r en séance 8:


ordre = groupe_présentation(liste_groupes = seq(1:11), # Fonction !
                    nb_a_trouver = 11)


cat("Aujourd'hui, ordre de passage :",
    paste0("Groupe ",ordre," - ",
           groupes[ordre,]$`Noms et Prénoms des Etudiants du groupe (Groupes de 2 ou 3)`), 
    sep="\n")
