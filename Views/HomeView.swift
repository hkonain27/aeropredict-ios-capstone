//
//  HomeView.swift
//  AeroPredict
//
//  Created by Hafsa Konain on 4/1/26.
//
import SwiftUI

struct HomeView: View {
    @State private var flightNumber: String = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("AeroPredict")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Smarter flight predictions, better travel.")
                    .foregroundColor(.secondary)

                HStack(spacing: 8) {
                    TagView(title: "Search")
                    TagView(title: "Trending")
                    TagView(title: "Airlines")
                }

                VStack(spacing: 12) {
                    TextField("Enter flight number or route", text: $flightNumber)
                        .textFieldStyle(.roundedBorder)

                    NavigationLink(destination: PredictionView()) {
                        Text("Predict Delay")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("Recent Searches")
                        .font(.headline)

                    FlightRowCard(flightNumber: "AA203", route: "CLT → JFK", risk: "High")
                    FlightRowCard(flightNumber: "DL120", route: "ATL → LAX", risk: "Medium")
                    FlightRowCard(flightNumber: "UA300", route: "IAD → ORD", risk: "Low")
                }
            }
            .padding()
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TagView: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.caption)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color(.systemGray6))
            .cornerRadius(16)
    }
}

struct FlightRowCard: View {
    let flightNumber: String
    let route: String
    let risk: String

    var riskColor: Color {
        switch risk.lowercased() {
        case "high": return .red
        case "medium": return .orange
        default: return .green
        }
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(flightNumber)
                    .font(.headline)
                Text(route)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }

            Spacer()

            Text(risk)
                .font(.caption)
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(riskColor.opacity(0.15))
                .foregroundColor(riskColor)
                .cornerRadius(12)
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
        HomeView()
    }
}
