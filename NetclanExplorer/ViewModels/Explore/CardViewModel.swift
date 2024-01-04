//
//  CardViewModel.swift
//  NetclanExplorer
//
//  Created by Manvi Singhal on 30/12/23.
//

import Foundation

protocol UserViewModel {
    var username: String { get }
    var shortUsername: String { get }
}

extension UserViewModel {
    func generateShortUsername() -> String {
        let words = username.components(separatedBy: " ")
        
        if words.count >= 2 {
            let firstInitial = String(words.first!.prefix(1))
            let lastInitial = String(words.last!.prefix(1))
            return firstInitial + lastInitial
        } else if let firstWord = words.first {
            return String(firstWord.prefix(2))
        } else {
            return ""
        }
    }

}
