import Foundation;
var choix_menu_principal:Int = 0;

//Menu principal
func menu_principal() -> Int{
    var choix:Int = 0
        print("1. Gestion des etudiants")
        print("2. Gestion de l'economat")
        print("3. Quitter l'application")
        
        print("Faites votre choix : ")

        if let input:String = readLine(), let nombre:Int = (Int)(input){
            choix = nombre
    }
    return choix
}

//Menu de gestion des etudiants
func MenuGestionEtudiant() {
    while true{
        print("1-ajouter un etudiant")
        print("2-Lister tous les etudiants")
        print("3-Calculer la moyenne des notes par matiere")
        print("4-Retour au menu principal")
        print("Votre choix : ")

        if let input = readLine(), let choix = Int(input){

            switch choix {
            case 1:
                AjouterEtudiant()
            case 2:
                ListerEtudiant()
            case 3:
                CalculMoyenne()
            case 4:
                return
            default:
                print("nombre invalide ! Choisissez un chiffre entre 1 et 4")
            }
        }
        else {
                print("Entree invalide ! Veuillez entrer un nombre entier.")
            }
        }
}

//Menu de gestion de l'economat
func MenuGestionEconomat() {
    while true{
        print("1-Ajouter une transaction financiere")
        print("2-Lister toutes les transactions")
        print("3-Calculer le solde actuel")
        print("4-Retour au menu principal")
        print("Votre choix : ",terminator: "")

        if let input = readLine(), let choix = Int(input){

            switch choix {
            case 1:
                AjouterTransaction()
            case 2:
                listerTransactions()
            case 3:
                calculerSolde()
            case 4:
                return
            default:
                print("nombre invalide ! Choisissez un chiffre entre 1 et 4")
            }
        }
        else {
                print("Entree invalide ! Veuillez entrer un nombre entier.")
            }
    }
}

//Fonction principale
func gestion_des_taches(){
    while (choix_menu_principal == 0 || choix_menu_principal < 0 || choix_menu_principal > 3 ){
        choix_menu_principal = menu_principal()
        if(choix_menu_principal == 0 || choix_menu_principal < 0 || choix_menu_principal > 3){
            print("\nVous pouvez choisir un nombre allant de 1 a 3 selon le menu suivant\n")
        }
    }
    switch choix_menu_principal {
    case 1:
        MenuGestionEtudiant()
    case 2:
        MenuGestionEconomat()
    case 3:
        return
    default:
        print("Erreur : Saisi incorrecte")
        return
    }
}

gestion_des_taches()


