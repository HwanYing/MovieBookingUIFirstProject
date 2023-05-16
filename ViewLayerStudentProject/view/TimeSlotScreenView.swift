//
//  TimeSlotScreenView.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/12.
//

import SwiftUI

struct TimeSlotScreenView: View {
    
    let cinemaPlace = [1: "JCGV:Junction City", 2: "JCGV: City Mall", 3: "Mingalar Cinema Gold Class", 4: "Thamata Cinema", 5: "Nawaday Cinema", 6: "Shae Saung Cinema"]
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack{
            Color(BG_COLOR)
            VStack(spacing: 0){
                // AppBar
                AppBar(){
                    dismiss()
                }
                
                // DateList
                DateListView()
                    .padding(.top, MARGIN_XLARGE)
                
                // Viewingtype Section
                ViewingTypeSectionView()
                    .padding(.top, MARGIN_LARGE)
                
                // TimeSlot Color section
                TimeSlotColorsView()
                    .padding(.top, MARGIN_LARGE)
                
                // TimeSlots and hint section
                ScrollView(.vertical) {
                    ForEach(1...cinemaPlace.count, id: \.self){ number in
                        // Time slot item
                        CinemaAndTimeSlotsItem(place: cinemaPlace[number] ?? "",placeId: number, isSeparatorShown: number != 6)
                        
                    }
                }
               
            }
            .padding(.top, MARGIN_XBIG - MARGIN_MEDIUM)
        }
        .edgesIgnoringSafeArea([.top, .bottom])
        .navigationBarHidden(true)
        .navigationDestination(for: Int.self) { number in
            if number == 2{
                SeatingPlanPageView()
            }
        }
    }
}

struct TimeSlotScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TimeSlotScreenView()
    }
}

struct AppBar: View {
    
    var onTapBack: () -> Void = {}
    
    var body: some View {
        HStack{
            Image(systemName: IC_CHEV_LEFT)
                .resizable()
                .frame(width: MARGIN_HALF_LARGE - 1, height: MARGIN_LARGE - 2)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding([.leading, .trailing], MARGIN_LARGE)
                .onTapGesture {
                    // TODO: Navigate Back
                    onTapBack()
                }
            Spacer()
            
            Image(systemName: IC_LOCATION)
                .resizable()
                .frame(width: MARGIN_MEDIUM_2, height: MARGIN_MEDIUM_2)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text("Yangon")
                .font(.system(size: MARGIN_MEDIUM_2))
                .foregroundColor(.white)
                .fontWeight(.bold)
            
            Image(systemName: IC_SEARCH)
                .resizable()
                .frame(width: MARGIN_LARGE, height: MARGIN_LARGE)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding([.trailing, .leading], MARGIN_LARGE)
            
            Image(FILTER_IMAGE_NORMAL)
                .resizable()
                .frame(width: MARGIN_LARGE, height: MARGIN_LARGE)
                .fontWeight(.bold)
                .padding(.trailing, MARGIN_LARGE)
        }
    }
}

struct DateListView: View {
    
    let dayList = [1: "Today", 2: "Tomorrow", 3:"TUE", 4: "WED", 5:"THURS", 6: "FRI", 7: "SAT", 8: "SUN"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 0){
                ForEach(1...dayList.count, id: \.self){ date in
                    DateItemSubView(date: date + 14, day: dayList[date]!)
                }
            }
            .padding(.leading, MARGIN_SMALL)
        }
    }
}

struct ViewingTypeItemView: View {
    
    var viewType: String
    
    var body: some View {
        Text(viewType)
            .font(.system(size: MARGIN_MEDIUM_2))
            .foregroundColor(.white)
            .fontWeight(.medium)
            .padding(EdgeInsets(top: MARGIN_MEDIUM - 3, leading: MARGIN_MEDIUM_2, bottom: MARGIN_SMALL + 1, trailing: MARGIN_MEDIUM_2))
            .background(Color(SECTION_BG_COLOR))
            .cornerRadius(MARGIN_SMALL + 1)
            .overlay(RoundedRectangle(cornerRadius: MARGIN_SMALL + 1).stroke(.white, lineWidth: 1))
            .padding([.top, .bottom], MARGIN_SMALL)
    }
}

struct ViewingTypeSectionView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: MARGIN_MEDIUM_3){
                ViewingTypeItemView(viewType: "2D")
                ViewingTypeItemView(viewType: "3D")
                ViewingTypeItemView(viewType: "3D IMAX")
                ViewingTypeItemView(viewType: "3D DBOX")
            }
            .padding([.leading, .trailing], MARGIN_MEDIUM_4)
        }
    }
}
struct TimeSlotColorsView: View {
    var body: some View{
        ZStack {
            HStack(spacing: MARGIN_LARGE){
                TimeSlotColorItemView(color: GREEN_LIGHT_COLOR, text: "Available")
                TimeSlotColorItemView(color: ORANGE_COLOR, text: "Filling Fast")
                TimeSlotColorItemView(color: PINK_COLOR, text: "Almost Full")
            }
            .padding([.leading, .trailing], MARGIN_LARGE - 2)
        }
        .frame(width: UIScreen.main.bounds.width,height: MARGIN_XLARGE + MARGIN_SMALL)
        .background(Color(SECTION_ICON_COLOR))
    }
    
}
struct TimeSlotColorItemView: View {
    
    var color: String
    var text: String
    
    var body: some View{
        HStack(spacing: MARGIN_MEDIUM) {
            Circle()
                .frame(width: MARGIN_MEDIUM, height: MARGIN_MEDIUM)
                .foregroundColor(Color(color))
            
            Text(text)
                .foregroundColor(Color(color))
                .font(.system(size: MARGIN_MEDIUM_2))
        }
    }
}
