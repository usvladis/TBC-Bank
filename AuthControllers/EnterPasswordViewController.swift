//
//  EnterPasswordViewController.swift
//  TBC Bank
//
//  Created by Владислав Усачев on 01.08.2024.
//

import UIKit

class EnterPasswordViewController: UIViewController{
    let backgroundView = UIView()
    let enterImageView = UIImageView()
    let nextButtonImageView = UIImageView()
    let circlesImageVies = UIImageView()
    let passwordLabel = UILabel()
    let nextButton = UIButton()
    
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.setUpFaceIDAnimation()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.circlesImageVies.image = UIImage(named: "circles_group_filled")
            self.animateCircles()
        }
    }
    
    func setUpView() {
        backgroundView.backgroundColor = UIColor(named: "greyTBC")
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        
        enterImageView.image = UIImage(named: "enter_logo")
        enterImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(enterImageView)
        
        nextButtonImageView.image = UIImage(named: "next_button_screen")
        nextButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextButtonImageView)
        
        circlesImageVies.image = UIImage(named: "circles_group")
        circlesImageVies.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(circlesImageVies)
        
        passwordLabel.text = "Введите пароль"
        passwordLabel.font = UIFont(name: "System-Regular", size: 16)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordLabel)
        
        nextButton.backgroundColor = .clear
        nextButton.titleLabel?.text = ""
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 120),
            
            enterImageView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            enterImageView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            enterImageView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            enterImageView.heightAnchor.constraint(equalToConstant: 90),
            
            passwordLabel.topAnchor.constraint(equalTo: enterImageView.bottomAnchor, constant: 28),
            passwordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            circlesImageVies.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 6),
            circlesImageVies.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circlesImageVies.widthAnchor.constraint(equalToConstant: 110),
            circlesImageVies.heightAnchor.constraint(equalToConstant: 22),
            
            nextButtonImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            nextButtonImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nextButtonImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nextButtonImageView.heightAnchor.constraint(equalToConstant: 250),
            
            nextButton.bottomAnchor.constraint(equalTo: nextButtonImageView.bottomAnchor),
            nextButton.leadingAnchor.constraint(equalTo: nextButtonImageView.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: nextButtonImageView.trailingAnchor),
            nextButton.topAnchor.constraint(equalTo: nextButtonImageView.topAnchor)
        ])
    }
    
    func setUpFaceIDAnimation() {
        guard let gifImage = UIImage.gif(name: "faceID") else { return } // Убедитесь, что у вас есть изображение с именем "face_id_animation"
        imageView.image = gifImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // Устанавливаем таймер для скрытия изображения после завершения анимации
        let duration = gifImage.duration // Длительность анимации в секундах
        Timer.scheduledTimer(timeInterval: duration, target: self, selector: #selector(nextButtonTapped), userInfo: nil, repeats: false)
    }
    
    func animateCircles() {
        let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
        pulseAnimation.duration = 0.6
        pulseAnimation.fromValue = 1.0
        pulseAnimation.toValue = 1.2
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = 1
        circlesImageVies.layer.add(pulseAnimation, forKey: "pulse")
    }
    
    @objc func nextButtonTapped() {
        let newVC = WelcomeViewController()
        newVC.modalPresentationStyle = .fullScreen
        present(newVC, animated: false, completion: nil)
    }
}
