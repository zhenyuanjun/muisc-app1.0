//
//  rappers.swift
//  HiphopEbook
//
//  Created by 陳元浚 on 2020/10/19.
//

import SwiftUI
struct WrongPersonView: View {
    @State private var moveDistance: CGFloat = 0
    @State private var opacity: Double = 1
    var body: some View {
        TabView {
            VStack {
                Button("Rap of China") {
                    moveDistance += 50
                    opacity -= 0.3
                }
                .font(.title)
                HStack {
                    Image("rapofchina")
                        .offset(x: moveDistance, y: 0)
                        .opacity(opacity)
                        .animation(.easeOut)
                    Spacer()
                }
            }
            VStack (alignment: .leading, spacing: 5){
                Text("威爾")
                    .offset(x: 0, y: 0)
                Image("Will.T")
                    .resizable()
                    .scaledToFit()
                    .navigationBarTitle(Text("rapper收藏"),   displayMode: .inline)
            }
            Link(destination: URL(string: "https://www.youtube.com/watch?v=yBCdN3oi8gc")!, label: {
                VStack (alignment: .leading, spacing: 5){
                    Text("威爾-大招")
                        .offset(x: 0, y: 0)
                    Image("Will.T2")
                        .resizable()
                        .scaledToFit()
                }
            })
            .buttonStyle(PlainButtonStyle())
            
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}
struct WrongPersonView_Previews:PreviewProvider {
    static var previews: some View {
        WrongPersonView()
    }
}
