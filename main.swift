import Foundation;
var choix_menu_principal:Int = 0
var nb_etudiant:Int = 0

var dictionnaire_etudiants:[String:Any]=[:]

func AjouterEtudiant(){
	var nom:String = ""
	while(nom == ""){
		print("Saisir le nom de l'etudiant : ", terminator :"")
		if let saisi_nom = readLine(){
			nom = saisi_nom
			if(nom == ""){
				print("\nErreur : Le nom ne peut pas etre vide\n")
			}
		}
	}

	var prenom:String = ""
	while(prenom == ""){
		print("Saisir le prenom de l'etudiant : ", terminator:"")
		if let saisi_prenom = readLine(){
			prenom = saisi_prenom
			if(prenom == ""){
				print("\nErreur : Le prenom ne peut pas etre vide \n")
			}
		}
	}
	var age:Int = 0
	while(age == 0 || age < 0){
		print("Saisir l'age de l'etudiant : ", terminator:"")
		if let saisi_age = readLine(){
			if let saisi_age_Int = Int(saisi_age){
				age = saisi_age_Int
				if (age<0){
					print("\nErreur : L'age ne peut pas etre inferieur a 0\n")
				}
			}else{
				print("\nErreur: Saisi invalide !\n")
			}
		}
	}

	var niveau:Int = 0
	while(niveau == 0 || niveau < 0){
		print("Saisir le niveau de l'etudiant : ", terminator:"")
		if let saisi_niveau = readLine(){
			if let saisi_niveau_Int = Int(saisi_niveau){
				niveau = saisi_niveau_Int
				if(niveau < 0){
					print("\nErreur : Le niveau ne peut pas etre inferieur a 0.\n")
				}
			}else{
				print("\nErreur: Saisi invalide !\n")
				}
		}
	}
	nb_etudiant = nb_etudiant+1
	let etudiant:[String:Any] = [
		"id" : nb_etudiant,
		"nom" : nom,
		"prenom" : prenom,
		"age" : age,
		"niveau" : niveau
	]
	
	dictionnaire_etudiants[String(nb_etudiant)] = etudiant
	print(dictionnaire_etudiants)

}

AjouterEtudiant()

/*
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
*/
