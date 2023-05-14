//
//  MovieBannerView.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/5.
//

import SwiftUI

struct MovieBannerView: View {
    
    var onTapMovie: () -> Void = {}
    
    init(onTapMovie: @escaping () -> Void) {
        self.onTapMovie = onTapMovie
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color(PRIMARY_COLOR))
        UIPageControl.appearance().pageIndicatorTintColor = .gray
    }
    
    var body: some View {
        TabView {
            ForEach(0...5, id: \.self) { _ in
                
                Image(BANNER_IMAGE)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: BANNER_HEIGHT, maxHeight: BANNER_HEIGHT)
                    .clipped()
                    .padding(.bottom, MARGIN_XLARGE)
                    .onTapGesture {
                        onTapMovie()
                    }
             
            }
        }
        .tabViewStyle(.page)
        .frame(height: BANNER_HEIGHT)
    }
}

struct MovieBannerView_Previews: PreviewProvider {
    static var previews: some View {
        MovieBannerView(onTapMovie: {})
    }
}
