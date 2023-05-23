//
//  ContentView.swift
//  multi-module-complex
//
//  Created by 中村伊吹 on 2023/05/10.
//

import SwiftUI
import Charts
import ComplexModule

// Thx for Ryomm
struct ComplexNum: Identifiable {
    var id: UUID = .init()
    var complexNum: Complex<Double>

    init(complexNum: Complex<Double>) {
        self.complexNum = complexNum
    }
}
class ComplexNums: ObservableObject {
    @Published var complexNums = [ComplexNum]()
}

struct ContentView: View {
    @State private var real: String = ""
    @State private var imaginary: String = ""
    @StateObject var complexNums = ComplexNums()
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
            // ここにグラフを表示したかった
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
