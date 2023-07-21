//
//  ContentView.swift
//  SampleApp
//
//  Created by 박상훈 on 2023/07/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView().tabItem{
                Label("Home", systemImage: "person")
                }
            StoryView().tabItem{
                Label("Story", systemImage: "book")
            }
            SettingView().tabItem{
                Label("Setting", systemImage: "heart")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
