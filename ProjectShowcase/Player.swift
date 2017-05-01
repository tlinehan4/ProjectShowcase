//
//  Player.swift
//  ProjectShowcase
//
//  Created by Timothy Linehan on 4/27/17.
//  Copyright © 2017 Timothy Linehan. All rights reserved.
//

import Foundation


class Player: NSObject, NSCoding {
    var name : String!
    var score : Int!
    
    init(name: String, score:Int) {
        self.name = name
        self.score = score
    }
    
override init() {
    super.init()
}

required init?(coder aDecoder: NSCoder){
    name = aDecoder.decodeObject(forKey: "name") as! String
    score = aDecoder.decodeObject(forKey: "score") as! Int
}

func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: "name")
    aCoder.encode(score, forKey: "score")
}
}


