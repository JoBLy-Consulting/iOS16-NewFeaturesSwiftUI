//
//  Post.swift
//  iOS16-NewFeaturesSwiftUI
//
//  Created by Johan Guenaoui on 27/08/2022.
//
import Foundation

struct Post: Hashable, Identifiable {
    var id:Int
    let _name:String
    let _content:String
    let _category:Categories
    let _date:Date
    
    func dateFormat(type:String) -> String {
        let dateFormatter = DateFormatter()
        if type == "long" {
            dateFormatter.dateStyle = .long
        }else{
            dateFormatter.dateStyle = .short
        }
        dateFormatter.timeStyle = .none
        
        return dateFormatter.string(from: self._date)
    }
}
