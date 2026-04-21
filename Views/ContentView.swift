//
//  ContentView.swift
//  AeroPredict
//
//  Created by Hafsa Konain on 4/1/26.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }

            NavigationStack {
                SavedFlightsView()
            }
            .tabItem {
                Label("Saved", systemImage: "bookmark.fill")
            }

            NavigationStack {
                DashboardView()
            }
            .tabItem {
                Label("Dashboard", systemImage: "chart.bar.fill")
            }

            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
        }
        .tint(.blue)
    }
}

#Preview {
    ContentView()
}
