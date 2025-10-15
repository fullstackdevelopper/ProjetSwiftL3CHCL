import Foundation;
var choix_menu_principal:Int = 0
var nb_etudiant:Int = 0

var dictionnaire_etudiants:[String:Any]=[:]

func AjouterEtudiant(){
	var condition = true
	while(condition == true){
		var nom:String = ""
		while(nom == ""){
			print("\nSaisir le nom de l'etudiant : ", terminator :"")
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
		var rep: Int = -1
		while rep != 0 && rep != 1{
			print("Voulez vous enregistrer un autre etudiant ?(1 pour dire oui et 0 pour dire non) : ", terminator:"")
			if let saisi = readLine(), let saisi_Int = Int(saisi){
				rep = saisi_Int
				if(rep != 0) && (rep != 1){
					print("\nErreur : Vous pouvez saisir soit 0, soit 1\n")
                    } else {
                        condition = false;
                        if rep == 1 {
                            AjouterEtudiant()
                         }//else {
                        //     gestion_des_taches()
                        // }
                    }
			}
		}
	}
}

func ListerEtudiant(){
    for(cle, etudiant) in dictionnaire_etudiants{
		if let etud = etudiant as? [String:Any],
			let nom = etud["nom"],
			let prenom = etud["prenom"],
			let age = etud["age"],
			let niveau = etud["niveau"]{
			print("\(cle) : \(prenom)  \(nom) - \(age) ans - Niveau : \(niveau)")
	}
    }
    
}
func CalculMoyenne() -> Double{
    var note: Double = 0
    var quantite_note_saisi = 0
    var moyenne: Double = 0
    var nom_matiere: String = ""
    while(nom_matiere == ""){
        print("\nSaisir le nom de la matiere : ", terminator:"")
        if let saisi = readLine(){
            nom_matiere = saisi
        }
        print("\nNous alons a present vous inviter a saisir les notes de \(nom_matiere) pour chaque etudiant.\n")
        for(cle, etudiant) in dictionnaire_etudiants{
		if let etud = etudiant as? [String:Any],
            let nom = etud["nom"],
			let prenom = etud["prenom"]{
                    print("id : \(cle) \nNom : \(nom)\nPrenom: \(prenom) \nNote : ", terminator:"")
                if let saisi = readLine(), let saisiDouble = Double(saisi){
                    note = note + saisiDouble
                    quantite_note_saisi = quantite_note_saisi + 1
                }
                moyenne = note / Double(quantite_note_saisi)
                print(moyenne)
                
            }
            

        }
        
        
    }
    return moyenne
}



AjouterEtudiant()
ListerEtudiant()
var moyenne = CalculMoyenne()

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

//Gestion de l'economat
var descriptions: [String] = []
var montants: [Double] = []
//var dates: [String] = []


func AjouterTransaction() {
    var montant: Double = 0

    while true {
        print("\n\nEntrez le type de transaction")
        print("1-Paiement scolaire")
        print("2-Depense")
        print("3-Entree d'argent")
        print("0-Quitter")
        
        print("Votre choix : ",terminator: "")
        
        if let input = readLine(), let choix = Int(input){

            switch choix {
            case 1:
                print("\nEntrez l'ID de l'etudiant :",terminator: "")
                guard let identifiant = readLine(), let id = Int(identifiant), etudiants[id] != nil else {
                    print("Etudiant introuvable!\n")
                    continue
                }
                print("Entrez le montant du paiement :",terminator: "")
                guard let Montant = readLine(), let m = Double(Montant) else {
                    print("Montant invalide!")
                    continue
                }
                print("\nPaiement effectue !")
                
                montant = m
                let desc = "Paiement scolaire de \(etudiants[id]!)"
                descriptions.append(desc)
                montants.append(montant)
                
            case 2:
                print("\nEntrez la description de la depense : ", terminator: "")
                guard let desc = readLine(), !desc.trimmingCharacters(in: .whitespaces).isEmpty else {
                    print("Description invalide (champ vide) !")
                    continue
                }
                
                print("Entrez le montant de la depense : ",terminator: "")
                guard let mont = readLine(), let m = Double(mont) else {
                    print("Montant invalide!")
                    continue
                }
                montant = -abs(m)
                montants.append(montant)
                descriptions.append(desc)

            case 3:
                print("\nEntrez la description de l'entree d'argent : ", terminator: "")
                guard let desc = readLine(), !desc.trimmingCharacters(in: .whitespaces).isEmpty else {
                    print("Description invalide (champ vide) !")
                    continue
                }

                print("Entrez le montant : ",terminator: "")
                guard let mon = readLine(), let m = Double(mon) else {
                    print("Montant invalide!")
                    continue
                }
                montant = abs(m)
                montants.append(montant)
                descriptions.append(desc)

            case 0:
                return
                
            default:
                print("Choix invalide")
                return
            }

            //dates.append("10/10/2025")
            print("Transaction ajoutee avec succes!")
        }
        else {
                print("Entree invalide ! Veuillez entrer un nombre entier.")
            }
    }
}

func listerTransactions() {
    if descriptions.isEmpty {
        print("Aucune transaction disponible.")
        return
    }
    
    print("\nListe des transactions :")
    for i in 0..<descriptions.count {
        print("\(i + 1)-Description : \(descriptions[i]) | Montant : \(montants[i]) HTG")
    }
}

func calculerSolde() {
    var total: Double = 0 
    for montant in montants {
        total += montant
    }
    print("Le solde actuel est : \(total) HTG")
}
