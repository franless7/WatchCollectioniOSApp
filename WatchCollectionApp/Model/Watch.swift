//
//  Watch.swift
//  WatchCollectionApp
//
//  Created by Fatih Yörük on 23.12.2023.
//

import Foundation

struct Watch: Codable {
    let id: Int
    let title: String
    let watchName: String
    let marketPriceEuro: String?
    let brand: String
    let family: String
    let model: String
    let limited: String
    let caseMaterial: String
    let caseGlass: String
    let caseBack: String
    let caseShape: String?
    let caseDiameter: String
    let caseHeight: String?
    let caseLugWidth: String?
    let caseWr: String
    let dialColor: String
    let dialIndexes: String
    let dialHands: String
    let movementAcoustic: String?
    let movementBrand: String
    let movementCaliber: String
    let movementChronograph: String?
    let movementDate: String
    let movementDiameter: String
    let movementDisplay: String
    let movementFrequency: String?
    let movementJewels: String
    let movementReserve: String?
    let movementTime: String
    let movementType: String
}


/*
 id:574928
 title:"L & Jr S1301"
 watchName:"Step One Day & Date Stainless Steel / PVD / Silver"
 marketPriceEuro:null
 brand:"L & Jr"
 family:"Step One"
 model:"S1301"
 limited:"No"
 caseMaterial:"Stainless steel"
 caseGlass:"Sapphire"
 caseBack:"Closed"
 caseShape:null
 caseDiameter:"45.00 mm"
 caseHeight:null
 caseLugWidth:null
 caseWr:"50.00 m"
 dialColor:"Silver"
 dialIndexes:"None"
 dialHands:"Sword"
 movementAcoustic:null
 movementBrand:"Ronda"
 movementCaliber:"7004.N"
 movementChronograph:null
 movementDate:"Big Date, Day"
 movementDiameter:"33.80 mm"
 movementDisplay:"Analog"
 movementFrequency:null
 movementJewels:"6"
 movementReserve:null
 movementTime:"Hours, Minutes, Small Seconds"
 movementType:"Quartz"
 
 */
