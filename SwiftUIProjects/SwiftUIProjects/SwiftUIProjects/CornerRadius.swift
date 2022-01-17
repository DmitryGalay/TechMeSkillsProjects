//
//  CornerRadius.swift
//  SwiftUIProjects
//
//  Created by Dima on 17.01.22.
//

import SwiftUI

struct CornerRadius: View {
    let myWight: CGFloat
    let myHeight: CGFloat
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .stroke(Color.black, lineWidth: 1)
            .frame(width: myWight , height: myHeight , alignment: .top)
    }
}
