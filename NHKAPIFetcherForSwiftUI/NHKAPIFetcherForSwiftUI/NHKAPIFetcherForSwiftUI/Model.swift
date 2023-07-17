//
//  Model.swift
//  NHKAPIFetcherForSwiftUI
//
//  Created by 中村伊吹 on 2023/07/17.
//

import Foundation

struct NowOnAir: Decodable {
    var nowonair_list: NowOnAirList

    struct NowOnAirList: Decodable {
        var g1: G1
    }

    struct G1: Decodable {
        var previous: Program
        var present: Program
        var following: Program
    }

    struct Program: Decodable {
        var id: String
        var start_time: String
        var end_time: String
        var title: String
    }
}

let mockNowOnAirData: NowOnAir = NowOnAir(
    nowonair_list: NowOnAir.NowOnAirList(
        g1: NowOnAir.G1(
            previous: NowOnAir.Program(id: "2023071724383", start_time: "2023-07-17T22:45:00+09:00", end_time: "2023-07-17T23:00:00+09:00", title: "科学の新発見"),
            present: NowOnAir.Program(id: "2023071724384", start_time: "2023-07-17T23:00:00+09:00", end_time: "2023-07-17T23:30:00+09:00", title: "現代の技術革新"),
            following: NowOnAir.Program(id: "2023071724387", start_time: "2023-07-17T23:30:00+09:00", end_time: "2023-07-17T23:35:00+09:00", title: "次世代のエネルギー"))
    ))

struct ProgramDetail: Decodable {
    var s3: [S3]
    
    struct S3: Decodable {
        var id: String
        var start_time: String
        var end_time: String
        var title: String
        var subtitle: String
        var content: String
        var act: String
        var program_url: String
        var hashtags: [String]
    }
}

let mockProgramDetailData: ProgramDetail = ProgramDetail(s3: [
    ProgramDetail.S3(
        id: "2023071724225",
        start_time: "2023-07-17T05:00:00+09:00",
        end_time: "2023-07-17T05:55:00+09:00",
        title: "クラシック倶楽部　東京オペラシンガーズが歌う　６０年目の「大地讃頌」",
        subtitle: "東京を中心とする中堅、若手声楽家で結成される合唱団、東京オペラシンガーズが、佐藤眞作曲「大地讃頌」をはじめ、合唱の名曲を歌った演奏をお届けします。",
        content: "【曲目】混声合唱のためのカンタータ「土の歌」（佐藤眞）、旅愁（オードウェー／寺嶋陸也　編）すみれの花咲く頃（Ｆ．ドール／寺嶋陸也　編）ロンドンデリーの歌（アイルランド民謡／寺嶋陸也　編）、荒野の果てに（作曲者不詳／寺嶋陸也　編）アメイジング・グレイス（伝承曲／寺嶋陸也　編）ほか【演奏】東京オペラシンガーズ（合唱）、寺嶋陸也（指揮・ピアノ）【収録】２０２２年７月１１日　めぐろパーシモンホール大ホール",
        act: "",
        program_url: "//nhk.jp/P242",
        hashtags: ["#クラシック倶楽部"]
    )
])
