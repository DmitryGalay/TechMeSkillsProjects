//
//  ContentView.swift
//  SwiftUIProjects
//
//  Created by Dima on 15.01.22.
//

import SwiftUI

struct ContentView: View {
    let count: CGFloat = 100
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            VStack(spacing: 20) {
                VStack {
                    VStack {
                        HStack() {
                            Image("sunnyy-1").frame(width: count, height: count)
                            MainTemp()
                        }.padding(.leading, count / 2 )
                            .frame(width: count * 4, height: count * 2, alignment: .leading)
                        DaysTemp(width: count, firstDay: "Friday", secondDay: "Saturday", thirdDay: "Sunday", spacerWight: count * 1.5, mainSpacerWight: count / 1.5 )
                            .frame(width: count * 4, height: count * 2)
                    }
                    .frame(width: count * 4 , height: count * 4, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(25)
                }
                .frame(width: count * 4, height: count * 4, alignment: .top)
                HStack {
                    Image("sunnyAverage")
                    MainTemp()
                    DaysTemp(width: count / 2, firstDay: "Fri", secondDay: "Sat", thirdDay: "San", spacerWight: count / 4, mainSpacerWight: count / 4)
                }
                .frame(width: count * 4 , height: count * 2, alignment: .center)
                .background(Color.white)
                .cornerRadius(25)
                VStack {
                    Image("sunnyAverage")
                    MainTemp()
                }
                .frame(width: count * 2 , height: count * 2, alignment: .center)
                .background(Color.white)
                .cornerRadius(25)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
