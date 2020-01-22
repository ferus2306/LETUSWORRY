//
//  Copyright © 2015 Big Nerd Ranch
//

import Foundation

class Item: NSObject, NSCoding {
    
    var name: String
    var bags: String
    var weight: String
    var pickUpDate: String
    var dropOffDate: String
    let itemKey: String

    
    init(name: String) {
        self.name = name
        self.bags = " "
        self.weight = " "
        self.pickUpDate = " "
        self.dropOffDate = " "
        self.itemKey = UUID().uuidString
        
        super.init()
    }
    
    convenience init(random: Bool = false) {
        if random {
            let firstname = ["Peter", "Jake", "Dane"]
            let lastname = ["Donde", "Green", "Black"]
            
            var idx = arc4random_uniform(UInt32(firstname.count))
            let randomAdjective = firstname[Int(idx)]
            
            idx = arc4random_uniform(UInt32(lastname.count))
            let randomNoun = lastname[Int(idx)]
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            
            self.init(name: randomName)
        } else {
            self.init(name: "")
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(bags, forKey: "bags")
        aCoder.encode(weight, forKey: "weight")
        aCoder.encode(pickUpDate, forKey: "pickUpDate")
        aCoder.encode(dropOffDate, forKey: "dropOffDate")
        aCoder.encode(itemKey, forKey: "itemKey")
    }
    
    required init(coder aDecoder: NSCoder){
        name = aDecoder.decodeObject(forKey: "name") as! String
        bags = aDecoder.decodeObject(forKey: "bags") as! String
        weight = aDecoder.decodeObject(forKey: "weight") as! String
        pickUpDate = aDecoder.decodeObject(forKey: "pickUpDate") as! String
        dropOffDate = aDecoder.decodeObject(forKey: "dropOffDate") as! String
        itemKey = (aDecoder.decodeObject(forKey: "itemKey") as! String?)!
        
        super.init()
    }
    
}
