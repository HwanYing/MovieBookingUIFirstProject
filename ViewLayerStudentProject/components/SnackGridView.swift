//
//  SnackGridView.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/7.
//

import SwiftUI

struct SnackGridView: View {
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns, spacing: MARGIN_MEDIUM_4) {
                ForEach(1...10, id: \.self) { item in
                    SnackCardView()
                }
            }
            .padding([.leading, .trailing], MARGIN_MEDIUM_1)
        }

    }
}

struct SnackGridView_Previews: PreviewProvider {
    static var previews: some View {
        SnackGridView()
    }
}
