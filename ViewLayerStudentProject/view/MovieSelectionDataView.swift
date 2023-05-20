//
//  MovieSelectionDataView.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/7.
//

import SwiftUI

struct MovieSelectionDataView: View {
    
    @State var isSelecting = false
    @State var selectionTitle = "Format"
    @State var selectedRowId = 0
    
    let data: [DropdownItemVO] = dropDownData
    
    var body: some View {
        GeometryReader { _ in
            VStack(alignment: .leading){
                // selection text
                DropDownMainSelectView(selectionTitle: selectionTitle,isSelecting: $isSelecting)
                
                // drop down data list
                if isSelecting{
                    Divider()
                        .background(Color.white)
                        .padding(.horizontal)
                    
                    // drop down list section
                    DropDownListView(data: data, isSelecting: $isSelecting, selectionTitle: $selectionTitle, selectedRowId: $selectedRowId)
                }
                
             
            }
            .frame(width: TICKET_PLACE_FRAME_WIDTH + MARGIN_MEDIUM)
            .padding(.vertical)
            .background(Color(uiColor: UIColor.systemIndigo))
            .cornerRadius(MARGIN_MEDIUM_2)
            .onTapGesture {
                isSelecting.toggle()
            }
            .onAppear{
                selectedRowId = 1
                selectionTitle = "Messages"
            }
        .animation(.easeInOut(duration: 0.3), value: 1)
        }
    }
}

struct MovieSelectionDataView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSelectionDataView()
    }
}
struct DropdownMenuItemView: View{
    
    @Binding var isSelecting: Bool
    @Binding var selectionTitle: String
    @Binding var selectionId: Int
    
    let item: DropdownItemVO
    
    var body: some View{
        Button(action: {
            isSelecting = false
            selectionTitle = item.title
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                selectionId = item.id
            }
            item.onSelect()
        }) {
            Text(item.title)
                .font(.system(size: MARGIN_MEDIUM_2))
                .fontWeight(.semibold)
            
        }
        .padding(.horizontal)
        .foregroundColor(.white)
    }
}

struct DropDownListView: View {
    
    let data: [DropdownItemVO]
    @Binding var isSelecting: Bool
    @Binding var selectionTitle: String
    @Binding var selectedRowId: Int
    
    var body: some View {
        VStack(alignment: .leading,spacing: MARGIN_MEDIUM){
            ForEach(data) { datum in
                DropdownMenuItemView(isSelecting: $isSelecting, selectionTitle: $selectionTitle, selectionId: $selectedRowId, item: datum)
            }
            
        }
    }
}

struct DropDownMainSelectView: View {
    
    var selectionTitle: String
    @Binding var isSelecting: Bool
    
    var body: some View {
        HStack(alignment: .center){
            Text(selectionTitle)
                .font(.system(size: MARGIN_MEDIUM_2))
                .fontWeight(.bold)
            
            Image(systemName: IC_CHEV_DOWN)
                .font(.system(size: MARGIN_MEDIUM_2))
                .rotationEffect(.degrees(isSelecting ? -180 : 0))
        }
        .padding(.leading, MARGIN_MEDIUM)
        .foregroundColor(.white)
    }
}
