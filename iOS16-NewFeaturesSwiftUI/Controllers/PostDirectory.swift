//
//  PostDirectory.swift
//  iOS16-NewFeaturesSwiftUI
//
//  Created by Johan Guenaoui on 27/08/2022.
//
import Foundation

enum Categories: String, CaseIterable, Identifiable {
    case Category1 = "Category 1"
    case Category2 = "Category 2"
    
    var id: String {
        switch self {
        case .Category1: return "Category 1"
        case .Category2: return "Category 2"
        }
    }
}

struct PostDirectory {
    var _postList:[Post]=[]
    var dateComponent = DateComponents()
    
    init() {
        for i in 1...15 {
            dateComponent.day = i-1
            self._postList.append(
                Post(id: i,
                     _name: "Article n°\(i)",
                     _content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                     _category: i%2==0 ?Categories.Category1:Categories.Category2,_date: Calendar.current.date(byAdding: dateComponent, to: Date()) ?? Date())
            )
        }
    }
    
    public func filterCategory(category:Categories) -> [Post] {
        return _postList.filter { $0._category == category}
    }
    
    public func todayPost(datePost: Date) -> [Post] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        return _postList.filter({ $0.dateFormat(type: "short") == dateFormatter.string(from: datePost)})
    }
}
