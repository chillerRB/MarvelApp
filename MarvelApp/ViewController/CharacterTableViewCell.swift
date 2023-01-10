//
//  CharacterTableViewCell.swift
//  MarvelApp
//
//  Created by Chiller Rafaele on 10/1/23.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var dateModifiedLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    func setupUI() {
        self.characterImage.layer.cornerRadius = 5.0
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCharacterTableviewCell(character: Character) {
        self.nameLbl.text = character.name
        self.dateModifiedLbl.text = DateUtils.dateToString(date: character.dateStringtoDate()) 
        
        CharacterController.instance.fetchImage(url: URL(string: character.image.path + "." + character.image.type)!) { (image) in
            guard let image = image else {return}
            DispatchQueue.main.async {
                self.characterImage.image = image
            }
        }
    }

}
