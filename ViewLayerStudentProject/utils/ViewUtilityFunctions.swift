//
//  ViewUtilityFunctions.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/14.
//

import Foundation
import SwiftUI

func getGridItems(numberOfColumns: Int, spacing: CGFloat) -> [GridItem] {
    return (1...numberOfColumns).map{ _ in
        GridItem(.flexible(), spacing: spacing)
    }
}
