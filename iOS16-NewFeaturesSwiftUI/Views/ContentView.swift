//
//  ContentView.swift
//  iOS16-NewFeaturesSwiftUI
//
//  Created by Johan Guenaoui on 27/08/2022.
//

import SwiftUI

struct PostDetail: View {
    let _post:Post
    
    var body: some View {
        VStack {
            Text(_post._content).padding(10)
            Spacer()
        }
    }
    
}

struct ContentView: View {
    var _postDirectory = PostDirectory()
    var _categories = Categories.allCases
    @State private var _path:[Post] = []
    @State private var selectedCategory: Categories?
    @State private var selectedPost: Post?

    
    var body: some View {
        NavigationSplitView {
            List (_categories, selection:$selectedCategory) { category in
                    NavigationLink(category.rawValue, value:category)
            }
            .navigationTitle("Categories")
        }content: {
            List(_postDirectory.filterCategory(category: selectedCategory ?? .Category1),selection:$selectedPost) { post in
                    NavigationLink(post._name, value:post)
            }
            .navigationTitle(selectedCategory?.rawValue ?? "Category 1")
        }detail: {
            PostDetail(_post: selectedPost ?? Post(id: 0, _name: "Auto", _content: "Auto", _category: .Category1)).navigationTitle(selectedPost?._name ?? "Auto")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
