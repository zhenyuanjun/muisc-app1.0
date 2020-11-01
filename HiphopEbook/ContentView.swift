//
//  ContentView.swift
//  HiphopEbook
//
//  Created by 陳元浚 on 2020/10/19.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State private var bgColor = Color.white
    @State private var isPresented = false
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: RightPersonView()){
                    Text("Musicplayer").font(.system(size:45)).fontWeight(.bold)
                        .foregroundColor(.buttonColor)
                }
                Button("點我聽音樂") {
                    self.isPresented.toggle()
                }
                .fullScreenCover(isPresented: $isPresented, content: FullScreenModalView.init)
                ColorPicker("Set the background color", selection: $bgColor)
                    .font(.system(size:20))
                    .foregroundColor(.buttonColor)
            }
            .navigationBarTitle(Text("中國有嘻哈"),   displayMode:.inline)
            .background(bgColor)
        }
    }
}
struct ContentView_Previews:PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                ContentView()
            }
        }
    }
}
struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var audioPlayer: AVAudioPlayer!
    @State var count = 1
    var body: some View {
        ZStack{
            Color.backgroundColor
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack{
                    Text("fav music")
                        .font(.system(size:45))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.buttonColor)
                }
                HStack{
                    Button(action:{self.audioPlayer.play()
                    }){
                        Image(systemName: "play.circle.fill").resizable()
                            .frame(width: 50,height: 50)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.buttonColor)
                    }
                    Button(action:{
                        let sound = Bundle.main.path(forResource: "position", ofType: "mp3")
                        self.audioPlayer = try! AVAudioPlayer(contentsOf:URL(fileURLWithPath: sound!))
                    }){
                        Image(systemName: "pause.circle.fill").resizable()
                            .frame(width: 50,height: 50)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.buttonColor)
                    }
                }
            }
        }
        .onAppear(){
            let sound = Bundle.main.path(forResource: "position", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf:URL(fileURLWithPath: sound!))
        }
    }
}
