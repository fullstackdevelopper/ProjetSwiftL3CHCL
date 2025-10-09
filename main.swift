import Foundation;
var choix_menu_principal:Int = 0;

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


func gestion_des_taches(){
    while (choix_menu_principal == 0 || choix_menu_principal < 0 || choix_menu_principal > 3 ){
        choix_menu_principal = menu_principal()
        if(choix_menu_principal == 0 || choix_menu_principal < 0 || choix_menu_principal > 3){
            print("\n\nVous pouvez choisir un nombre allant de 1 a 3 selon le menu suivant\n")
        }
    }
}

gestion_des_taches()