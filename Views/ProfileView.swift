//
//  ProfileView.swift
//  AeroPredict
//
//  Created by Hafsa Konain on 4/1/26.
//
import SwiftUI

struct ProfileView: View {
    @State private var notificationsOn: Bool = true

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
                // 👤 USER INFO
                VStack(spacing: 10) {
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 72))
                        .foregroundColor(.blue)

                    Text("Hafsa Konain")
                        .font(.title2)
                        .fontWeight(.bold)

                    Text("hkonain@charlotte.edu")
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity)
                .padding()

                // 📋 SETTINGS LIST
                VStack(spacing: 0) {

                    NavigationLink(destination: EditProfileView()) {
                        ProfileRow(title: "Edit Profile", icon: "pencil")
                    }
                    .buttonStyle(.plain)

                    Divider()

                    NavigationLink(destination: PreferencesView()) {
                        ProfileRow(title: "Preferences", icon: "gearshape")
                    }
                    .buttonStyle(.plain)

                    Divider()

                    Toggle(isOn: $notificationsOn) {
                        Label("Notification Settings", systemImage: "bell")
                    }
                    .padding()

                    Divider()

                    NavigationLink(destination: AboutView()) {
                        ProfileRow(title: "About AeroPredict", icon: "info.circle")
                    }
                    .buttonStyle(.plain)
                }
                .background(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(.systemGray5), lineWidth: 1)
                )
                .cornerRadius(16)
            }
            .padding()
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// 🔹 ROW UI
struct ProfileRow: View {
    let title: String
    let icon: String

    var body: some View {
        HStack {
            Label(title, systemImage: icon)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

// 🔹 EDIT PROFILE SCREEN
struct EditProfileView: View {
    var body: some View {
        VStack {
            Text("Edit Profile Screen")
                .font(.title)
            Spacer()
        }
        .padding()
        .navigationTitle("Edit Profile")
    }
}

// 🔹 PREFERENCES SCREEN
struct PreferencesView: View {
    var body: some View {
        VStack {
            Text("Preferences Screen")
                .font(.title)
            Spacer()
        }
        .padding()
        .navigationTitle("Preferences")
    }
}

// 🔹 ABOUT SCREEN
struct AboutView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("AeroPredict")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("A flight delay prediction app that helps users make smarter travel decisions using data insights.")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)

            Spacer()
        }
        .padding()
        .navigationTitle("About")
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}
