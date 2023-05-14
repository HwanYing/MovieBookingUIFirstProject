//
//  TimeSlotVO.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/13.
//

import Foundation

struct TimeSlotVO: Identifiable, Hashable {
    var id: Int
    var time: String
    var viewType: String
    var screen: String
    var availableCount: Int
    var bgColor: String
    var borderColor: String
    var isSelected: Bool
}
