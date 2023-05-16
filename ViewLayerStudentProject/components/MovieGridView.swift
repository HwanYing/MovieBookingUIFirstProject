//
//  MovieGridView.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/5.
//

import SwiftUI

struct MovieGridView: View {
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var sectionName: String
    
//    var onTapMovie: () -> Void = {}
//
//    init(onTapMovie: @escaping () -> Void, sectionName: String) {
//        self.onTapMovie = onTapMovie
//        self.sectionName = sectionName
//    }
    init(sectionName: String) {
        self.sectionName = sectionName
    }
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns, spacing: MARGIN_MEDIUM_4) {
                ForEach(1...10, id: \.self) { item in
                    NavigationLink(value: ViewOptionsRoute.movieDetails){
                            if sectionName == MOVIE_SECTION_TYPE {
                                MovieCardView()
                            } else {
                                ComingSoonCardView()
                            }

                        }
                }
            }
            .padding([.leading, .trailing], MARGIN_MEDIUM_1)
        }
    }
}

struct MovieGridView_Previews: PreviewProvider {
    
    static var previews: some View {
        MovieGridView(sectionName: "")
    }
}

struct GridStack<Content: View>: View {
    
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self){ row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}
