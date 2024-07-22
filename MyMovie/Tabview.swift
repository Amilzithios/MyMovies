//
//  Tabview.swift
//  MyMovie
//
//  Created by Amilzith on 22/07/24.
//

import SwiftUI
enum BottomBarSelectedTab:Int{
    case home = 1
    case music = 2
    case account = 3
}

struct Tabview: View {
    @State private var selectedTab = 1
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                HomeView().tabItem {
                    BottomBarIconView(image: "house", text: "Movie", isActive: selectedTab == BottomBarSelectedTab.home.rawValue)
                }.tag(1)
                MusicView().tabItem {
                    BottomBarIconView(image: "music.note", text: "Music", isActive: selectedTab == BottomBarSelectedTab.music.rawValue)
                }.tag(2)
                MusicView().tabItem {
                    BottomBarIconView(image: "person.crop.circle.fill", text: "Account", isActive: selectedTab == BottomBarSelectedTab.music.rawValue)
                }.tag(3)
            }
            .accentColor(Color.white)
            .onChange(of: selectedTab) { oldState, newState in
                selectedTab = newState
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .preferredColorScheme(.dark)
    }
}

#Preview {
    Tabview()
}

struct BottomBarIconView: View {
    
    var image:String
    var text:String
    var isActive:Bool
    
    var body: some View {
        HStack(spacing: 10){
            GeometryReader{
                geo in
                VStack(spacing: 3){
                    Rectangle()
                        .frame(height: 0)
                    Image(systemName: image)
                        .resizable()
                        .frame(width: 24,height: 24)
                        .foregroundColor(isActive ? .blue : .gray)
                    Text(text)
                        .font(.caption)
                        .foregroundColor(isActive ? .blue : .gray)
                }
            }
            
        }
    }
}

