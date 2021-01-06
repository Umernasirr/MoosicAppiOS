//
//  MusicTableViewController.swift
//  MoosicApp
//
//  Created by Remu on 04/01/2021.
//  Copyright © 2021 Umer. All rights reserved.
//
import UIKit

class MusicTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let arrChats = ["Ajay Devgan - Mixtape", "Dhinchak IoS - Talala", "Byker Bois - Remixy", "Hurt - Johnny Cash"]
    
    var songs = [Song]()
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSongs()
        myTableView.delegate = self
        myTableView.dataSource = self
                
        // Do any additional setup after loading the view.
    }
    
    
    func configureSongs(){
        songs.append(Song(id: 1, name: "Blue daba dee", user_name: "Marshmellow", imageName : "cover2", trackName: "song1"))
        songs.append(Song(id: 2, name: "Walk.", user_name: "Foo Fighters", imageName: "cover2", trackName: "song1"))
        songs.append(Song(id: 3, name: "For the Night", user_name: "Finneas", imageName: "cover2", trackName: "song1"))
        songs.append(Song(id: 4, name: "Rick Roll ", user_name: "Coldplay", imageName: "cover2", trackName: "song1"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrChats.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath , animated: true)
        // present the player
        let position = indexPath.row
        
//        songs
        
        guard let vc = storyboard?.instantiateViewController(identifier: "PlayerViewController") as? PlayerViewController else {
            return
        }
        
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
        
        
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mySongCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! SongDetailsTableViewCell
    
    let song = songs[indexPath.row]
    
    cell.lblName.text = song.name
    
//        cell.imageView?.image = UIImage.init(named: "profile")
        return cell
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


struct Song {
    let id: Int
    let name: String
    let user_name: String
    let imageName: String
    let trackName: String
    
}
