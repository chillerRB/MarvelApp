//
//  CharactersTableViewController.swift
//  MarvelApp
//
//  Created by Chiller Rafaele on 9/1/23.
//

import UIKit

class CharactersTableViewController: UITableViewController {
    
    var characters = [Character]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI), name: CharacterController.characterUpdatedNotification, object: nil)
        updateUI()
    }
    
    @objc private func updateUI() {
        self.characters = CharacterController.instance.getCharacters() ?? []
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCellIdentifier", for: indexPath) as! CharacterTableViewCell

        // Configure the cell...
        let character = characters[indexPath.row]
        cell.setupCharacterTableviewCell(character: character)
        //self.configCell(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    private func configCell(cell: UITableViewCell, indexPath: IndexPath) {
        let character = characters[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = character.name
        content.secondaryText = "Publicado el \(character.modified)"
        
        CharacterController.instance.fetchImage(url: URL(string: character.image.path + "." + character.image.type)!) { (image) in
            guard let image = image else {return}
            DispatchQueue.main.async {
                if let currentIndexPath = self.tableView.indexPath(for: cell), currentIndexPath != indexPath {return}
                content.image = image
                //cell.imageView?.image = image
                cell.setNeedsLayout()
                cell.contentConfiguration = content
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showCharacterDetail" {
            let characterDetailViewController = segue.destination as! CharacterDetailViewController
            let index = tableView.indexPathForSelectedRow!.row
            characterDetailViewController.character = characters[index]
        }
    }
}
