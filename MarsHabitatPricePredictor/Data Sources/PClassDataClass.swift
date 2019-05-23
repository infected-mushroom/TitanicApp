/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 Data source for the number of greenhouses.
 */

import Foundation

struct PClassDataSource {
    /// Possible values for greenhouses in the habitat
    let values = ["1", "2", "3"]
    
    func title(for index: Int) -> String? {
        guard index < values.count else { return nil }
        return String(values[index])
    }
    
    func value(for index: Int) -> String? {
        guard index < values.count else { return nil }
        return String(values[index])
    }
}
