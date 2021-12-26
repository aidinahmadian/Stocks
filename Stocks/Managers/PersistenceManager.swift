//
//  PersistenceManager.swift
//  Stocks
//
//  Created by Aidin Ahmadian on 12/26/21.
//

import Foundation

final class PersistenceManager {
    static let shared = PersistenceManager()
    
    private let userDefaults: UserDefaults = .standard
    
    private struct Constants {
        
    }
    
    private init() {}
    
    // MARK: - Public
    public var watchlist: [String] {
        return []
    }
    
    public func addToWatchlist() {
        
    }
    
    public func removeFromWatchlist() {
        
    }
    // MARK: - Private
    
    private var hasOnBoarded: Bool {
        return false
    }
    
}
