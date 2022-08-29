//
//  LinearPostWidget.swift
//  PostWidgetPurpleExtension
//
//  Created by Johan Guenaoui on 29/08/2022.
//

import SwiftUI

struct LinearPostWidget: View {
    let post:Post
    
    var body: some View {
        VStack {
            Text("\(post._name) - \(post.dateFormat(type:"long"))")
        }
    }
}
