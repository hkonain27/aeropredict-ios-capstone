//
//  Flight.swift
//  AeroPredict
//
//  Created by Hafsa Konain on 4/1/26.
//
import Foundation

struct Flight: Identifiable {
    let id = UUID()
    
    let flightNumber: String
    let origin: String
    let destination: String
    let date: String
    let time: String
    
    let delayProbability: Double
    let riskLevel: String
    let airline: String
}
