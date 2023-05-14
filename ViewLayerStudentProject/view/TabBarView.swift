//
//  TabBarView.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/5.
//

import SwiftUI

struct TabBarView: View {
    
    @State var current: String = TAB_ONE_LABEL

    var body: some View {
        NavigationStack{
            ZStack {
                // Background Color
                Color(BG_COLOR)
                
                ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                    TabView(selection: $current) {
                        
                        MovieListScreenView()
                            .tag(TAB_ONE_LABEL)
                        
                        Text(TAB_TWO_LABEL)
                            .tag(TAB_TWO_LABEL)
                        Text(TAB_THREE_LABEL)
                            .tag(TAB_THREE_LABEL)
                        MyProfileView()
                            .tag(TAB_FOUR_LABEL)
                    }
                    HStack(spacing: 0.0) {
                        // TabBarItem
                        TabBarItem(current: $current, title: TAB_ONE_LABEL, image: IC_TAB_ONE)
                        Spacer(minLength: 0)
                        TabBarItem(current: $current, title: TAB_TWO_LABEL, image: IC_TAB_TWO)
                        Spacer(minLength: 0)
                        TabBarItem(current: $current, title: TAB_THREE_LABEL, image: IC_TAB_THREE)
                        Spacer(minLength: 0)
                        TabBarItem(current: $current, title: TAB_FOUR_LABEL, image: IC_TAB_FOUR)
                    }
                    .background(Color(BG_COLOR))
                }
            }
        }
       
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
