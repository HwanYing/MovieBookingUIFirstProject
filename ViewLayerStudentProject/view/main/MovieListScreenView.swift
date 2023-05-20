//
//  MovieListScreenView.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/4.
//

import SwiftUI

struct MovieListScreenView: View {
    
    @State var currentSelection = MOVIE_SECTION_TYPE
    @State var showDetails = false
    @Binding var region: String
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color(BG_COLOR)
                
                VStack{
                    // App Bar
                    AppBarView(region: $region)
                    
                    ScrollView{
                        // Banner View
                        MovieBannerView(onTapMovie: {
                            
                        })
                        
                        // Movie Selection
                        MovieSelectionView(selection: $currentSelection)
                        
                        // Movie Grid Section
                        MovieGridView(sectionName: currentSelection)
                            .padding(.top, MARGIN_MEDIUM_2)
                    
                    }
                    
                }
                
            }
            .edgesIgnoringSafeArea([.top, .bottom])
            .navigationDestination(for: ViewOptionsRoute.self, destination: { route in
                route.view
            })
//            .navigationDestination(for: Int.self, destination: { _ in
//                if currentSelection == MOVIE_SECTION_TYPE {
//                    AboutNSMovieView()
//                } else if currentSelection == MOVIE_SECTION_TYPE_NEXT{
//                    AboutCSMovieView()
//                }
//            })
        }

    }
}

struct MovieListScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreenView(region: .constant(""))
    }
}

struct AppBarView: View {
    
    @Binding var region: String
    
    var body: some View {
        HStack{
            // location icon
            Image(systemName: IC_LOCATION)
                .resizable()
                .frame(width: MARGIN_MEDIUM_2, height: MARGIN_MEDIUM_2)
                .foregroundColor(.white)
            
            // Location
            Text(region)
                .foregroundColor(.white)
                .font(.system(size: MARGIN_MEDIUM_3))
                .fontWeight(.bold)
            
            Spacer()
            
            // search icon
            Image(systemName: IC_SEARCH)
                .foregroundColor(.white)
            
            Image(systemName: IC_NOTIFICATION)
                .foregroundColor(.white)
            
            Image(systemName: IC_SCAN_FINDER)
                .foregroundColor(.white)
        }
        .padding(EdgeInsets(top: TEXT_XBIG, leading: MARGIN_CARD_MEDIUM_2, bottom: 0, trailing: MARGIN_CARD_MEDIUM_2))
        
    }
}


struct MovieSelectionView: View {
    
    @State var movieSection: [MovieSectionVO] = movieSectionData
    @Binding var selection: String
    
    var body: some View {
        HStack {
            ForEach(movieSection) { section in
                Text(section.sectionName)
                    .foregroundColor(Color(SUB_TEXT_COLOR))
                    .font(.system(size: MARGIN_MEDIUM_2))
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: MARGIN_MEDIUM_1, leading: MARGIN_LARGE, bottom: MARGIN_MEDIUM_1, trailing: MARGIN_LARGE))
                    .frame(width: (UIScreen.main.bounds.width - MARGIN_XXLARGE) / 2, height: MARGIN_MEDIUM_4 * 2)
                    .background(section.sectionName == selection ? Color(PRIMARY_COLOR) : Color(.clear))
                    .cornerRadius(MARGIN_MEDIUM)
                    .onTapGesture {
                        selection = section.sectionName
                    }
            }
        }
        .padding(8)
        .frame(width: UIScreen.main.bounds.width - MARGIN_LARGE, height: MARGIN_XXLARGE + MARGIN_MEDIUM)
        .background(Color(SECTION_ICON_COLOR))
        .cornerRadius(MARGIN_MEDIUM)
//        .padding(.top, MARGIN_MEDIUM)
    }
}
