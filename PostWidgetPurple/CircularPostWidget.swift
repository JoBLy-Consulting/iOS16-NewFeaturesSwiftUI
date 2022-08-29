//
//  CircularPostWidget.swift
//  PostWidgetPurpleExtension
//
//  Created by Johan Guenaoui on 29/08/2022.
//

import SwiftUI

struct CircularPostWidget: View {
    let post:Post
    
    var body: some View {
        ZStack {
            Circle()
                .stroke()
            VStack {
                Text("Post")
                Text("\(post.id)")
            }
        }
    }
}
