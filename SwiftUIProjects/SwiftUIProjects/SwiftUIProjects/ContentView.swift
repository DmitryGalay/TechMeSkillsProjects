//
//  ContentView.swift
//  SwiftUIProjects
//
//  Created by Dima on 15.01.22.
//

import SwiftUI

struct ContentView: View {
    let lenght: CGFloat = 100
    var body: some View {
        VStack {
            VStack {
                VStack {
                    HStack {
                        Image("sunny").frame(width: lenght, height: lenght)
                        MainTemp()
                    }.padding(.leading, lenght / 2 )
                        .frame(width: lenght * 4, height: lenght * 2, alignment: .leading)
                    DaysTemp(myWidth: lenght )
                    .frame(width: lenght * 4, height: lenght * 2, alignment: .center)
                }.overlay(
                    CornerRadius(myWight: lenght * 4, myHeight: lenght * 4)
                )
            }
            .frame(width: 400, height: 400, alignment: .top)
            Spacer().frame(height: 75)
            HStack {
                Image("sunnyAverage")
                MainTemp()
                DaysTemp(myWidth: lenght / 2)
            }
//            .overlay(
//                CornerRadius(myWight: lenght * 4, myHeight: lenght * 2)
//            )
            Spacer().frame(height: 100)
            VStack {
                Image("sunnyAverage")
                MainTemp()
            }
            .overlay(
                CornerRadius(myWight: lenght * 2, myHeight: lenght * 2)
            )
        }
        .background(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
