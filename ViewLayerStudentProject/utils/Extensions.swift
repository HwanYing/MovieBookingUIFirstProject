//
//  Extensions.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/5.
//

import Foundation
import SwiftUI

extension View {
    func erasedToAnyView() -> AnyView {
        AnyView(self)
    }
    func getSize() -> CGSize {
        UIHostingController(rootView: self).view.intrinsicContentSize
    }
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

//extension WrappedHStack
