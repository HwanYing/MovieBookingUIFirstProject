//
//  MovieTypeVO.swift
//  ViewLayerStudentProject
//
//  Created by 梁世仪 on 2023/5/5.
//

import SwiftUI

struct MovieInfoVO: Identifiable {
    var id: Int
    var movieName: String
    var rating: String
    var releaseDate: String
    var duration: String
    var castName: String
    var moviePoster: String
    var genre: [String]
    var castImage: String
}
