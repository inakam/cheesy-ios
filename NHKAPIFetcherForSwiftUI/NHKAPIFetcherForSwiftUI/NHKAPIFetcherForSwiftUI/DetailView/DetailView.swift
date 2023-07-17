//
//  DetailView.swift
//  NHKAPIFetcherForSwiftUI
//
//  Created by 中村伊吹 on 2023/07/18.
//

import SwiftUI

struct DetailView: View {
    let ProgramDetailData: ProgramDetail
    
    var body: some View {
        ScrollView {
            DetailViewParts(ProgramDetailData: ProgramDetailData)
        }
        .navigationTitle("番組詳細")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(ProgramDetailData: mockProgramDetailData)
    }
}
