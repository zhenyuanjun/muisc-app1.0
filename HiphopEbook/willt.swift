//
//  willt.swift
//  HiphopEbook
//
//  Created by 陳元浚 on 2020/10/19.
//

import SwiftUI
struct RightPersonView: View {
    @State private var message = "在此編輯TextEditor"
    @State private var isExpanded = true
    @State private var showAlert = false
    let rappers = ["李佳隆","Gali","王齊銘","Kafe.Hu","AnsrJ",]
    let books = ["李佳隆","Gali","王齊銘","Kafe.Hu","AnsrJ",]
    let teachers = ["張靚穎","GAI","潘瑋柏","吳亦凡"]
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                let rows = [GridItem()]
                LazyHGrid(rows: rows) {
                    ForEach(books.indices) { (index) in
                        VStack {
                            Image(books[index])
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height:150)
                                .clipped()
                            Button(action: {
                                showAlert = true
                            }){
                                VStack{
                                    Image(systemName: "heart")
                                    Text("Like")
                                }
                            }
                            .alert(isPresented: $showAlert) { () -> Alert in
                                    let answer = ["愛", "不愛"].randomElement()!
                                    return Alert(title: Text(answer))
                                 }
                        }
                        .overlay(
                            Image(systemName: "\(index+1).circle.fill")
                                .font(.largeTitle)
                            , alignment: .topLeading)
                    }
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            ScrollView(.vertical) {
                let columns = [
                    GridItem(.adaptive(minimum: 150)),
                ]
                LazyVGrid(columns: columns) {
                    ForEach(rappers.indices) { (index) in
                        VStack {
                            Image(rappers[index])
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .clipped()
                                .cornerRadius(30)
                                Text(rappers[index])
                        }
                    }
                }
                TextEditor(text: $message)
            }
            List{
                DisclosureGroup(
                    isExpanded: $isExpanded,
                    content: {
                        VStack(alignment: .leading) {
                            ForEach(teachers.indices) { (index) in
                                Text(teachers[index])
                            }
                        }
                    },
                    label: {
                        Label("收錄新收唱導師", systemImage: "text.book.closed.fill")
                    }
                )
                .padding()
                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading) {
                            ForEach(rappers.indices) { (index) in
                                Text(rappers[index])
                            }
                        }
                    },
                    label: {
                        Label("收錄新收唱歌手", systemImage: "text.book.closed.fill")
                    }
                )
                .padding()
            }
        }
            NavigationLink(destination: WrongPersonView()){
            Text("videos").font(.system(size:45)).fontWeight(.bold)
                .foregroundColor(.buttonColor)
        }
    }
}

struct RightPersonView_Previews: PreviewProvider {
    static var previews: some View {
        RightPersonView()
    }
}
