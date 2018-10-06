//
//  ViewController.swift
//  Firestore Tutorial
//
//  Created by Uladzislau Daratsiuk on 10/6/18.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {
    
    
    var db: Firestore!
    let userNameField = MainTextField(placeHolderText: "Username", isSecure: false)
    let passowrdField = MainTextField(placeHolderText: "Password", isSecure: true)
    
    lazy var sendButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Send", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(handleSend), for: .touchUpInside)
        return button
    }()
    
    fileprivate func setupView(){
        view.addSubview(userNameField)
        view.addSubview(passowrdField)
        view.addSubview(sendButton)
        
        NSLayoutConstraint.activate([
        userNameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        userNameField.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -10),
        userNameField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
        userNameField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
        userNameField.heightAnchor.constraint(equalToConstant: 40),
        
        passowrdField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        passowrdField.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
        passowrdField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
        passowrdField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
        passowrdField.heightAnchor.constraint(equalToConstant: 40),
        
        sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        sendButton.topAnchor.constraint(equalTo: passowrdField.bottomAnchor, constant: 10),
        sendButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
        sendButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
        sendButton.heightAnchor.constraint(equalToConstant: 40),
        
        
        ])
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        db = Firestore.firestore()
    }


    @objc fileprivate func handleSend(){
        guard let name = userNameField.text else {return}
        guard let password = passowrdField.text else {return}
        
        let user = UserModal(id: 123, username: name, password: password)
        let userRef = self.db.collection("users")
        
        userRef.document(String(user.id)).setData(user.dictionary){ err in
            if err != nil {
                print("issue here")
            }else{
                print("Document was saved")
            }
        }
    }
    
}

