//
//  ToastView.swift
//  NHKAPIFetcherForSwiftUI
//
//  Created by 中村伊吹 on 2023/07/18.
//

import SwiftUI

struct ToastView: View {
    var body: some View {
        Text("メモを保存しました！")
            .bold()
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
            .opacity(0.8)
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView()
    }
}
