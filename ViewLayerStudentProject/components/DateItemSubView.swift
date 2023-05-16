//
//  DateItemSubView.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/12.
//

import SwiftUI

struct DateItemSubView: View {
    
    var date: Int
    var day: String
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
            DateBackgroundView(day: day)
            
            VStack(spacing: 0.0) {
                Text(day)
                    .font(.system(size: MARGIN_HALF_LARGE))
                    .fontWeight(.medium)
                
                Text("May")
                    .font(.system(size: MARGIN_HALF_LARGE))
                    .fontWeight(.medium)
                    .padding(.top,MARGIN_MEDIUM - 1)
                
                Text("\(date)")
                    .font(.system(size: MARGIN_MEDIUM_2))
                    .fontWeight(.medium)
                    .padding(.top, MARGIN_SMALL + 1)
                
            }
            .foregroundColor(Color(.black))
            .padding(.top, MARGIN_MEDIUM_4)
            
        })
        .frame(width: MARGIN_XBIG + MARGIN_SMALL, height: MARGIN_XBIG + MARGIN_MEDIUM_2 - 1)
    }
}

struct DateItemSubView_Previews: PreviewProvider {
    static var previews: some View {
        DateItemSubView(date: 0, day: "")
    }
}
