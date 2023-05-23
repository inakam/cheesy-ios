//
//  SwiftUIView.swift
//
//
//  Created by 中村伊吹 on 2023/05/22.
//

import SwiftUI
import Charts
import ComplexModule

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

public struct HomeView: View {
    @State private var real = 1
    @State private var imaginary = 1
    @StateObject var complexNums = ComplexNums()
    
    public init() {}
    
    public var body: some View {
        VStack {
            HStack {
                TextField("実部", value: $real, format: .number)
                Text("x")
                Text("+")
                TextField("虚部", value: $imaginary, format: .number)
                Text("i")
            }.padding()
            Button(action: {
                self.complexNums.complexNums = []
                for n in 0 ..< 11 {
                    self.complexNums.complexNums.append(
                        ComplexNum(complexNum: Complex<Double>(Double(self.real) * Double(n), Double(self.imaginary) * Double(n)))
                    )
                }
            }) {
                Text("グラフ生成")
            }
            .padding()
            HStack {
                Text("(0 < x < 11)")
            }.padding()
            Chart {
                ForEach(complexNums.complexNums) { complexNum in
                    LineMark(
                        x: .value("real", complexNum.complexNum.real),
                        y: .value("imaginary", complexNum.complexNum.imaginary)
                    )
                }
            }
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
