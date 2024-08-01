//
//  ProfileViewController.swift
//  TBC Bank
//
//  Created by Владислав Усачев on 01.08.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    let backgroundView = UIView()
    let label = UILabel()
    let backButton = UIButton()
    let profileImage = UIImageView()
    let buttonImage = UIImageView()
    let logoutImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
    }
    
    func setUpView() {
        backgroundView.backgroundColor = UIColor(named: "greyTBC")
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        
        label.text = "Управление счетом"
        label.font = UIFont(name: "System-Regular", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(label)
        
        backButton.setImage(UIImage(named: "back_button"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(backButton)
        
        profileImage.image = UIImage(named: "profile_info_image")
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImage)
        
        buttonImage.image = UIImage(named: "show_more_button")
        buttonImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonImage)
        
        logoutImage.image = UIImage(named: "logout_button")
        logoutImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoutImage)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 120),
            
            backButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            backButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -20),
            backButton.widthAnchor.constraint(equalToConstant: 12),
            backButton.heightAnchor.constraint(equalToConstant: 23),
            
            label.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -20),
            
            profileImage.topAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: 250),
            
            buttonImage.topAnchor.constraint(equalTo: profileImage.bottomAnchor),
            buttonImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonImage.heightAnchor.constraint(equalToConstant: 50),
            
            logoutImage.topAnchor.constraint(equalTo: buttonImage.bottomAnchor, constant: 40),
            logoutImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logoutImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            logoutImage.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true)
    }
}
