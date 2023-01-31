//
//  ItemStore.swift
//  LootLogger
//
//  Created by Mohamed Atallah on 31/01/2023.
//

import UIKit

class ItemStore {
    
    var allItems = [Item]()
    
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
}
