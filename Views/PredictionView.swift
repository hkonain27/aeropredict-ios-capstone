//
//  PredictionView.swift
//  AeroPredict
//
//  Created by Hafsa Konain on 4/1/26.
//

import SwiftUI

struct PredictionView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                VStack(spacing: 6) {
                    Text("AA203")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Charlotte (CLT) → New York (JFK)")
                        .foregroundColor(.secondary)

                    Text("May 20, 2024 • 10:15 AM")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                HStack(spacing: 12) {
                    StatCard(title: "Delay Probability", value: "72%", valueColor: .red)
                    StatCard(title: "Risk Level", value: "HIGH", valueColor: .red)
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("Contributing Factors")
                        .font(.headline)

                    FactorRow(title: "Weather Conditions", impact: "High impact", color: .red)
                    FactorRow(title: "Air Traffic", impact: "Medium impact", color: .orange)
                    FactorRow(title: "Aircraft Maintenance", impact: "Medium impact", color: .orange)
                    FactorRow(title: "Historical Performance", impact: "High impact", color: .red)
                }
                .padding()
                .background(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(.systemGray5), lineWidth: 1)
                )
                .cornerRadius(16)

                Button {
                } label: {
                    Text("Save Flight")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            .padding()
        }
        .navigationTitle("Prediction Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct StatCard: View {
    let title: String
    let value: String
    let valueColor: Color

    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(valueColor)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemBackground))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(.systemGray5), lineWidth: 1)
        )
        .cornerRadius(16)
    }
}

struct FactorRow: View {
    let title: String
    let impact: String
    let color: Color

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(impact)
                .font(.caption)
                .foregroundColor(color)
        }
    }
}

#Preview {
    NavigationStack {
        PredictionView()
    }
}
