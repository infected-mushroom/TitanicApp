/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Main view controller for the MarsHabitatPricer app. Uses a `UIPickerView` to gather user inputs.
   The model's output is the predicted price.
*/

import UIKit
import CoreML

class ViewController: UIViewController {
    // MARK: - Properties
    
    // let model = MarsHabitatPricer()
    let model = iris()
    
    /// Data source for the picker.
    let pickerDataSource = PickerDataSource()
    
    /// Formatter for the output.
    let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        // formatter.numberStyle = .currency
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 3
        formatter.usesGroupingSeparator = true
        // formatter.locale = Locale(identifier: "en_US")
        return formatter
    }()
    
    // MARK: - Outlets

    /// Label that will be updated with the predicted price.
    @IBOutlet weak var priceLabel: UILabel!

    /**
         The UI that users will use to select the number of solar panels,
         number of greenhouses, and acreage of the habitat.
    */
    @IBOutlet weak var pickerView: UIPickerView! {
        didSet {
            pickerView.delegate = self
            pickerView.dataSource = pickerDataSource

            let features: [Feature] = [.solarPanels, .greenhouses, .size]
            for feature in features {
                pickerView.selectRow(2, inComponent: feature.rawValue, animated: false)
            }
        }
    }
    
    // MARK: - View Life Cycle
    
    /// Updated the predicted price, when created.
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePredictedPrice()
    }
    
    /**
         The main logic for the app, performing the integration with Core ML.
         First gather the values for input to the model. Then have the model generate
         a prediction with those inputs. Finally, present the predicted value to
         the user.
    */
    func updatePredictedPrice() {
        // func selectedRow(for feature: Feature) -> Int {
        func selectedRow(for feature: Feature) -> Int {
            return pickerView.selectedRow(inComponent: feature.rawValue)
        }

        // let solarPanels = pickerDataSource.value(for: selectedRow(for: .solarPanels), feature: .solarPanels)
        // let greenhouses = pickerDataSource.value(for: selectedRow(for: .greenhouses), feature: .greenhouses)
        // let size = pickerDataSource.value(for: selectedRow(for: .size), feature: .size)

        //guard let marsHabitatPricerOutput = try? model.prediction(solarPanels: solarPanels, greenhouses: greenhouses, size: size) else {
            //fatalError("Unexpected runtime error.")
        //}
        let sepal_l = 5.1
        let sepal_w = 3.5
        let petal_l = 1.4
        let petal_w = 0.2
        
        guard let output = try? model.prediction(input: irisInput(feature_0: sepal_l, feature_1: sepal_w, feature_2: petal_l, feature_3: petal_w)) else {
            fatalError("Unexpected runtime error.")
        }
        priceLabel.text = priceFormatter.string(for: output.prediction[0].doubleValue)
        //let price = marsHabitatPricerOutput.price
        // priceLabel.text = priceFormatter.string(for: price)
    }
}
