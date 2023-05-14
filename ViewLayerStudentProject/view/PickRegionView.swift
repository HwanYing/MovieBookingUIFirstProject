//
//  PickRegionView.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/4.
//

import SwiftUI

struct PickRegionView: View {
    
    @State var showVerify = false // for showing verify view
    @Binding var selectRegion: Bool
    
    var body: some View {
        ZStack {
            Color(BG_COLOR)
            
            VStack(alignment: .leading, spacing: 0.0) {
                // Title
                HStack {
                    Spacer()
                    Text(REGION_TITLE)
                        .foregroundColor(Color(PRIMARY_COLOR))
                        .padding(.top, MARGIN_XBIG)
                    .font(.system(size: TEXT_REGULAR_2X))
                    Spacer()
                }
                
                // Search section
                SearchSectionView()

                // City Section
                RegionSectionView(showVerify: $showVerify)

                Spacer()
            }
           
        }
        .edgesIgnoringSafeArea([.top,.bottom])
        .fullScreenCover(isPresented: $showVerify) {
            TabBarView()
        }
    }
}

struct PickRegionView_Previews: PreviewProvider {
    static var previews: some View {
        PickRegionView(selectRegion: .constant(false))
    }
}

struct SearchSectionView: View {
    var body: some View {
        HStack {
            HStack{
                // Search icon
                Image(systemName: IC_SEARCH)
                    .resizable()
                    .frame(width: MARGIN_MEDIUM_3, height: MARGIN_MEDIUM_3)
                    .foregroundColor(Color(PRIMARY_COLOR))
                
                Text(SEARCH_LOCATION_HOLDER)
                    .foregroundColor(Color(TEXT_COLOR_ONE))
                    .font(.system(size: TEXT_REGULAR))
                Spacer()
            }
            .padding()
            .background(Color(SECTION_ICON_COLOR))
            .cornerRadius(MARGIN_MEDIUM)
            .padding(.leading, MARGIN_MEDIUM_2)
            
            // map icon
            Image(systemName: IC_LOCATION)
                .resizable()
                .frame(width: MARGIN_MEDIUM_2, height: MARGIN_MEDIUM_2)
                .foregroundColor(Color(SECTION_ICON_COLOR))
                .padding()
                .background(Color(PRIMARY_COLOR))
                .cornerRadius(MARGIN_MEDIUM_1)
                .padding(.leading, MARGIN_MEDIUM)
                .padding(.trailing, MARGIN_MEDIUM_2)
        }
        .padding(.top, MARGIN_XLARGE)
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct RegionSectionView: View {
    
    @State var cities: [CityVO] = dummyCities
    @Binding var showVerify: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            
            HStack {
                Spacer()
                Image(REGION_VECTOR)
            }
            .padding(.top, MARGIN_XXLARGE)
            
            HStack {
                Text(CITIES_TEXT)
                    .font(.system(size: TEXT_REGULAR_2X))
                    .padding()
                    .foregroundColor(Color(SECTION_TITLE_COLOR))
                Spacer()
            }
            .background(Color(SECTION_ICON_COLOR))
            
            ForEach(cities, id: \.id) { city in
                VStack(alignment: .leading) {
                    Text(city.cityName)
                        .foregroundColor(.white)
                        .padding()
                    Divider()
                        .background(Color(TITLE_LABEL_COLOR))
                }
                .padding(.trailing, MARGIN_XLARGE)
            }
            .onTapGesture {
                showVerify = true
            }
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}
