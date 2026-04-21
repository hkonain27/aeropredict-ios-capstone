//
//  SavedFlightsView.swift
//  AeroPredict
//
//  Created by Hafsa Konain on 4/1/26.
//

import SwiftUI

struct SavedFlightsView: View {
    
    
    let flights = [
        Flight(flightNumber: "AA203", origin: "CLT", destination: "JFK", date: "May 20", time: "10:15 AM", delayProbability: 0.72, riskLevel: "High", airline: "American"),
        
        Flight(flightNumber: "DL120", origin: "ATL", destination: "LAX", date: "May 21", time: "1:30 PM", delayProbability: 0.35, riskLevel: "Medium", airline: "Delta"),
        
        Flight(flightNumber: "UA300", origin: "IAD", destination: "ORD", date: "May 22", time: "9:00 AM", delayProbability: 0.18, riskLevel: "Low", airline: "United")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 14) {
                
            
                ForEach(flights) { flight in
                    NavigationLink(destination: PredictionView()) {
                        SavedFlightCard(flight: flight)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
        }
        .navigationTitle("Saved Flights")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SavedFlightCard: View {
    
    let flight: Flight
    
    var riskColor: Color {
        switch flight.riskLevel.lowercased() {
        case "high": return .red
        case "medium": return .orange
        default: return .green
        }
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(flight.flightNumber)
                    .font(.headline)
                
                Text("\(flight.origin) → \(flight.destination)")
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 6) {
                
                Text("\(Int(flight.delayProbability * 100))%")
                    .fontWeight(.semibold)
                
                Text(flight.riskLevel)
                    .font(.caption)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(riskColor.opacity(0.15))
                    .foregroundColor(riskColor)
                    .cornerRadius(12)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color(.systemGray5), lineWidth: 1)
        )
        .cornerRadius(14)
    }
}

#Preview {
    NavigationStack {
        SavedFlightsView()
    }
}
