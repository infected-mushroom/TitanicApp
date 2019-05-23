/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 Data source for the number of solar panels in the habitat.
 */

import Foundation

struct AgeDataSource {
    /// Possible values for solar panels in the habitat
    let values = [10.0, 22.0, 38.0, 45.0, 50.0, 55.0, 60.0, 65.0, 70.0]
    
    func title(for index: Int) -> String? {
        guard index < values.count else { return nil }
        return String(values[index])
    }
    
    func value(for index: Int) -> Double? {
        guard index < values.count else { return nil }
        return Double(values[index])
    }
}
