//
//  Copyright © 2015 Big Nerd Ranch
//

import Foundation

class ItemStore {
    
    
    var allItems: [Item] = []
    let itemArchiveURL: URL = {
        let documentsDirectories =
            FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    
    
    init() {
        if let archivedItems =
            NSKeyedUnarchiver.unarchiveObject(withFile: itemArchiveURL.path) as? [Item] {
            allItems += archivedItems
        }
    }
    
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    // MOVING THE POSITION OF THE CELL in ItemStore
    func moveItem(form fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        //Get reference to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]
        
        // Remove Item from array
        allItems.remove(at: fromIndex)
        
        //Insert item in array at new location
        allItems.insert(movedItem, at: toIndex)
    }
    
    func removeItem(_ item: Item) {
        if let index = allItems.firstIndex(of: item) {
            allItems.remove(at: index)
        }
    }
    
    // when application exits we need to save.
    func saveChanges() -> Bool {
        print("Saving items to: \(itemArchiveURL.path)")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path)
        
    
    }
    
}
