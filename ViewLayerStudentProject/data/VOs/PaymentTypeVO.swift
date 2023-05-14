//
//  PaymentTypeVO.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/10.
//

import Foundation

struct PaymentTypeVO: Identifiable, Hashable {
    var id: Int
    var paymentType: String
    var image: String
    var isSelected: Bool
}
