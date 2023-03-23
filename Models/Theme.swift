//
//  Theme.swift
//  Scrumdinger
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable, Codable {
    case indigo
    case magenta
    case orange
    case purple
    case tan
    case teal
    case yellow
    
    var accentColor: Color {
        switch self {
        case .orange, .tan, .teal, .yellow: return .black
        case .indigo, .magenta, .purple: return .white
        }
    }
    
    var mainColor: Color {
        Color(rawValue)
    }
    
    var name: String {
        rawValue.capitalized
    }
    
    var id: String {
        name
    }
}
