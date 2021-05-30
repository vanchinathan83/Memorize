//
//  Grid.swift
//  Memorize
//
//  Created by Vanchinathan Ayipalayam Chandrasekaran on 5/30/21.
//

import SwiftUI

struct Grid<Item, ItemView> : View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item],viewForItem: @escaping (Item) -> ItemView){
        self.items = items
        self.viewForItem = viewForItem
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
    func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.view(for: item, in: layout)
        }
    }
    
    func view(for item: Item, in layout: GridLayout) -> some View {
        let index = items.firstMatchingIndex(of: item)
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
}

extension Array where Element: Identifiable {
    func firstMatchingIndex(of element: Element) -> Int {
        for index in 0..<self.count {
            if self[index].id == element.id {
                return index
            }
        }
        return 0 // TODO: bogus return value
    }
}
