//
//  TableauController.swift
//  Lecteur Youtube
//
//  Created by Ecole NaN on 11/10/2018.
//  Copyright © 2018 Ecole NaN. All rights reserved.
//

import UIKit

class TableauController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var chansons = [Chanson]()
    let identifiantCell: String = "ChansonCell"
    let identifiantsegue = "versVideo"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self // pour dire au tableau de se conformer au UITableViewDelegate
        
        tableView.dataSource = self //pour dire au tableau de se conformer au UITableViewDataSource
        ajouterChanson()
        title = "Mes vidéo preferées"
        
    }
    // Ici il s'agit d'un protocole qui définit le nombre de colonne que notre tableau doit avoir
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chansons.count
    }
    // Ici il s'agit d'un autre protocole qui définit le nombre de celulle qu'on pourait avoir appartir de nos colonne
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /* let chanson, cette constant recupère l'indexPath de notre array: c'est a dire qu'il nous permettra a partir de l'indexPath de récupere la chanson qui conrespond a l'indexPath */
        
        let chanson = chansons[indexPath.row]
        
        //let cell = UITableViewCell()
        //cell.textLabel?.text = chanson.titre
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifiantCell) as? ChansonCell {
            cell.creerCell(chanson)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let chanson = chansons[indexPath.row]
        performSegue(withIdentifier: identifiantsegue, sender: chanson)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == identifiantsegue {
            if let nouveauController = segue.destination as? VideoController {
                nouveauController.chanson = sender as? Chanson
            }
        }
    }
    
    
    func ajouterChanson() {
        /* La fonction ajouterChanson(), permet de selectionner nos chansons, prise directement de youtube.
         
        Elle initialise un tableau appeler chansons avec un tableau vide de type Chanson pour s'assurer que le tableau est effectivement vide dès le depart.
         
         Ce qui correspond a notre classe chanson coder un peu en arrière. */
        
        chansons = [Chanson]()
        let cool = Chanson(artiste: "Casseurs Flowters", titre: "Ils sont cools", code: "_DT-4-jJTZc")
        chansons.append(cool)
        let  bien = Chanson(artiste: "Orelsan", titre: "Tout va bien", code: "dq6G2YWoRqA")
        chansons.append(bien)
        let basique = Chanson(artiste: "Orelsan", titre: "Basique", code: "2bjk26RwjyU")
        chansons.append(basique)
        let ronde = Chanson(artiste: "Orelsan", titre: "La terre est ronde", code: "oGdhZyS2ozo")
        chansons.append(ronde)
        let san = Chanson(artiste: "Orelsan", titre: "San", code: "PejyoeG_TmA")
        chansons.append(san)
        let seul = Chanson(artiste: "Orelsan", titre: "Si seul", code: "cz-PLtXh7Lo")
        chansons.append(seul)
        let inacheves = Chanson(artiste: "Casseurs Flowters", titre: "Inachevés", code: "MW1eQZ_PEb4")
        chansons.append(inacheves)
        
        chansons.append(contentsOf: [cool, bien, basique, ronde, san, seul, inacheves])
        
        // Il permet de récharger les données et de mettre a jours les deux protocoles définit un peu plus haut dans le code
        
        tableView.reloadData()
        
    }
    
}




















