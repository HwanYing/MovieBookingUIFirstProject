//
//  DropdownItemVO.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/17.
//

import Foundation

struct DropdownItemVO: Identifiable{
    let id: Int
    let title: String
    let onSelect: () -> Void
}
