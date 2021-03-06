//
//  ChansonCell.swift
//  Lecteur Youtube
//
//  Created by Ecole NaN on 11/10/2018.
//  Copyright © 2018 Ecole NaN. All rights reserved.
//

import UIKit

class ChansonCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var labelCell: UILabel!
    
    var chanson: Chanson!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    // Cette fonction créee une cellule pour contenir l'image et le titre et le nom de l'artistre dans le tableau.
    
    func creerCell(_ chanson: Chanson) {
        // l'attribut chanson est de types chansons, Qui est notre classe crée un peu loin.
        
        self.chanson = chanson
        telechargerImage() 
        
        let attributed = NSMutableAttributedString(string: self.chanson.titre, attributes: [.font: UIFont.boldSystemFont(ofSize: 20), .foregroundColor: UIColor.black])
        let secondeLigne = NSMutableAttributedString(string: "\n" + self.chanson.artiste, attributes: [.font: UIFont.italicSystemFont(ofSize: 20), .foregroundColor: UIColor.darkGray])
        attributed.append(secondeLigne)
        labelCell.attributedText = attributed  
    }
    
    func telechargerImage() {
        imageCell.image = #imageLiteral(resourceName: "073 logo")
        
        if let url = URL(string: self.chanson.miniatureUrl){
            
            // URLSession.shared : veut dire qu'on crée une variable url qui va chercher des url sue internet
            
            let session = URLSession.shared
            let task = session.dataTask(with: url, completionHandler: { (data, reponse, errer) in
                if let imageData = data, let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.imageCell.image = image
                    }
                }
            })
        
        task.resume()
            
        }
    }
}












