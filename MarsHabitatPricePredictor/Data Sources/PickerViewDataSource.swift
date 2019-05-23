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
    
    private let pclassDataSource = PClassDataSource()
    //private let greenhousesDataSource = GreenhousesDataSource()
    private let cabinDataSource = CabinDataSource()
    private let ageDataSource = AgeDataSource()
    private let fareDataSource = FareDataSource()
    private let sexDataSource = SexDataSource()
    private let embarkedDataSource = EmbarkedDataSource()
    
    // MARK: - Helpers
    
    /// Find the title for the given feature.
    func title(for row: Int, feature: Feature) -> String? {
        switch feature {
        case .pclass:  return pclassDataSource.title(for: row)
        case .embarked:  return embarkedDataSource.title(for: row)
        case .cabin:         return cabinDataSource.title(for: row)
        case .age:          return ageDataSource.title(for: row)
        case .fare:         return fareDataSource.title(for: row)
        case .sex:         return sexDataSource.title(for: row)
        }
    }
    
    /// For the given feature, find the value for the given row.
    func value(for row: Int, feature: Feature) -> String {
        let value: String?
        
        switch feature {
        case .pclass:      value = pclassDataSource.value(for: row)
        case .embarked:      value = embarkedDataSource.value(for: row)
        case .cabin:             value = cabinDataSource.value(for: row)
        case .age:              value = ageDataSource.value(for: row)
        case .fare:             value = fareDataSource.value(for: row)
        case .sex:              value = sexDataSource.value(for: row)
        }
        
        return value!
    }
    
    // MARK: - UIPickerViewDataSource
    
    /// Hardcoded 6 items in the picker.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 6
    }
    
    /// Find the count of each column of the picker.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch Feature(rawValue: component)! {
        case .pclass:  return pclassDataSource.values.count
        case .embarked:  return embarkedDataSource.values.count
        case .cabin:         return cabinDataSource.values.count
        case .age:          return ageDataSource.values.count
        case .fare:         return fareDataSource.values.count
        case .sex:         return sexDataSource.values.count
        }
    }
}
