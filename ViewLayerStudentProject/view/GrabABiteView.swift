//
//  GrabABiteView.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/7.
//

import SwiftUI

struct GrabABiteView: View {
    
    @State var snacks: [SnackTypeVO] = snackFilterType
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @State var itemCount = 1
    @Binding var grabAbite: Bool
    //    @Environment(\.dismiss) var dismiss
    @State var filterSheet = false
    @State var image = IC_CHEV_DOWN
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background color
                Color(BG_COLOR)
                
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                    VStack(alignment: .leading, spacing: 0.0) {
                        
                        // App Bar section
                        AppBarSectionView(){
                            self.grabAbite = false
                            //                        dismiss()
                        }
                        
                        // SnackType section
                        SnackTypeSectionView(snacks: $snacks)
                        
                        // Snack Grid list section
                        SnackGridView().padding(.top, MARGIN_LARGE)
                        
                    }
                    .padding(.top, FOOTER_PADDING)
                    
                    // SNACK count bottom view
                    if filterSheet {
                        FoodItemCountSheet()
                            .onTapGesture {
                                self.filterSheet.toggle()
                            }
                    } else {
                        NavigationLink(value: 0) {
                            SnackCountBottomView(itemCount: $itemCount, image: IC_CHEV_DOWN, filterSheet: $filterSheet)
                        }
                        .navigationDestination(for: Int.self) { _ in
                           CheckOutView()
                        }
                            
                    }
                    
                }
                .navigationBarBackButtonHidden(true)
                
            }
            .edgesIgnoringSafeArea([.top, .bottom])
        }
        
    }
}

struct GrabABiteView_Previews: PreviewProvider {
    static var previews: some View {
        GrabABiteView(grabAbite: .constant(false))
    }
}

struct AppBarSectionView: View {
    
    var onTapBack: () -> Void = {}
    
    var body: some View {
        HStack {
            // back icon
            Image(systemName: IC_CHEV_LEFT)
                .resizable()
                .frame(width: MARGIN_CARD_MEDIUM_2, height: MARGIN_LARGE - 2)
                .padding(.leading, MARGIN_LARGE - 2)
                .onTapGesture {
                    // TODO: Navigate Back
                    onTapBack()
                }
            // title
            Text(GRAB_A_BITE_LABEL)
                .font(.system(size: MARGIN_LARGE - 2))
                .padding(.leading, MARGIN_XLARGE)
            
            Spacer()
            
            // search icon
            Image(systemName: IC_SEARCH)
                .resizable()
                .frame(width: MARGIN_LARGE - 2, height: MARGIN_LARGE - 2)
                .padding(.trailing, MARGIN_LARGE)
            
            // skip label
            Text(SKIP_LABEL)
                .font(.system(size: MARGIN_MEDIUM_4))
                .padding(.trailing, MARGIN_MEDIUM_4)
        }
        .foregroundColor(.white)
        .fontWeight(.bold)
    }
}

struct SnackTypeSectionView: View {
    
    @Binding var snacks: [SnackTypeVO]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(snacks) { snack in
                    VStack {
                        Text(snack.snackType)
                            .font(.system(size: MARGIN_MEDIUM_2))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding([.leading, .trailing], MARGIN_MEDIUM)
                        
                        Rectangle()
                            .fill(snack.isSelected ? Color(PRIMARY_COLOR) : .clear)
                            .frame(height: 3)
                    }
                    .onTapGesture {
                        snacks = snacks.map { existing in
                            if existing.snackType == snack.snackType {
                                return SnackTypeVO(id: existing.id, snackType: existing.snackType, isSelected: true)
                            } else {
                                return SnackTypeVO(id: existing.id, snackType: existing.snackType, isSelected: false)
                            }
                        }
                        
                    }
                }
            }
            .padding(EdgeInsets(top: MARGIN_XLARGE, leading: MARGIN_MEDIUM, bottom: 0, trailing: MARGIN_MEDIUM))
        }
    }
}

struct ItemCountView: View {
    
    @Binding var itemCount: Int
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center), content: {
            
            Circle()
                .frame(width: MARGIN_CARD_MEDIUM_2, height: MARGIN_CARD_MEDIUM_2)
                .foregroundColor(.red)
            
            // Item count text
            Text("\(itemCount)")
                .foregroundColor(.white)
                .font(.system(size: MARGIN_MEDIUM))
            
        })
    }
}

struct SnackItemShowView: View {
    
    @Binding var itemCount: Int
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
            Image(SNACK_COUNT_IMAGE)
                .resizable()
                .frame(width: MARGIN_LARGE + MARGIN_SMALL, height: GG_Size)
            
            // item count circle view
            ItemCountView(itemCount: $itemCount)
                .padding(.trailing, -MARGIN_MEDIUM)
            
        }
    }
}

struct SnackCountBottomView: View {
    
    @Binding var itemCount: Int
    var image: String
    @Binding var filterSheet: Bool
    
    var body: some View {
        VStack {
            HStack{
                // Snack item count view
                SnackItemShowView(itemCount: $itemCount)
                
                Image(systemName: image)
                    .resizable()
                    .frame(width: MARGIN_CARD_MEDIUM_2, height: MARGIN_MEDIUM)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .padding(.leading, MARGIN_HALF_LARGE)
                    .onTapGesture {
                        self.filterSheet.toggle()
                    }
                
                Spacer()
                
                // total price
                Text("2000Ks")
                    .font(.system(size: MARGIN_MEDIUM_2))
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                
                Image(systemName: IC_CHEV_RIGHT)
                    .resizable()
                    .frame(width: MARGIN_MEDIUM, height: MARGIN_HALF_LARGE)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .padding(.leading, MARGIN_MEDIUM_1)
            }
            .padding()
            .background(Color(PRIMARY_COLOR))
            .cornerRadius(MARGIN_MEDIUM_1)
            .padding([.leading, .trailing], MARGIN_MEDIUM_2)
            
        }
        .frame(minHeight: 0, maxHeight: SNACK_ITEM_WIDTH)
        .background(Color(.black))
        
    }
}
