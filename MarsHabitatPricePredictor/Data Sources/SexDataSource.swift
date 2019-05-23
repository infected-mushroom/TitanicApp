/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 Data source for the number of solar panels in the habitat.
 */

import Foundation

struct SexDataSource {
    /// Possible values for solar panels in the habitat
    let values = ["male", "female"]
    
    func title(for index: Int) -> String? {
        guard index < values.count else { return nil }
        return String(values[index])
    }
    
    func value(for index: Int) -> String? {
        guard index < values.count else { return nil }
        return String(values[index])
    }
}
