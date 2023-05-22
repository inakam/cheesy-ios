//
//  ContentView.swift
//  multi-module-complex
//
//  Created by 中村伊吹 on 2023/05/10.
//

import SwiftUI
import Charts

struct ContentView: View {
    struct ValuePerCategory {
        var category: String
        var value: Double
    }

    let data: [ValuePerCategory] = [
        .init(category: "A", value: 5),
        .init(category: "B", value: 9),
        .init(category: "C", value: 7)
    ]
    
    @State private var real: String = ""
    @State private var imaginary: String = ""
    var body: some View {
        VStack {
            HStack {
                TextField("実部", text: $real)
                Text("x")
                Text("+")
                TextField("虚部", text: $imaginary)
                Text("i")
            }.padding()
            Button("グラフ生成") {
                self.generateGraph()
            }.padding()
            HStack {
                Text("(0 < x < 11)")
            }.padding()
            Chart(data, id: \.category) { item in
                BarMark(
                    x: .value("Category", item.category),
                    y: .value("Value", item.value)
                )
            }
        }
        .padding()
    }
    private func generateGraph() {}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
