//
//  RowView.swift
//  NHKAPIFetcherForSwiftUI
//
//  Created by 中村伊吹 on 2023/07/17.
//

import SwiftUI

struct RowView: View {
    var programData: NowOnAir.Program
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(programData.title)
                .bold()
                .font(.headline)
                .lineLimit(2)
                .padding(Edge.Set.top, 8.0)
                .padding(Edge.Set.bottom, 12.0)
            HStack {
                Image(systemName: "calendar")
                    .imageScale(.medium)
                    .foregroundColor(.red)
                Text(programData.start_time).font(.footnote)
            }.padding(Edge.Set.bottom, 6.0)
            HStack {
                Image(systemName: "calendar")
                    .imageScale(.medium)
                    .foregroundColor(.red)
                Text(programData.end_time).font(.footnote)
            }.padding(Edge.Set.bottom, 6.0)
            HStack {
                Spacer()
                Text(programData.id)
                    .foregroundColor(.blue)
                    .font(.caption)
                    .padding(Edge.Set.bottom, 8.0)
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(programData: mockNowOnAirData.nowonair_list.g1.present)
    }
}
