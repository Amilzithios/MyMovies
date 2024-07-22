//
//  HomeView.swift
//  MyMovie
//
//  Created by Amilzith on 22/07/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            GeometryReader(){ geometry in
                VStack(alignment: .leading) {
                    Group{
                        ScrollViewReader { proxy in
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHGrid(rows: [GridItem(.flexible())]) {
                                    ForEach(0...5, id: \.self) { index in
                                        Image("Batman_Movie")
                                            .resizable()
                                            .frame(width: geometry.size.width)
                                    }
                                }
                            }
                        }
                    }
                    .frame(height: 300)
                    .padding(.bottom, 20)
                    VStack {
                        Text("Recentely Viewed")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                        Spacer()
                    }
                    Spacer()
                }
                .navigationTitle("Movie")
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    HomeView()
}

struct BannerImage: View {
    let path: String
    let width: CGFloat

    var body: some View {
        AsyncImage(url: URL(string: path)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width)
                .clipped()
                .clipShape(.rect(cornerRadius: 8))
        } placeholder: {
            Rectangle().foregroundColor(.clear)
            ProgressView()
        }
    }
}
