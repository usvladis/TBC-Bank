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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
        print("View Did Loaded")
        // Do any additional setup after loading the view.
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
    
    @objc func nextButtonTapped() {
        let newVC = WelcomeViewController()
        newVC.modalPresentationStyle = .fullScreen
        present(newVC, animated: false, completion: nil)
    }
}
