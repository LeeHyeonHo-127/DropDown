//
//  ViewController.swift
//  DropDown
//
//  Created by 이현호 on 2023/07/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var distanceTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        configPickerView()
    }
    
    var distance = ["100m", "200m", "300m", "400m", "500m"]
    var picker = UIPickerView()
    


}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func configPickerView(){
        self.picker.delegate = self
        self.picker.dataSource = self
        distanceTextField.inputView = picker
        
        configToolbar()
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return distance[row]
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.distance.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.distanceTextField.text = self.distance[row]
    }
    
    func configToolbar(){
        let toolBar = UIToolbar()
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
//        toolBar.backgroundColor = UIColor.systemGray2
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(self.donePicker))
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(self.cancelPicker))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([doneButton,flexibleSpace,cancelButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        self.distanceTextField.inputAccessoryView = toolBar
        self.distanceTextField.inputAccessoryView?.backgroundColor = .systemGray2
    }
    
    // "완료" 클릭 시 데이터를 textfield에 입력 후 입력창 내리기
    @objc func donePicker() {
        let row = self.picker.selectedRow(inComponent: 0)
        self.picker.selectRow(row, inComponent: 0, animated: false)
        self.distanceTextField.text = self.distance[row]
        self.distanceTextField.resignFirstResponder()
    }

    // "취소" 클릭 시 textfield의 텍스트 값을 nil로 처리 후 입력창 내리기
    @objc func cancelPicker() {
        self.distanceTextField.text = nil
        self.distanceTextField.resignFirstResponder()
    }
}

