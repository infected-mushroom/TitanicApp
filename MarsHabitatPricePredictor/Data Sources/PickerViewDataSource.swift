/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Data source for the picker that manages the solar panels, greenhouses and size data sources.
*/

import UIKit

/**
     The common data source for the three features and their picker values. Decouples
     the user interface and the feature specific values.
*/
class PickerDataSource: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    // MARK: - Properties
    
    private let solarPanelsDataSource = SolarPanelDataSource()
    private let greenhousesDataSource = GreenhousesDataSource()
    private let sizeDataSource = SizeDataSource()
    private let ageDataSource = AgeDataSource()
    
    // MARK: - Helpers
    
    /// Find the title for the given feature.
    func title(for row: Int, feature: Feature) -> String? {
        switch feature {
        case .solarPanels:  return solarPanelsDataSource.title(for: row)
        case .greenhouses:  return greenhousesDataSource.title(for: row)
        case .size:         return sizeDataSource.title(for: row)
        case .age:          return ageDataSource.title(for: row)
        }
    }
    
    /// For the given feature, find the value for the given row.
    func value(for row: Int, feature: Feature) -> String {
        let value: String?
        
        switch feature {
        case .solarPanels:      value = solarPanelsDataSource.value(for: row)
        case .greenhouses:      value = greenhousesDataSource.value(for: row)
        case .size:             value = sizeDataSource.value(for: row)
        case .age:              value = ageDataSource.value(for: row)
        }
        
        return value!
    }
    
    // MARK: - UIPickerViewDataSource
    
    /// Hardcoded 4 items in the picker.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    /// Find the count of each column of the picker.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch Feature(rawValue: component)! {
        case .solarPanels:  return solarPanelsDataSource.values.count
        case .greenhouses:  return greenhousesDataSource.values.count
        case .size:         return sizeDataSource.values.count
        case .age:          return ageDataSource.values.count
        }
    }
}
