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
    
    var body: some View {
        NavigationStack(path:$_path) {
            List {
                ForEach(_categories, id:\.self) { category in
                    Section(header:Text(category.rawValue)) {
                        ForEach(_postDirectory.filterCategory(category: category), id:\.self) { post in
                            NavigationLink(post._name, value:post)
                        }
                    }
                }
            }
            .navigationTitle("Categories")
            .navigationDestination(for: Post.self) { post in
                PostDetail(_post: post).navigationTitle(post._name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
