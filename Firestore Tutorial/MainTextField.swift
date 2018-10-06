//
//  LoginVCTextField.swift
//  Leeroy Crew
//
//  Created by Uladzislau Daratsiuk on 7/25/18.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import UIKit

class MainTextField: UITextField {

    init(placeHolderText: String, isSecure: Bool) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = UIColor.black
        self.textAlignment = .center
        self.isSecureTextEntry = isSecure
        self.attributedPlaceholder = NSAttributedString(string: placeHolderText,attributes: [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.8)])
        self.font = UIFont(name: "AppleSDGothicNeo-Light", size: 15)
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.gray.withAlphaComponent(0.8).cgColor
        self.layer.borderWidth = 0.2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
