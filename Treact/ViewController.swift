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
        
//        // Add padding to the button's frame
//        let padding: CGFloat = 10.0
//        timerButton.frame = CGRect(x: timerButton.frame.origin.x - padding, y: timerButton.frame.origin.y - padding, width: timerButton.frame.size.width + 2 * padding, height: timerButton.frame.size.height + 2 * padding)
//
//        // Make the button fully circular
//        timerButton.layer.cornerRadius = timerButton.frame.size.height / 2.0
//        timerButton.layer.borderWidth = 1.0
//        timerButton.layer.borderColor = UIColor.blue.cgColor
        
        timerButton.layer.borderColor = UIColor.red.cgColor
        timerButton.layer.borderWidth = 1.5
        timerButton.layer.cornerRadius = 25.0 // height / 2
        timerButton.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            timerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            timerButton.heightAnchor.constraint(equalToConstant: 50),
            timerButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func startTapped(_ sender: UIButton) {
        print("button tapped")
    }

}

