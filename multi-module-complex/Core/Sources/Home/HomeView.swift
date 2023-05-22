//
//  SwiftUIView.swift
//  
//
//  Created by 中村伊吹 on 2023/05/22.
//

import SwiftUI
import Charts
import ComplexModule

public struct HomeView: View {
    @State private var real: String = ""
    @State private var imaginary: String = ""
    
    public init() {}
    
    public var body: some View {
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
        }
        .padding()
    }
    private func generateGraph() {}
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
