//
//  CharacterDetailViewController.swift
//  MarvelApp
//
//  Created by Chiller Rafaele on 10/1/23.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterPublicDate: UILabel!
    @IBOutlet weak var characterDescription: UILabel!
    
    var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI), name: CharacterController.characterUpdatedNotification, object: nil)
        CharacterController.instance.loadCharacter(WithId: character.id)
        setupUI()
        updateUI()
    }
    
    private func setupUI() {
        self.characterImage.layer.cornerRadius = 5.0
    }
    
    @objc private func updateUI() {
        self.navigationItem.title = character.name

        self.characterName.text = character.name
        self.characterPublicDate.text = DateUtils.dateToString(date: character.dateStringtoDate())

        if character.description.isEmpty {
            self.characterDescription.text = "This character doesn't have Description."
        } else {
            self.characterDescription.text = character.description
        }
        
        CharacterController.instance.fetchImage(url: URL(string: character.image.path + "." + character.image.type)!) { (image) in
            guard let image = image else {return}
            DispatchQueue.main.async {
                self.characterImage.image = image
            }
        }
    }
}
