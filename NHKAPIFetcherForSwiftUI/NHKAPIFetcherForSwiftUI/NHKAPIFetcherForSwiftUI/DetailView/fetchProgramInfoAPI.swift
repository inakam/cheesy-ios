//
//  fetchProgramInfoAPI.swift
//  NHKAPIFetcherForSwiftUI
//
//  Created by 中村伊吹 on 2023/07/18.
//

import Foundation

func fetchProgramDetailData(for id: String) async throws -> ProgramDetail {
    let url = URL(string: "https://api.nhk.or.jp/v2/pg/info/130/s3/\(id).json?key=\(NHKAPIKEY)")!

    let (data, _) = try await URLSession.shared.data(from: url)
    let decoder = JSONDecoder()
    let programDetailData = try decoder.decode(ProgramDetail.self, from: data)
    
    return programDetailData
}
