//
//  AboutComingSoonView.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/5.
//

import SwiftUI
import AVKit

let VIDEO_URL = "https://videos.files.wordpress.com/oLcnXufh/sos.cc103_waitingforthis_16x9_dated_texted_dvcpro_1080i_mov_hd.mp4"

struct AboutNSMovieView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            //background color
            Color(BG_COLOR)
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                
                ScrollView {
                    VStack(spacing: 0.0) {
                        
                        // Video Trailer View
                        MovieTrailerView(onTapBack: {
                            dismiss()
                            //                            showDetails = false
                        })
                        
                        // Movie Poster, Rating, Genre
                        MovieGenreRatingView()
                        
                        // Release date, duration, censor
                        ReleasedSectionView()
                        
                        // StoryLine
                        StoryLineView()
                        
                        // Cast list section
                        CastListView()
                    }
                    .padding(.bottom, MARGIN_XBIG + MARGIN_XXLARGE)
                    
                }
                .padding(.top, MARGIN_XXLARGE)
                
                // Booking Floating Button
                BookingButtonView()
                
            }
            .navigationBarBackButtonHidden(true)
            
        }
        .edgesIgnoringSafeArea([.top, .bottom])
        
    }
}

struct AboutNSMovieView_Previews: PreviewProvider {
    
    static var previews: some View {
        AboutNSMovieView()
    }
}

struct MovieTrailerView: View {
    
    var onTapBack: () -> Void = {}
    
    var body: some View {
        ZStack {
            VideoPlayer(player: AVPlayer(url: URL(string: VIDEO_URL)!))
                .frame(height: MOVIE_TRAILER_HEIGHT)
            
            VStack {
                HStack{
                    Image(systemName: IC_BACK_BUTTON)
                        .resizable()
                        .frame(width: MARGIN_HALF_LARGE, height: MARGIN_LARGE)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .onTapGesture {
                            // TODO: Navigate Back
                            onTapBack()
                        }
                    Spacer()
                    
                    Image(SHARE_IMAGE)
                        .resizable()
                        .frame(width: MARGIN_LARGE, height: MARGIN_LARGE)
                    
                }
                .padding(EdgeInsets(top: MARGIN_MEDIUM_2, leading: MARGIN_LARGE, bottom: 0, trailing: MARGIN_LARGE))
                
                Spacer()
                
                //                        Button(action: {
                //
                //                        }) {
                //                            Image(systemName: IC_PLAY_BUTTON)
                //                                .resizable()
                //                                .frame(width: PLAY_BUTTON_SIZE, height: PLAY_BUTTON_SIZE)
                //                                .foregroundColor(.white).opacity(0.5)
                //                        }
                //                        .padding(.bottom, MOVIE_TRAILER_HEIGHT / 2 - MARGIN_LARGE)
                
            }
            
            
        }
        .frame(height: MOVIE_TRAILER_HEIGHT)
    }
}

struct MovieGenreRatingView: View {
    var body: some View {
        HStack{
            Image(POSTER_IMAGE)
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .frame(width: POSTER_IMAGE_WIDTH, height: POSTER_IMAGE_HEIGHT)
                .clipped()
                .cornerRadius(MARGIN_SMALL)
            
            VStack(alignment: .leading, spacing: 0.0){
                // Title, Image, Rating
                HStack{
                    // Movie Title
                    Text(MOVIE_TITLE)
                        .foregroundColor(.white)
                        .font(.system(size: MARGIN_MEDIUM_2))
                        .fontWeight(.bold)
                    
                    // Image
                    Image(IMDB_IMAGE)
                        .resizable()
                        .frame(width: MARGIN_XLARGE, height: MARGIN_MEDIUM_4)
                        .padding(.trailing, -MARGIN_MEDIUM)
                    
                    // Rating Text
                    Text("7.1")
                        .font(.system(size: MARGIN_CARD_MEDIUM_2))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                .padding(.top, MARGIN_XXLARGE)
                // Watching Type
                Text("2D, 3D, 3DIMAX, 3D DBOX")
                    .foregroundColor(.white)
                    .font(.system(size: MARGIN_HALF_LARGE))
                    .fontWeight(.bold)
                    .padding(.top, MARGIN_MEDIUM_2)
                    .padding(.bottom, MARGIN_MEDIUM_1)
                
                // Movie Type
                WrappedLayoutView()
            }
            .padding(.leading, MARGIN_SMALL)
        }
        .frame(height: POSTER_IMAGE_HEIGHT)
        .padding([.leading, .trailing], MARGIN_MEDIUM_2)
        .offset(y: -MARGIN_LARGE)
    }
}

struct MovieInfoSubView: View {
    
