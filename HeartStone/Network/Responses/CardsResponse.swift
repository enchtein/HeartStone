//
//  Cards.swift
//  HeartStone
//
//  Created by enchtein on 18.04.2021.
//

import Foundation

struct CardsResponse: Codable {
  let cards: [CardInfo]
  let cardCount, pageCount, page: Int
}

struct CardInfo: Codable {
  let id, collectible: Int
  let slug: String
  let classID: Int
  let multiClassIDS: [Int]
  let cardTypeID, cardSetID, rarityID: Int
  let artistName: String
  let manaCost: Int
  let name, text: String
  let image: String
  let imageGold, flavorText: String
  let cropImage: String
  let duels: Duels?
  let spellSchoolID: Int?
  let keywordIDS: [Int]?
  let minionTypeID, health, attack, copyOfCardID: Int?
  let childIDS: [Int]?
  let durability: Int?
  
  enum CodingKeys: String, CodingKey {
    case id, collectible, slug
    case classID = "classId"
    case multiClassIDS = "multiClassIds"
    case cardTypeID = "cardTypeId"
    case cardSetID = "cardSetId"
    case rarityID = "rarityId"
    case artistName, manaCost, name, text, image, imageGold, flavorText, cropImage, duels
    case spellSchoolID = "spellSchoolId"
    case keywordIDS = "keywordIds"
    case minionTypeID = "minionTypeId"
    case health, attack
    case copyOfCardID = "copyOfCardId"
    case childIDS = "childIds"
    case durability
  }
}

struct Duels: Codable {
  let relevant, constructed: Bool
}
