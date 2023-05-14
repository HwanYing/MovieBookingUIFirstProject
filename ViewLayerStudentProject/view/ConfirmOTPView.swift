//
//  ConfirmOTPView.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/4.
//

import SwiftUI

struct ConfirmOTPView: View {
    
    @State var number: String = ""
    @Binding var confirmOTP: Bool
    @State var selectRegion = false

    var body: some View {
        ZStack {
            Color(BG_COLOR)
            
            VStack(spacing: 0.0) {
                
                // App logo, notice text
                AppLogoSectionView(backToFrontView: $confirmOTP)
                
                
                // enter OTP section
                OTPCodeFieldSectionView(number: $number)
                
                // OTP Text Field Section View
                OTPReceiveStateSection()
                
                // Button, Terms Label
                FooterSectionView(confirmEnter: $selectRegion)
                
            }
            
        }
        .edgesIgnoringSafeArea([.top, .bottom])
        .fullScreenCover(isPresented: $selectRegion) {
            PickRegionView(selectRegion: $selectRegion)
        }
    }
}

struct ConfirmOTPView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmOTPView(confirmOTP: .constant(false))
    }
}

struct OTPCodeFieldSectionView: View {
    
    @Binding var number: String
    
    var body: some View {
        VStack (spacing: 0.0) {
            
            HStack {
                Text(ENTER_OTP_TEXT)
                    .foregroundColor(Color(LIGHT_LABEL_COLOR))
                Spacer()
            }
            .padding([.leading, .trailing], MARGIN_LARGE)
            
            HStack {
                ForEach(0...5, id: \.self) { _ in
                    TextField("", text: $number)
                        .padding(.leading, MARGIN_MEDIUM_3)
                        .frame(width: OTP_PIN_SIZE, height: OTP_PIN_SIZE)
                        .background(Color.white)
                        .foregroundColor(Color(BG_COLOR))
                        .cornerRadius(MARGIN_MEDIUM)
                }
            }
            .padding(.top, MARGIN_MEDIUM)
            
            
        }
        .padding(.top, TEXT_XBIG - MARGIN_SMALL)
    }
}

struct OTPReceiveStateSection: View {
    var body: some View {
        HStack {
            Text(OTP_STATE_LABEL_2)
                .foregroundColor(.white)
                .font(.system(size: MARGIN_MEDIUM_2))
            
            Text(RESEND_CODE_LABEL)
                .foregroundColor(Color(PRIMARY_COLOR))
                .font(.system(size: MARGIN_MEDIUM_2))
        }
        .padding(.top, MARGIN_SXLARGE)
    }
}

struct FooterSectionView: View {
    
    @Binding var confirmEnter: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 0.0) {
            Button(action: {
                // Navigate to Select Region Page
                confirmEnter = true
            }) {
                Text(CONFIRM_OTP_LABEL)
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - MARGIN_XXLARGE)
            }
            .background(Color(PRIMARY_COLOR))
            .cornerRadius(MARGIN_MEDIUM)
            .padding(.top, MARGIN_SXLARGE)
            
            Text(TERMS_LABEL)
                .foregroundColor(Color(BOTTOM_TEXT_COLOR))
                .font(.system(size: MARGIN_CARD_MEDIUM_2))
                .fontWeight(.bold)
                .padding(.top, TOP_PADDING_1 + MARGIN_MEDIUM)
        }
    }
}

struct AppLogoSectionView: View {
    
    @Binding var backToFrontView: Bool
    
    var body: some View {
        VStack(spacing: 0.0) {
            HStack {
                // Back Button
                Image(systemName: IC_CHEV_LEFT)
                    .resizable()
                    .frame(width: MARGIN_MEDIUM_2, height: MARGIN_LARGE)
                    .fontWeight(.bold)
                    .foregroundColor(Color(SECTION_BG_COLOR))
                    .onTapGesture {
                        backToFrontView = false
                    }
                Spacer()
            }
            .padding(.leading, MARGIN_LARGE)
            
            // Image
            Image(APP_LOGO)
                .resizable()
                .frame(width: IMAGE_WIDTH, height: IMAGE_HEIGHT)
            
            // State text
            Text(OTP_STATE_LABEL_1)
                .foregroundColor(.white)
                .font(.system(size: MARGIN_LARGE))
                .padding(.top, FOOTER_PADDING)
            Text(NO_OF_DIGIT_NOTICE)
                .font(.system(size: MARGIN_HALF_LARGE))
                .foregroundColor(Color(SUB_TEXT_COLOR))
                .frame(width: TEXT_VERIFY_WIDTH, height: TEXT_VERIFY_HEIGHT)
                .padding(.top, MARGIN_MEDIUM_1)
        }
    }
}
