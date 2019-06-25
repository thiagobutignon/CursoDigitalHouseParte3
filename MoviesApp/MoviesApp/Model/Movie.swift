
//
//  File.swift
//  MoviesApp
//
//  Created by Thiago B Claramunt on 24/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//


import Foundation

// MARK: - MoviePage
struct MoviePage: Codable {
    let page, totalResults, totalPages: Int
    let results: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct Movie: Codable {
    let voteCount, id: Int
    let video: Bool
    let voteAverage: Double
    let title: String
    let popularity: Double
    let posterPath: String
    let originalLanguage: String
    let originalTitle: String
    let genreIDS: [Int]
    let backdropPath: String
    let adult: Bool
    let overview, releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case voteCount = "vote_count"
        case id, video
        case voteAverage = "vote_average"
        case title, popularity
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult, overview
        case releaseDate = "release_date"
    }
    
    init(dic: [String:Any]) {
        self.voteCount = dic["vote_count"] as! Int
        self.id = dic["id"] as! Int
        self.video = dic["video"] as! Bool
        self.voteAverage = dic["vote_average"] as! Double
        self.title = dic["title"] as! String
        self.popularity = dic["popularity"] as! Double
        self.posterPath = dic["poster_path"] as! String
        self.originalLanguage = dic["original_language"] as! String
        self.originalTitle = dic["original_title"] as! String
        self.genreIDS = dic["genre_ids"] as! [Int]
        self.backdropPath = dic["backdrop_path"] as! String
        self.adult = dic["adult"] as! Bool
        self.overview = dic["overview"] as! String
        self.releaseDate = dic["release_date"] as! String
        
    }

}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case ja = "ja"
    case pt = "pt"
}
