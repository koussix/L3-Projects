## GESTION VOLS ET COMPAGNIES : 

# Fichiers présents : 
1. Gestion_Vols_compagnies.sql : ensemble des requetes de créations de tables, d'insertions de tuples, de création de vues, à importé directement en tant qu'utilisateur root.
2. EntitéAssociation.png : Le diagramme entité association représentant notre bdd. 
    > Pour note : un exemple de sens de cardinalitées est donnée comme suit :
    > Entre Client et Bagages :
    > 1- Un client posséde 0 ou plusieurs bagages,
    > 2- Un bagage est possédé par un et un seul client.
    > (Migration de l'identifiant du client vers ses bagages)
3. Requetes_vues_droits.sql : Requêtes d’interrogation de la base de donnée, la création des vues, et la création des utilisateur, et l’attribution des droits sur la base de donnée. Ce fichier contient aussi des requêtes d’interrogation créées à partir de l’utilisation de vues. (un scénario est décrit dans le fichier et dans le rapport).