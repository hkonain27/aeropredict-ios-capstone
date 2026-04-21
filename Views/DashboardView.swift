//
//  DashboardView.swift
//  AeroPredict
//
//  Created by Hafsa Konain on 4/1/26.
//
import SwiftUI

struct DashboardView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Delay Trends (Last 7 Days)")
                        .font(.headline)

                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue.opacity(0.12))
                        .frame(height: 180)
                        .overlay(
                            VStack {
                                Image(systemName: "chart.line.uptrend.xyaxis")
                                    .font(.system(size: 42))
                                    .foregroundColor(.blue)
                                Text("Trend Chart Placeholder")
                                    .foregroundColor(.secondary)
                            }
                        )
                }
                .padding()
                .background(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(.systemGray5), lineWidth: 1)
                )
                .cornerRadius(16)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Top Delayed Airlines")
                        .font(.headline)

                    AirlineRow(name: "American Airlines", percent: "72%")
                    AirlineRow(name: "Delta Airlines", percent: "55%")
                    AirlineRow(name: "United Airlines", percent: "41%")
                    AirlineRow(name: "Southwest Airlines", percent: "28%")
                }
                .padding()
                .background(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(.systemGray5), lineWidth: 1)
                )
                .cornerRadius(16)
            }
            .padding()
        }
        .navigationTitle("Dashboard")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AirlineRow: View {
    let name: String
    let percent: String

    var body: some View {
        HStack {
            Text(name)
            Spacer()
            Text(percent)
                .fontWeight(.semibold)
                .foregroundColor(.blue)
        }
    }
}

#Preview {
    NavigationStack {
        DashboardView()
    }
}

