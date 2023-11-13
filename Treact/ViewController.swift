//
//  ViewController.swift
//  Treact
//
//  Created by User on 13.11.23.
//

import UIKit

class ViewController: UIViewController {

    var timerButton: UIButton!
    
    var timerStarted = false
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .black
        
        timerButton = UIButton(type: .system)
        timerButton.translatesAutoresizingMaskIntoConstraints = false
        timerButton.setTitle("START", for: .normal)
        view.addSubview(timerButton)
        timerButton.addTarget(self, action: #selector(startTapped), for: .touchUpInside)
        
        timerButton.layer.borderColor = UIColor.blue.cgColor
        timerButton.layer.borderWidth = 1.5
        timerButton.layer.cornerRadius = 50.0 // height / 2
        timerButton.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            timerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            timerButton.heightAnchor.constraint(equalToConstant: 100),
            timerButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func startTapped(_ sender: UIButton) {
        print("button tapped")
    }

}