    var title: String
    var value: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: MARGIN_CARD_MEDIUM_2))
                .foregroundColor(.white)
                .fontWeight(.bold)
            
            Text(value)
                .font(.system(size: MARGIN_HALF_LARGE))
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.top, MARGIN_MEDIUM)
        }
        .padding()
        .background(Color(.black).opacity(0.4))
        .cornerRadius(MARGIN_MEDIUM_1)
        .shadow(color: Color(SECTION_BG_COLOR), radius: MARGIN_LARGE)
    }
}

struct StoryLineView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0){
            Text(STORY_LINE_TITLE)
                .font(.system(size: MARGIN_MEDIUM_2))
                .foregroundColor(.white)
                .fontWeight(.bold)
            
            Text("In the 1970s, young Gru tries to join a group of supervillains called the Vicious 6 after they oust their leader -- the legendary fighter Wild Knuckles. When the interview turns disastrous, Gru and his Minions go on the run with the Vicious 6 hot on their tails. Luckily, he finds an unlikely source for guidance -- Wild Knuckles himself -- and soon discovers that even bad guys need a little help from their friends.")
                .font(.system(size: MARGIN_MEDIUM_2))
                .foregroundColor(.white)
                .padding(.top, MARGIN_MEDIUM_1)
        }
        .padding(EdgeInsets(top: MARGIN_XLARGE, leading: MARGIN_MEDIUM_2, bottom: 0, trailing: MARGIN_MEDIUM_2))
    }
}

struct BookingButtonView: View {
    
    var body: some View {
        
        ZStack{
            // LinearGradient
            LinearGradient(colors: [.clear,.clear,.black.opacity(0.8),.black.opacity(0.95),.black], startPoint: .top, endPoint: .bottom)
            
            VStack{
                
                Spacer(minLength: MARGIN_XLARGE)
                
                // Booking Button
                NavigationLink(value: ViewOptionsRoute.timeSlot) {
                    BottomFloatingBtnView(text: BOOKING_BTN_LABEL)
                }
                
            }
            .frame(width: BOOKING_BTN_WIDTH, height: BOOKING_BTN_HEIGHT)
        }
        .frame(maxHeight: IMAGE_HEIGHT)
        
    }
}

struct CastListView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            Text(CAST_LABEL)
                .foregroundColor(.white)
                .font(.system(size: MARGIN_MEDIUM_2))
                .fontWeight(.bold)
            
            // Actor list
            ScrollView(.horizontal) {
                HStack(spacing: MARGIN_MEDIUM_2) {
                    ForEach(0...10, id: \.self){ _ in
                        VStack(spacing: 0.0) {
                            Image("Michelle")
                                .resizable()
                                .frame(width: MARGIN_XBIG, height: MARGIN_XBIG)
                                .cornerRadius(MARGIN_MEDIUM_4 * 2)
                            
                            Text("Michelle")
                                .font(.system(size: MARGIN_MEDIUM_2))
                                .foregroundColor(.white)
                                .padding(.top, MARGIN_MEDIUM_2)
                        }
                        .padding(.top, MARGIN_LARGE)
                        
                    }
                }
            }
            
        }
        .padding(.top, MARGIN_XLARGE)
        .padding(.leading, MARGIN_MEDIUM_2)
    }
}

struct HalfCircleView: View {
    
    var widthAndHeight: CGFloat
    
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.5)
            .fill(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.8),.black.opacity(0.9), .black]), startPoint: .top, endPoint: .bottom))
            .frame(width: widthAndHeight, height: widthAndHeight)
    }
}

struct ReleasedSectionView: View {
    var body: some View {
        HStack{
            MovieInfoSubView(title: LABEL_ONE, value: LABEL_ONE_VALUE)
            MovieInfoSubView(title: LABEL_TWO, value: LABEL_TWO_VALUE)
            MovieInfoSubView(title: LABEL_THREE, value: LABEL_THREE_VALUE)
        }
        .padding(.top, MARGIN_MEDIUM_2)
    }
}

struct BottomFloatingBtnView: View {
    
    var text: String
    
    var body: some View {
        ZStack {
            
            Text(text)
                .font(.system(size: MARGIN_MEDIUM_2))
                .foregroundColor(.black)
                .fontWeight(.bold)
                .padding()
                .frame(width: BOOKING_BTN_WIDTH, height: BOOKING_BTN_HEIGHT)
                .background(Color(PRIMARY_COLOR))
                .cornerRadius(MARGIN_MEDIUM_1)
            
            HStack {
                
                HalfCircleView(widthAndHeight: MARGIN_MEDIUM_4)
                    .rotationEffect(Angle(degrees: -90))
                
                Spacer()
                
                HalfCircleView(widthAndHeight: MARGIN_MEDIUM_4)
                    .rotationEffect(Angle(degrees: 90))
            }
            .frame(width: BOOKING_BTN_WIDTH + MARGIN_MEDIUM_4)
        }
    }
}
