//
//  ContentView.swift
//  NHKAPIFetcherForSwiftUI
//
//  Created by 中村伊吹 on 2023/07/17.
//

import SwiftUI

struct TopListView: View {
    let NowOnAirData: NowOnAir = mockNowOnAirData
    
    var body: some View {
        NavigationView {
            List([NowOnAirData.nowonair_list.g1.previous, NowOnAirData.nowonair_list.g1.present, NowOnAirData.nowonair_list.g1.following], id: \.id) { item in
                NavigationLink(destination: DetailView(programId: item.id))
                {
                    RowView(programData: item)
                }
            }.navigationBarTitle(Text("現在放送中の番組一覧"))
        }
    }
}

struct TopListView_Previews: PreviewProvider {
    static var previews: some View {
        TopListView()
    }
}
