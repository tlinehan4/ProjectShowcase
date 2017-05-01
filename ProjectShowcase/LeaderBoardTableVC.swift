//
//  LeaderBoardTableVC.swift
//  ProjectShowcase
//
//  Created by Timothy Linehan on 4/25/17.
//  Copyright © 2017 Timothy Linehan. All rights reserved.
//

import UIKit

var players = [Player]()

class LeaderBoardTableVC: UIViewController {
    var data : Player!
    let defaultsData = UserDefaults.standard
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load into players
        loadUserDefaults()
        data = Player(name: name, score: score)
        players.append(data)
        //save
       players = players.sorted(by: {$0.score > $1.score})
        saveUserDefaults()


        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()



        // Do any additional setup after loading the view.
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveUserDefaults() {
        var playersDefaultsArray = [Player]()
        playersDefaultsArray = players
        let playerData = NSKeyedArchiver.archivedData(withRootObject: playersDefaultsArray)
        UserDefaults.standard.set(playerData, forKey: "playerData")
    }
    
    func loadUserDefaults() {
        if let playersDefaultsData = UserDefaults.standard.object(forKey: "playerData") as? Data {
            if let playersDefaultsArray = NSKeyedUnarchiver.unarchiveObject(with: playersDefaultsData) as? [Player] {
                players = playersDefaultsArray
            } else {
                print("error creating array")
            }
        } else {
            print("error loading data")
        }
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
//        players = defaultsData.object(forKey: "players") as! [Player]
//        defaultsData.set(players, forKey: "players")

    }
}


extension LeaderBoardTableVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PlayerCell
//        Cell.configureCell(playerData: players[indexPath.row])
        Cell.playerNameCell.text = players[indexPath.row].name
        Cell.playerScoreCell.text = String(players[indexPath.row].score)
        return Cell
    }
}

