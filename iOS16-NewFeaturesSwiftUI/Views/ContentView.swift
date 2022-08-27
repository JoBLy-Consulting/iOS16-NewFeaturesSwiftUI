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

struct CategoryGrid:View {
    var category:Categories?
    var _postGrid:[GridItem] = [
        GridItem(.adaptive(minimum: 320))
    ]
    var _postDirectory = PostDirectory()
    
    var body: some View {
        if let category = category {
            ScrollView {
                LazyVGrid(columns: _postGrid) {
                    ForEach(_postDirectory.filterCategory(category: category),id:\.self) { post in
                        NavigationLink(value:post) {
                            PostDetail(_post: post)
                                .frame(height:150)
                                .truncationMode(.head)
                                .background(.cyan)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .navigationTitle(category.rawValue)
            .navigationDestination(for: Post.self) { post in PostDetail (_post: post).navigationTitle(post._name)
            }

        }
    }
}

struct ContentView: View {
    var _categories = Categories.allCases
    @State private var _path:[Post] = []
    @State private var selectedCategory: Categories?

    
    var body: some View {
        NavigationSplitView {
            List (_categories, selection:$selectedCategory) { category in
                    NavigationLink(category.rawValue, value:category)
            }
            .navigationTitle("Categories")
        }detail: {
            NavigationStack(path: $_path) {
                CategoryGrid(category: selectedCategory)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
