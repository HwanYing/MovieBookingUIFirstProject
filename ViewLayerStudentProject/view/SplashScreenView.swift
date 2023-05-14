//
//  SplashScreenView.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/7.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack{
            // Background Color
            Color(BG_COLOR)
            
            VStack {
                // Logo
                Image(APP_LOGO)
                    .resizable()
                    .frame(width: IMAGE_WIDTH, height: IMAGE_HEIGHT)
                
                // App Name
                HStack {
                    Text("C")
                        .foregroundColor(Color(PRIMARY_COLOR))
                    Text(APP_LABEL)
                        .foregroundColor(Color(TITLE_LABEL_COLOR))
                }
                .font(.system(size: MARGIN_MEDIUM_4))
            }

        }
        .edgesIgnoringSafeArea([.top, .bottom])
        .onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(2.0)) {
                self.isActive = true
            }
        }
        .fullScreenCover(isPresented: $isActive) {
            ContentView(isActive: $isActive)
        }
    }

}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
