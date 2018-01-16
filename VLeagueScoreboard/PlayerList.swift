//
//  PlayerList.swift
//  VLeagueScoreboard
//
//  Created by Vuong, Ngo Hung on 1/17/18.
//  Copyright © 2018 VLA. All rights reserved.
//

import Foundation
class PlayerList {
    var url: String = ""
    let PLAYER_LIST_REGEX = "align=\"center\">(\\d+)<.{0,100}src=\"(/images/flags/.{0,20}\\.png)\".{0,100}> (.{0,30})</td><td align=\"center\">(\\d*)</td><td align=\"center\">(\\d*)</td><td align=\"center\">(.{0,10})</td><td align=\"center\">(\\d*)</td>"
    init(teamName: String) {
        switch teamName {
        case "Quảng Nam":
            url = "http://www.vnleague.com/doi-bong/26-Quang-Nam.html"
        case "FLC Thanh Hóa":
            url = "http://www.vnleague.com/doi-bong/11-FLC-Thanh-Hoa.html"
        case "Hà Nội":
            url = "http://www.vnleague.com/doi-bong/5-Ha-Noi.html"
        case "Than Quảng Ninh":
            url = "http://www.vnleague.com/doi-bong/27-Than-Quang-Ninh.html"
        case "Sài Gòn":
            url = "http://www.vnleague.com/doi-bong/16-Sai-Gon.html"
        case "Sanna Khánh Hòa BVN":
            url = "http://www.vnleague.com/doi-bong/30-Sanna-Khanh-Hoa-BVN.html"
        case "Hải Phòng":
            url = "http://www.vnleague.com/doi-bong/9-Hai-Phong.html"
        case "Sông Lam Nghệ An":
            url = "http://www.vnleague.com/doi-bong/6-Song-Lam-Nghe-An.html"
        case "SHB Đà Nẵng":
            url = "http://www.vnleague.com/doi-bong/7-SHB-Da-Nang.html"
        case "Hoàng Anh Gia Lai":
            url = "http://www.vnleague.com/doi-bong/13-Hoang-Anh-Gia-Lai.html"
        case "Becamex Bình Dương":
            url = "http://www.vnleague.com/doi-bong/12-Becamex-Binh-Duong.html"
        case "TP Hồ Chí Minh":
            url = "http://www.vnleague.com/doi-bong/31-TP-Ho-Chi-Minh.html"
        case "XSKT Cần Thơ":
            url = "http://www.vnleague.com/doi-bong/22-XSKT-Can-Tho.html"
        case "Long An":
            url = "http://www.vnleague.com/doi-bong/25-Long-An.html"
        default:
            url = ""
        }
    }
    
    func get() -> [Player] {
        var players = [Player]()
        if let url = URL(string: url) {
            do {
                let regex = try NSRegularExpression(pattern: PLAYER_LIST_REGEX)
                let contents = try String(contentsOf: url)
                let results = regex.matches(in: contents, range: NSRange(location: 0, length: contents.characters.count))
                for j in 1...results.count {
                    var properties = [String]()
                    for i in 1...7 {
                        let property = results[j - 1].rangeAt(i)
                        properties.append(contents.substring(with: contents.index(contents.startIndex, offsetBy: property.location)..<contents.index(contents.startIndex, offsetBy: property.location + property.length)))
                    }
                    let player = Player(name: properties[2], number: properties[0], position: properties[5])
                    players.append(player)
                }
                
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
        return players
    }
}
