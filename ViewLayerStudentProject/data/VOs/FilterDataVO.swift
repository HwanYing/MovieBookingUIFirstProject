//
//  FilterDataVO.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/18.
//

import Foundation

struct FilterDataVO: Identifiable {
    
    let id: Int
    let title: String
    let value: [DropdownItemVO]
}
