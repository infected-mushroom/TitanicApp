/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 Data source for the number of greenhouses.
 */

import Foundation

struct EmbarkedDataSource {
    /// Possible values for greenhouses in the habitat
    let values = ["S", "C", "Q"]
    
    func title(for index: Int) -> String? {
        guard index < values.count else { return nil }
        return String(values[index])
    }
    
    func value(for index: Int) -> String? {
        guard index < values.count else { return nil }
        return String(values[index])
    }
}
