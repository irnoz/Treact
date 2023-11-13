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
    var TimeString = "00 : 00 : 00"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .black
        
        // Start button
        timerButton = UIButton(type: .system)
        timerButton.translatesAutoresizingMaskIntoConstraints = false
        timerButton.setTitle("START", for: .normal)
        timerButton.setTitleColor(.white, for: .normal)
        view.addSubview(timerButton)
        timerButton.addTarget(self, action: #selector(startTapped), for: .touchUpInside)
        
        // Start button border
        timerButton.layer.borderColor = UIColor.clear.cgColor
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
        
        timerButton.setTitle("\(TimeString)", for: .normal)
        
        // Create a CABasicAnimation to change the border color
        let colorAnimation = CABasicAnimation(keyPath: "borderColor")
        colorAnimation.fromValue = UIColor.red.cgColor
        colorAnimation.toValue = UIColor.green.cgColor
        colorAnimation.duration = 10.0 // 10 seconds

        // Add the animation to the button's layer
        timerButton.layer.add(colorAnimation, forKey: "borderColorAnimation")
        
        // Create a CABasicAnimation to change the background color
        let backgroundColorAnimation = CABasicAnimation(keyPath: "backgroundColor")
        backgroundColorAnimation.fromValue = UIColor.red.cgColor
        backgroundColorAnimation.toValue = UIColor.green.cgColor
        backgroundColorAnimation.duration = 10.0 // 10 seconds

        // Add the animation to the button's layer
        timerButton.layer.add(backgroundColorAnimation, forKey: "backgroundColorAnimation")
    }

}

