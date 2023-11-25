//
//  AppError.swift
//  InnovaCase
//
//  Created by Mehmet Bilir on 25.11.2023.
//

import Foundation

enum AppError:LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case randomError(String)

    var errorDescription:String? {

        switch self {
        case .errorDecoding:
            return "Response could not be decoded."
        case .unknownError:
            return "Error is a unknown causes."
        case .invalidUrl:
            return "Url is not valid."
        case .randomError(let error):
            return error
        }
    }
}
