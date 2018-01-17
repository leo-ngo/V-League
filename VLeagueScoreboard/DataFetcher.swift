//
//  DataFetcher.swift
//  VLeagueScoreboard
//
//  RMIT University Vietnam
//  Course: COSC2659 iOS Development
//  Semester: 2017C
//  Assignment: 3
//  Team: ALV
//  Authors: Vuong Hung Ngo, Long Hoang Tran, Arofando Hadi
//  ID: s3610887, s3635165, s3618954
//  Created date: 17/01/2018
//  Acknowledgement: http://www.vnleague.com/

import Foundation
import WebKit

/**
 * Intantiate with a year as argument and call getTeamList() method to get that year's ranking
 */

class VleagueParser {
    var year: Int
    var url: String
    // TODO: limit year range
    let TEAM_NAME_REGEX: String = "(\\d+)</td>.{0,200}<b>(.{0,50})</b></a><.{0,50}><b>(\\d+).{0,50}>(\\d+)<.{0,50}>(\\d+)<.{0,50}>(\\d+)<.{0,50}>(\\d+)<.{0,50}>(\\d+)<.{0,50}>(\\d+)<.{0,50}>(-*\\d+)<.{0,50}>(\\d+)<.{0,50}>(\\d+)<.{0,50}>(\\d+)<"
    init(year: Int) {
        self.year = year
        url = "http://www.vnleague.com/vdqg-vleague/bang-xep-hang/" + String(year) + "-0-Bang-xep-hang-vdqg-vleague-Toyota.html"
    }
    
    func getTeamCount() -> Int {
        if let url = URL(string: url) {
            do {
                let regex = try NSRegularExpression(pattern: TEAM_NAME_REGEX)
                let contents = try String(contentsOf: url)
                let results = regex.matches(in: contents, range: NSRange(location: 0, length: contents.characters.count))
                return results.count
            } catch {}
        }
        return 0
    }
    
    func getTeamList() -> [Team] {
        var teamList = [Team]()
        if let url = URL(string: url) {
            do {
                let regex = try NSRegularExpression(pattern: TEAM_NAME_REGEX)
                let contents = try String(contentsOf: url)
                let results = regex.matches(in: contents, range: NSRange(location: 0, length: contents.characters.count))
                for j in 1...results.count {
                    var properties = [String]()
                    for i in 1...13 {
                        let property = results[j - 1].rangeAt(i)
                        properties.append(contents.substring(with: contents.index(contents.startIndex, offsetBy: property.location)..<contents.index(contents.startIndex, offsetBy: property.location + property.length)))
                    }
                    var team = Team()
                    team.rank = Int(properties[0]) ?? 0
                    team.name = properties[1]
                    team.matches = Int(properties[2]) ?? 0
                    team.wins = Int(properties[3]) ?? 0
                    team.draws = Int(properties[4]) ?? 0
                    team.losses = Int(properties[5]) ?? 0
                    team.goalsFor = Int(properties[6]) ?? 0
                    team.goalsForAway = Int(properties[7]) ?? 0
                    team.goalsAgainst = Int(properties[8]) ?? 0
                    team.goalDifference = Int(properties[9]) ?? 0
                    team.yellowCards = Int(properties[10]) ?? 0
                    team.redCards = Int(properties[11]) ?? 0
                    team.points = Int(properties[12]) ?? 0
                    teamList.append(team)
                }
            } catch {}
        } else {}
        return teamList
    }
}
