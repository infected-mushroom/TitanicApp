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
    let model = titanic_()
    
    /// Data source for the picker.
    let pickerDataSource = PickerDataSource()
    
    /// Formatter for the output.
    let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
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

            let features: [Feature] = [.solarPanels, .greenhouses, .size, .age]
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
        func selectedRow(for feature: Feature) -> Int {
            return pickerView.selectedRow(inComponent: feature.rawValue)
        }

        let solarPanels = pickerDataSource.value(for: selectedRow(for: .solarPanels), feature: .solarPanels)
        let greenhouses = pickerDataSource.value(for: selectedRow(for: .greenhouses), feature: .greenhouses)
        let size = pickerDataSource.value(for: selectedRow(for: .size), feature: .size)
        //let age = pickerDataSource.value(for: selectedRow(for: .size), feature: .size)

        //guard let marsHabitatPricerOutput = try? model.prediction(solarPanels: solarPanels, greenhouses: greenhouses, size: size) else {
            //fatalError("Unexpected runtime error.")
        //}
        let age = 22.0
        let fare = 7.2500
        let pclass = "3"
        let sex = "male"
        let sibsp = "1"
        let parch = "0"
        let cabin = "NAN"
        let embarked = "S"
        guard let titanicOutput = try? model.prediction(feature_3: age, feature_6: fare, feature_1: pclass, feature_2: sex, feature_4: sibsp, feature_5: parch, feature_7: cabin, feature_8: embarked) else {
            fatalError("Unexpected runtime error.")
        }

        //let price = marsHabitatPricerOutput.price
        priceLabel.text = priceFormatter.string(for: titanicOutput.prediction[0].doubleValue)
        //priceLabel.text = priceFormatter.string(for: price)
    }
}
