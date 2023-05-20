//
//  ComingSoonCardView.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/5.
//

import SwiftUI

struct ComingSoonCardView: View {
    
    let now = Date.now
    let tomorrow = Date.now.addingTimeInterval(86400)
    let nextDay = Date.now.addingTimeInterval(86400*5)

    @State var Datelabel = ""
    
    var body: some View {
        ZStack {
            
            Color(.black)
            
            VStack(alignment: .leading, spacing: 0.0){
                
                // movie image
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                    
                    Image(POSTER_IMAGE_TWO)
                        .resizable()
                        .frame(width: MOVIE_CARD_WIDTH, height: MOVIE_IMAGE_HEIGHT)
                    // Gradient Color
                    LinearGradient(colors: [.clear,.clear,.clear, Color(.black)], startPoint: .top, endPoint: .bottom)
                    
                    // Air date text
                    Text("\(Datelabel)th MAY")
                        .foregroundColor(Color(SECTION_BG_COLOR))
                        .font(.system(size: MARGIN_MEDIUM_1))
                        .fontWeight(.semibold)
                        .padding(MARGIN_SMALL)
//                        .frame(width: 33, height: 30)
                        .background(Color(PRIMARY_COLOR))
                        .cornerRadius(MARGIN_MEDIUM)
                        .padding(EdgeInsets(top: MARGIN_MEDIUM, leading: 130, bottom: 0, trailing: 0))
                        
                }
                // Title View
                HStack{
                    // Title
                    Text("Minions The rise of Gru")
                        .foregroundColor(.white)
                        .font(.system(size: MARGIN_CARD_MEDIUM_2))
                        .fontWeight(.semibold)
                        .lineLimit(1)
                    
                    Spacer()
                    // Image
                    Image(IMDB_IMAGE)
                        .resizable()
                        .frame(width: MARGIN_XLARGE, height: MARGIN_MEDIUM_4)
                        .padding(.trailing, -MARGIN_MEDIUM)

                    // Rating Text
                    Text("9.8")
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
                    Text("2D")
                        .foregroundColor(.white)
                        .font(.system(size: MARGIN_MEDIUM_1))
                }
                .padding(EdgeInsets(top: MARGIN_CARD_MEDIUM_2, leading: MARGIN_MEDIUM, bottom: MARGIN_MEDIUM_4, trailing: MARGIN_MEDIUM))
            }
            .onAppear(){
                createDateLabel()
            }
        }
        .frame(width: MOVIE_CARD_WIDTH, height: MOVIE_CARD_HEIGHT)
        .cornerRadius(MARGIN_MEDIUM)
    }
    func createDateLabel() {
        let components = Calendar.current.dateComponents([.day, .hour, .minute], from: nextDay)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        let day = components.day ?? 1
        Datelabel = "\(day)"
    }
}

struct ComingSoonCardView_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoonCardView()
//            .previewLayout(.fixed(width: 171, height: 279))
    }
}
