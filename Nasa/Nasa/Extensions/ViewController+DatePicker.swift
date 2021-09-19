//
//  ViewController+DatePicker.swift
//  Nasa
//
//  Created by Supreem Mishra on 19/09/21.
//

import Foundation
import UIKit

extension ViewController {
    
    //MARK: - initialise date picker
    func setUpDatePicker() {
        datePicker = UIDatePicker.init()
        datePicker.backgroundColor = UIColor.white
        datePicker.autoresizingMask = .flexibleWidth
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(self.dateChanged(_:)), for: .valueChanged)
        datePicker.frame = CGRect(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(datePicker)
        toolBar = UIToolbar(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.onDoneButtonClick))]
        toolBar.sizeToFit()
        self.view.addSubview(toolBar)
    }
    
    //MARK: - date changed
    @objc func dateChanged(_ sender: UIDatePicker?) {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        if let date = sender?.date {
            selectedDate = formatter.string(from: date)
        }
    }
    
    //MARK: - date selected
    @objc func onDoneButtonClick() {
        toolBar.removeFromSuperview()
        datePicker.removeFromSuperview()
        viewModel.getSelectedData(date: selectedDate)
    }
    
}
