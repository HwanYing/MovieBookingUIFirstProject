//
//  MovieCardView.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/5.
//

import SwiftUI

struct MovieCardView: View {
    var body: some View {
        ZStack {
           
            Color(.black)
                
            VStack(alignment: .leading, spacing: 0.0){
                
                // movie image
                ZStack {
                    
                    Image(POSTER_IMAGE)
                        .resizable()
                    .frame(width: MOVIE_CARD_WIDTH, height: MOVIE_IMAGE_HEIGHT)
                    // Gradient Color
                    LinearGradient(colors: [.clear,.clear,.clear, Color(.black)], startPoint: .top, endPoint: .bottom)
                }
                    // Title View
                    HStack{
                        // Title
                        Text(MOVIE_TITLE)
                            .foregroundColor(.white)
                            .font(.system(size: MARGIN_CARD_MEDIUM_2))
                            .fontWeight(.semibold)
                        
                        Spacer()
                        // Image
                        Image(IMDB_IMAGE)
                            .resizable()
                            .frame(width: MARGIN_XLARGE, height: MARGIN_MEDIUM_4)
                            .padding(.trailing, -MARGIN_MEDIUM)

                        // Rating Text
                        Text("9.0")
                            .font(.system(size: MARGIN_CARD_MEDIUM_2))
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                        
                    }
                    .padding([.leading, .trailing], MARGIN_MEDIUM)

                    // Movie Type
                    HStack{
                        Text(LABEL_ONE_VALUE)
                            .foregroundColor(.white)
                            .font(.system(size: MARGIN_CARD_MEDIUM_2))
                            .fontWeight(.semibold)
                        // dot image
                        Circle()
                            .foregroundColor(Color(CIRCLE_COLOR))
                            .frame(width: MARGIN_SMALL, height: MARGIN_SMALL)
                        Text("2D, 3D, 3D IMAX")
                            .foregroundColor(.white)
                            .font(.system(size: MARGIN_MEDIUM_1))
                    }
                    .padding(EdgeInsets(top: MARGIN_CARD_MEDIUM_2, leading: MARGIN_MEDIUM, bottom: MARGIN_MEDIUM_4, trailing: MARGIN_MEDIUM))
                }

        }
        .frame(width: MOVIE_CARD_WIDTH, height: MOVIE_CARD_HEIGHT)
        .cornerRadius(MARGIN_MEDIUM)
    }
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView()
//            .previewLayout(.fixed(width: 171, height: 279))
    }
}
