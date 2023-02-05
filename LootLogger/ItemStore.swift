//
//  ItemStore.swift
//  LootLogger
//
//  Created by Mohamed Atallah on 31/01/2023.
//

import UIKit

class ItemStore {
    
    var allItems = [Item]()
    let itemArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appending(path: "items.plist")
    }()
    
    // override init() to observe the Scene state.
    init() {
        do {
            let data = try Data(contentsOf: itemArchiveURL)
            let unarchiver = PropertyListDecoder()
            let items = try unarchiver.decode([Item].self, from: data)
            allItems = items
        } catch {
            print("Error reading in saved items: \(error)")
        }
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(saveChanges), name: UIScene.didEnterBackgroundNotification, object: nil)
    }
    
    @discardableResult func createItem() -> Item {
        let item = Item(random: true)
        
        allItems.append(item)
        
        return item
    }
    
    func removeItem(index: Int) {
        allItems.remove(at: index)
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        let item = allItems[fromIndex]
        
        allItems.remove(at: fromIndex)
        allItems.insert(item, at: toIndex)
    }
    
    @objc func saveChanges() -> Bool {
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(allItems)
            try data.write(to: itemArchiveURL, options: [.atomic])
            print("Saved all of the items")
            return true
        } catch let encodingError {
            print("Error encoding all Items \(encodingError)")
            return false
        }
        
    }
}
