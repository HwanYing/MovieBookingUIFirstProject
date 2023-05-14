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
    @State var stateId = 0
    
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
//                    if sectionName == MOVIE_SECTION_TYPE {
                        
                        NavigationLink(value: item){
                            if sectionName == MOVIE_SECTION_TYPE {
                                MovieCardView()
                            } else {
                                ComingSoonCardView()
                            }

                        }.navigationDestination(for: Int.self, destination: { _ in
                            if sectionName == MOVIE_SECTION_TYPE {
                                AboutNSMovieView(stateId: $stateId)
                            } else {
                                AboutCSMovieView()
                            }
                        })
//                        MovieCardView()
//                            .onTapGesture {
//                                onTapMovie()
//                            }
//                    } else {
//                        ComingSoonCardView()
//                            .onTapGesture {
//                                onTapMovie()
//                            }
//                    }
                }
            }
            .padding([.leading, .trailing], MARGIN_MEDIUM_1)
        }
    }
}

struct MovieGridView_Previews: PreviewProvider {
    static var previews: some View {
        MovieGridView(sectionName: "") // onTapMovie: {}, sectionName: ""
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
