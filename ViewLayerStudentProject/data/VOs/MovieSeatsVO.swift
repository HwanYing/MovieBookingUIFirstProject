//
//  MovieSeatsVO.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/14.
//

import Foundation

struct MovieSeatsVO {
    var id: String = UUID().uuidString
    var text: String = ""
    var type: String = ""
    
    func isAvailable() -> Bool {
        return type == SEAT_TYPE_AVAILABLE
    }
    
    func isTaken() -> Bool {
        return type == SEAT_TYPE_TAKEN
    }
    
    func isText() -> Bool {
        return type == SEAT_TYPE_TEXT
    }
}

let SEAT_TYPE_AVAILABLE = "Available"
let SEAT_TYPE_TAKEN = "Taken"
let SEAT_TYPE_SPACE = "Space"
let SEAT_TYPE_TEXT = "Text"
