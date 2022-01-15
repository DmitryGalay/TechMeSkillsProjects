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
//        Color.gray
//               .overlay(
        
        VStack {
            VStack {
                VStack {
                    HStack {
                        Image("sunny").frame(width: lenght, height: lenght)
                        VStack {
                            Text("13º")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.center)
                                .frame(width: lenght, height: 30, alignment: .center)
                            
                            Text("Sunny")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(Color.orange)
                                .frame(width: lenght, height: 30, alignment: .center)
                        }
                        
                    }.padding(.leading, lenght / 2 )
                        .frame(width: lenght * 4, height: lenght * 2, alignment: .leading)
                    
                    VStack {
                        HStack {
                            Spacer().frame(width: lenght / 2 )
                            Image("sunnySmall")
                            Text("Friday")
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor(Color.black)
                                .frame(width: lenght, height: 30, alignment: .leading)
                            Spacer()
                            Text("12º")
                                .fontWeight(.bold)
                                .foregroundColor(Color.black)
                                .frame(width: lenght, height: 30, alignment: .leading)
                        }
                        
                        HStack {
                            Spacer().frame(width: lenght / 2 )
                            Image("cloudySmall")
                            Text("Saturday")
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor(Color.black)
                                .frame(width: lenght, height: 30, alignment: .leading)
                            Spacer()
                            Text("14º")
                                .fontWeight(.bold)
                                .foregroundColor(Color.black)
                                .frame(width: lenght, height: 30, alignment: .leading)
                        }
                        HStack {
                            Spacer().frame(width: lenght / 2 )
                            Image("rainySmall")
                            Text("Sunday")
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor(Color.black)
                                .frame(width: lenght, height: 30, alignment: .leading)
                            Spacer()
                            Text("17º")
                                .fontWeight(.bold)
                                .foregroundColor(Color.black)
                                .frame(width: lenght, height: 30, alignment: .leading)
                        }
                        
                    }
                    .frame(width: lenght * 4, height: lenght * 2, alignment: .center)
                    
                }.overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 1)
                        .frame(width: lenght * 4, height: lenght * 4, alignment: .top)
                )
            }
            
            .frame(width: 400, height: 400, alignment: .top)
            Spacer().frame(height: 75)
                .foregroundColor(Color.red)
            HStack {
                Image("sunnyAverage")
                VStack {
                    Text("13º")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .frame(width: lenght, height: 30, alignment: .center)
                    
                    Text("Sunny")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.orange)
                        .frame(width: lenght, height: 30, alignment: .center)
                }
                VStack {
                    HStack {
                        
                        Image("sunnySmall")
                        Text("Fri")
                            .font(.body)
                            .fontWeight(.medium)
                            .foregroundColor(Color.black)
                            .frame(width: lenght / 2, height: 30, alignment: .leading)
                        Text("12º")
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .frame(width: lenght / 2, height: 30, alignment: .leading)
                    }
                    
                    HStack {
                        
                        Image("cloudySmall")
                        Text("Sat")
                            .font(.body)
                            .fontWeight(.medium)
                            .foregroundColor(Color.black)
                            .frame(width: lenght / 2, height: 30, alignment: .leading)
                        
                        Text("14º")
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .frame(width: lenght / 2, height: 30, alignment: .leading)
                    }
                    HStack {
                        
                        Image("rainySmall")
                        Text("Sun")
                            .font(.body)
                            .fontWeight(.medium)
                            .foregroundColor(Color.black)
                            .frame(width: lenght / 2, height: 30, alignment: .leading)
                        
                        Text("17º")
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .frame(width: lenght / 2, height: 30, alignment: .leading)
                    }
                    
                }
                
            }
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 1)
                    .frame(width: lenght * 4, height: lenght * 2, alignment: .center)
            )
            Spacer().frame(height: 100)
            VStack {
                Image("sunnyAverage")
                VStack {
                    Text("13º")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .frame(width: lenght, height: 30, alignment: .center)
                    
                    Text("Sunny")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.orange)
                        .frame(width: lenght, height: 30, alignment: .center)
                }
                
            }
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 1)
                    .frame(width: lenght * 2 , height: lenght  * 2, alignment: .center)
            )
            
        }
//        )
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

