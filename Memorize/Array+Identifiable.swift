//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Vanchinathan Ayipalayam Chandrasekaran on 5/30/21.
//

import Foundation


extension Array where Element: Identifiable {
    func firstIndex(matching element: Element) -> Int {
        for index in 0..<self.count {
            if self[index].id == element.id {
                return index
            }
        }
        return 0 // TODO: bogus return value
    }
}
