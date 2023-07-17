//
//  DetailViewParts.swift
//  NHKAPIFetcherForSwiftUI
//
//  Created by 中村伊吹 on 2023/07/18.
//

import SwiftUI

struct DetailViewParts: View {
    let ProgramDetailData: ProgramDetail
    
    var body: some View {
        ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(ProgramDetailData.s3[0].title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        Text(ProgramDetailData.s3[0].subtitle)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                        Text(ProgramDetailData.s3[0].start_time + " 〜 " + ProgramDetailData.s3[0].end_time)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                        Text(ProgramDetailData.s3[0].content)
                            .font(.body)
                            .multilineTextAlignment(.leading)
                        Text(ProgramDetailData.s3[0].act)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(ProgramDetailData.s3[0].hashtags, id: \.self) { hashtag in
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
                    }
                    .padding()
                }
    }
}

struct DetailViewParts_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewParts(ProgramDetailData: mockProgramDetailData)
    }
}
