//
//  ContentView.swift
//  NHKAPIFetcherForSwiftUI
//
//  Created by 中村伊吹 on 2023/07/17.
//

import SwiftUI

struct TopListView: View {
    @State private var NowOnAirData: NowOnAir?
    @State private var isLoading = true
    
    var body: some View {
        NavigationView {
            if let NowOnAirData = NowOnAirData {
                List([NowOnAirData.nowonair_list.g1.previous, NowOnAirData.nowonair_list.g1.present, NowOnAirData.nowonair_list.g1.following], id: \.id) { item in
                    NavigationLink(destination: DetailView(programId: item.id))
                    {
                        RowView(programData: item)
                    }
                }
                .navigationBarTitle(Text("NHK番組一覧"))
            } else if isLoading {
                Text ("Loading...")
            } else {
                Text("Failed to load data.")
            }
        }
        .task{
            do {
                isLoading = true
                NowOnAirData = try await fetchNowOnAirData()
            } catch {
                print("Failed to fetch data: \(error)")
            }
            isLoading = false
        }
    }
}

struct TopListView_Previews: PreviewProvider {
    static var previews: some View {
        TopListView()
    }
}

func fetchNowOnAirData() async throws -> NowOnAir {
    let url = URL(string: "https://api.nhk.or.jp/v2/pg/now/130/g1.json?key=\(NHKAPIKEY)")!

    let (data, _) = try await URLSession.shared.data(from: url)
    let decoder = JSONDecoder()
    let NowOnAirData = try decoder.decode(NowOnAir.self, from: data)
    
    return NowOnAirData
}
