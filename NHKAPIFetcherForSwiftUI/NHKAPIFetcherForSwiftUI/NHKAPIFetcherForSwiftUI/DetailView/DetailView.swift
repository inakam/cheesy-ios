//
//  DetailView.swift
//  NHKAPIFetcherForSwiftUI
//
//  Created by 中村伊吹 on 2023/07/18.
//

import SwiftUI

struct DetailView: View {
    let programId: String
    @State private var programDetailData: ProgramDetail?
    @State private var isLoading = true
    
    var body: some View {
        ScrollView {
            if let programDetailData = programDetailData {
                DetailViewParts(ProgramDetailData: programDetailData)
            } else if isLoading {
                Text("Loading...")
            } else {
                Text("Failed to load data.")
            }
        }
        .navigationTitle("番組詳細")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            do {
                isLoading = true
                programDetailData = try await fetchProgramDetailData(for: programId)
            } catch {
                print("Failed to fetch data: \(error)")
            }
            isLoading = false
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(programId: mockProgramDetailData.list.s3[0].id)
    }
}
