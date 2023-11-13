//
//  ViewController.swift
//  Treact
//
//  Created by User on 13.11.23.
//

import UIKit

class ViewController: UIViewController {

    var scoreLabel: UILabel!
    var gameLabel: UILabel!
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
        
        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.textAlignment = .right
        scoreLabel.textColor = .white
        scoreLabel.text = "Score: 0"
        view.addSubview(scoreLabel)
        
        // gameLabel
        gameLabel = UILabel()
        gameLabel.translatesAutoresizingMaskIntoConstraints = false
        gameLabel.textAlignment = .center
        gameLabel.textColor = .white
        gameLabel.font = .boldSystemFont(ofSize: 24)
        gameLabel.numberOfLines = 0
        gameLabel.text = "To play press start and try to \npress after exactly 10 seconds"
        view.addSubview(gameLabel)
        
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
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0),
            
            gameLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 16),
            gameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
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

