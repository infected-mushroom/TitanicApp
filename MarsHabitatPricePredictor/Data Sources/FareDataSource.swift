/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 Data source for the number of solar panels in the habitat.
 */

import Foundation

struct FareDataSource {
    /// Possible values for solar panels in the habitat
    let values = ["7.3", "7.9", "8.5", "16.7", "21.1", "30.0", "53.1", "71.3", "75.0"]
    
    func title(for index: Int) -> String? {
        guard index < values.count else { return nil }
        return String(values[index])
    }
    
    func value(for index: Int) -> String? {
        guard index < values.count else { return nil }
        return String(values[index])
    }
}
