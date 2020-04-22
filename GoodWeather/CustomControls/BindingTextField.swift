//
//  BindingTextField.swift
//  GoodWeather
//
//  Created by Serhan Khan on 22/04/2020.
//  Copyright © 2020 Serhan Khan. All rights reserved.
//

import Foundation
import UIKit

class BindingTextField:UITextField {
    
    var textChangeClosure:(String) -> () = {_ in}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }

    func bind(callBack:@escaping (String) -> ()) {
        self.textChangeClosure = callBack
    }
    
    private func commonInit(){
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField:UITextField) {
        if let text = textField.text {
            self.textChangeClosure(text)
        }
    }
}
