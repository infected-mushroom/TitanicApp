/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Data source for the number of solar panels in the habitat.
*/

import Foundation

struct SolarPanelDataSource {
    /// Possible values for solar panels in the habitat
    let values = ["1.0", "1.5", "2.0", "2.5", "3.0", "3.5", "4.0", "4.5", "5.0"]
    
    func title(for index: Int) -> String? {
        guard index < values.count else { return nil }
        return String(values[index])
    }
    
    func value(for index: Int) -> String? {
        guard index < values.count else { return nil }
        return String(values[index])
    }
}
