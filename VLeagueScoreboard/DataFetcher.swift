//
//  DataFetcher.swift
//  VLeagueScoreboard
//
//  Created by Long, Tran Hoang on 1/14/18.
//  Copyright © 2018 VLA. All rights reserved.
//

import Foundation
import WebKit

class VleagueParser {
    var year: Int = 0
    var round: Int = 0
    
    func praser(){
        var url: String = "http://www.vnleague.com/vdqg-vleague/ket-qua/" + String(year) + "-" + String(round) + "-Ket-qua-thong-ke-giai-vdqg-vleague-Toyota.html"
        let TEAM_NAME_REGEX: String = "title=\"Xem đội bóng\"><b>(.{0,30})<//b><"
        if let url = URL(string: url) {
            do {
                let regex = try NSRegularExpression(pattern: TEAM_NAME_REGEX)
                let contents = try String(contentsOf: url)
                let results = regex.matches(in: contents, range: NSRange(location: 0, length: contents.characters.count))
                let third = results[0].rangeAt(3)
                print(results)
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
    }
    func capturedGroups(withRegex pattern: String) -> [String] {
        var results = [String]()
        var aaa: String = "http://www.vnleague.com/vdqg-vleague/ket-qua/" + String(year) + "-" + String(round) + "-Ket-qua-thong-ke-giai-vdqg-vleague-Toyota.html"
        
        var regex: NSRegularExpression
        var contents: String = ""
        let TEAM_NAME_REGEX: String = "title=\"Xem đội bóng\"><b>(.{0,30})<//b><"
        if let url = URL(string: aaa) {
            do {
                contents = try String(contentsOf: url)
                
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
        do {
            regex = try NSRegularExpression(pattern: TEAM_NAME_REGEX, options: [])
        } catch {
            return results
        }
        
        let matches = regex.matches(in: contents, options: [], range: NSRange(location:0, length: contents.characters.count))
        
        guard let match = matches.first else { return results }
        
        let lastRangeIndex = match.numberOfRanges - 1
        guard lastRangeIndex >= 1 else { return results }
        
        for i in 1...lastRangeIndex {
            let capturedGroupIndex = match.rangeAt(i)
            let matchedString = (contents as NSString).substring(with: capturedGroupIndex)
            results.append(matchedString)
        }
        
        return results
    }
}
