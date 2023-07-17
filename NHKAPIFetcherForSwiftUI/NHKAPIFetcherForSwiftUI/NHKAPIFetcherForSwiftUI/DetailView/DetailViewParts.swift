//
//  DetailViewParts.swift
//  NHKAPIFetcherForSwiftUI
//
//  Created by 中村伊吹 on 2023/07/18.
//

import SwiftUI
import Combine

// Use UserDefault
actor UserDefaultStorage {
    func saveMemo(for id: String, memo: String) async {
        UserDefaults.standard.set(memo, forKey: id)
    }
    
    func loadMemo(for id: String) async -> String {
        return UserDefaults.standard.string(forKey: id) ?? ""
    }
}

struct DetailViewParts: View {
    @State private var memo: String = ""
    let ProgramDetailData: ProgramDetail
    let storage = UserDefaultStorage()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(ProgramDetailData.list.g1[0].title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            Text(ProgramDetailData.list.g1[0].subtitle)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
            Text(ProgramDetailData.list.g1[0].start_time + " 〜 " + ProgramDetailData.list.g1[0].end_time)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
            Text(ProgramDetailData.list.g1[0].content)
                .font(.body)
                .multilineTextAlignment(.leading)
            Text(ProgramDetailData.list.g1[0].act)
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(ProgramDetailData.list.g1[0].hashtags, id: \.self) { hashtag in
                        Text("#" + hashtag)
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(20)
                    }
                }
            }
            TextField("ここにメモを残せます", text: $memo)
                .font(.body)
                .padding()
                .border(Color.gray, width: 0.5)
            Button(action: {
                Task {
                    await storage.saveMemo(for: ProgramDetailData.list.g1[0].id, memo: memo)
                }
            }) {
                Text("Save Memo")
                    .font(.body)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
        .task {
            memo = await storage.loadMemo(for: ProgramDetailData.list.g1[0].id)
        }
    }
}

struct DetailViewParts_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewParts(ProgramDetailData: mockProgramDetailData)
    }
}
