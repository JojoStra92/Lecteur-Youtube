//
//  VideoController.swift
//  Lecteur Youtube
//
//  Created by Ecole NaN on 18/10/2018.
//  Copyright © 2018 Ecole NaN. All rights reserved.
//

import UIKit

class VideoController: UIViewController {
    
    var chanson: Chanson?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        if chanson != nil {
            title = chanson!.titre
        }
    }
}
