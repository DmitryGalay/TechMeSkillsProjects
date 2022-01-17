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
            VStack {
                VStack {
                    VStack {
                        HStack {
                            Image("sunny").frame(width: count, height: count)
                            MainTemp()
                        }.padding(.leading, count / 2 )
                            .frame(width: count * 4, height: count * 2, alignment: .leading)
                        DaysTemp(width: count, firstDay: "Friday", secondDay: "Saturday", thirdDay: "Sunday", spacerWight: count * 2, mainSpacerWight: count / 1.5)
                            .frame(width: count * 4, height: count * 2, alignment: .center)
                    }.overlay(
                        CornerRadius(myWight: count * 4, myHeight: count * 4)
                    )
                }
                .frame(width: 400, height: 400, alignment: .top)
                Spacer().frame(height: 75)
                HStack {
                    Image("sunnyAverage")
                    MainTemp()
                    DaysTemp(width: count / 2, firstDay: "Fri", secondDay: "Sat", thirdDay: "San", spacerWight: count / 4, mainSpacerWight: count / 4)
                }
                .overlay(
                    CornerRadius(myWight: count * 4, myHeight: count * 2)
                )
                Spacer().frame(height: 100)
                VStack {
                    Image("sunnyAverage")
                    MainTemp()
                }
                .overlay(
                    CornerRadius(myWight: count * 2, myHeight: count * 2)
                )
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
