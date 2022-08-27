//
//  Post.swift
//  iOS16-NewFeaturesSwiftUI
//
//  Created by Johan Guenaoui on 27/08/2022.
//

struct Post: Hashable, Identifiable {
    var id:Int
    let _name:String
    let _content:String
    let _category:Categories
}
