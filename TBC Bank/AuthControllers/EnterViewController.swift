//
//  ViewController.swift
//  TBC Bank
//
//  Created by Владислав Усачев on 31.07.2024.
//

import UIKit

class EnterViewController: UIViewController {
    
    let navBarImageView = UIImageView()
    let rocketImageView = UIImageView()
    let loginButton = UIImageView()
    let nextButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        print("View Did Loaded")
        // Do any additional setup after loading the view.
    }
    
    func setUpView() {
        navBarImageView.image = UIImage(named: "navBarImage")
        navBarImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navBarImageView)
        
        rocketImageView.image = UIImage(named: "rocket")
        rocketImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rocketImageView)
//        
        loginButton.image = UIImage(named: "login_buttons")
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
        nextButton.backgroundColor = .clear
        nextButton.titleLabel?.text = ""
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            navBarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navBarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBarImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBarImageView.heightAnchor.constraint(equalToConstant: 80),
            
            rocketImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            rocketImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            rocketImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rocketImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 200),
            
            nextButton.bottomAnchor.constraint(equalTo: loginButton.bottomAnchor),
            nextButton.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            nextButton.topAnchor.constraint(equalTo: loginButton.topAnchor)
            
        ])
        
        
    }
    
    @objc func nextButtonTapped() {
        let newVC = EnterNumberViewController()
        newVC.modalPresentationStyle = .fullScreen
        present(newVC, animated: true, completion: nil)
    }


}

