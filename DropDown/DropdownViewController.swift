import UIKit

class DropdownViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let dropdownOptions = ["Option 1", "Option 2", "Option 3", "Option 4", "Option 5"]
    var selectedOption: String? // This variable will hold the selected option

    @IBOutlet weak var dropdownPicker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the delegate and dataSource for the pickerView
        dropdownPicker.delegate = self
        dropdownPicker.dataSource = self
    }

    // MARK: - UIPickerViewDataSource

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // We only have one column (component) in the picker
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dropdownOptions.count // Number of rows in the picker
    }

    // MARK: - UIPickerViewDelegate

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dropdownOptions[row] // Set the title for each row in the picker
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is called when the user selects a row in the picker
        selectedOption = dropdownOptions[row]
        print("Selected option: \(selectedOption ?? "None")")
        // You can perform any additional actions based on the selection here
    }
}

