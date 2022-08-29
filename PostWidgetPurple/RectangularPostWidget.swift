//
//  RectangularPostWidget.swift
//  PostWidgetPurpleExtension
//
//  Created by Johan Guenaoui on 29/08/2022.
//

import SwiftUI

struct RectangularPostWidget: View {
    let post:Post
    
    var body: some View {
        VStack {
            Text("\(post._name) - \(post.dateFormat(type:"short"))")
            Text(post._content)
                .truncationMode(.head)
        }
    }
}
