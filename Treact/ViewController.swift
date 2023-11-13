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
    
    var timer: Timer = Timer()
    var timerStarted = false
    var counter = 0
    var timeString = "00 : 00 : 00"
    
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
        if (timerStarted) {
            timerButton.backgroundColor = .clear
            timerButton.setTitle("START", for: .normal)
            
            let alertController = UIAlertController(title: "Well done!", message: "you tapped at exactly \(timeString)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: restartTimer))
            present(alertController, animated: true)
        } else {
            startBackgroundAnimation()
            timerStarted = true
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
        //        timerButton.setTitle("\(TimeString)", for: .normal)
    }
    
    
    
    @objc func timerCounter() -> Void {
        counter += 1
        let time = convertSeconds(seconds: counter)
        let timeStirng = generateTimeString(hours: time.hours, minutes: time.minutes, seconds: time.seconds)
        timerButton.setTitle(timeStirng, for: .normal)
    }
    
    func restartTimer(action: UIAlertAction) {
        timerStarted = false
//        timeString = "00 : 00 : 00"
        counter = 0
        timer.invalidate()
    }
    
    func startBackgroundAnimation() {
        // Create a CABasicAnimation to change the background color
        let backgroundColorAnimation = CABasicAnimation(keyPath: "backgroundColor")
        backgroundColorAnimation.fromValue = UIColor.red.cgColor
        backgroundColorAnimation.toValue = UIColor.green.cgColor
        backgroundColorAnimation.duration = 10.0 // 10 seconds
        
        // Add the animation to the button's layer
        timerButton.layer.add(backgroundColorAnimation, forKey: "backgroundColorAnimation")
    }
    
    func convertSeconds(seconds: Int) -> (hours: Int, minutes: Int, seconds: Int) {
        return (seconds / 3600, (seconds % 3600) / 60, ((seconds % 3600) % 60))
    }
    
    func generateTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", hours) + " : " +
                      String(format: "%02d", minutes) + " : " +
                      String(format: "%02d", seconds)
        return timeString
    }
    
}

