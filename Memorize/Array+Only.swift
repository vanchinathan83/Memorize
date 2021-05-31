//
//  Array+Only.swift
//  Memorize
//
//  Created by Vanchinathan Ayipalayam Chandrasekaran on 5/31/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first: nil
    }
}
