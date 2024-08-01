//
//  BankMainViewController.swift
//  TBC Bank
//
//  Created by Владислав Усачев on 01.08.2024.
//

import UIKit

class BankMainViewController: UIViewController{
    
    let backgroundView = UIView()
    let headerImage = UIImageView()
    let headerButton = UIButton()
    let balanceImage = UIImageView()
    let balanceButton = UIButton()
    let buttonsImage = UIImageView()
    let storiesImage = UIImageView()
    let creditImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
    }
    
    func setUpView() {
        backgroundView.backgroundColor = UIColor(named: "lightblueTBC")
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        
        headerImage.image = UIImage(named: "TBC_nav_bar")
        headerImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(headerImage)
        
        headerButton.backgroundColor = .clear
        headerButton.addTarget(self, action: #selector(headerButtonTapped), for: .touchUpInside)
        headerButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(headerButton)
        
        balanceImage.image = UIImage(named: "TBC_balance")
        balanceImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(balanceImage)
        
        balanceButton.backgroundColor = .clear
        balanceButton.addTarget(self, action: #selector(balanceButtonTapped), for: .touchUpInside)
        balanceButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(balanceButton)
        
        buttonsImage.image = UIImage(named: "TBC_buttons")
        buttonsImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(buttonsImage)
        
        storiesImage.image = UIImage(named: "TBC_stories")
        storiesImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(storiesImage)
        
        creditImage.image = UIImage(named: "TBC_credit_banner")
        creditImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(creditImage)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 440),
            
            headerImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerImage.heightAnchor.constraint(equalToConstant: 60),
            
            headerButton.topAnchor.constraint(equalTo: headerImage.topAnchor),
            headerButton.leadingAnchor.constraint(equalTo: headerImage.leadingAnchor),
            headerButton.trailingAnchor.constraint(equalTo: headerImage.trailingAnchor),
            headerButton.bottomAnchor.constraint(equalTo: headerImage.bottomAnchor),
            
            balanceImage.topAnchor.constraint(equalTo: headerImage.bottomAnchor, constant: 60),
            balanceImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            balanceImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            balanceImage.heightAnchor.constraint(equalToConstant: 120),
            
            balanceButton.topAnchor.constraint(equalTo: balanceImage.topAnchor),
            balanceButton.leadingAnchor.constraint(equalTo: balanceImage.leadingAnchor),
            balanceButton.trailingAnchor.constraint(equalTo: balanceImage.trailingAnchor),
            balanceButton.bottomAnchor.constraint(equalTo: balanceImage.bottomAnchor),
            
            buttonsImage.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -20),
            buttonsImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonsImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonsImage.heightAnchor.constraint(equalToConstant: 80),
            
            storiesImage.topAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            storiesImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            storiesImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            storiesImage.heightAnchor.constraint(equalToConstant: 140),
            
            creditImage.topAnchor.constraint(equalTo: storiesImage.bottomAnchor),
            creditImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            creditImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            creditImage.heightAnchor.constraint(equalToConstant: 250),
            
        ])
    }
    
    @objc func headerButtonTapped() {
        let newVC = ProfileViewController()
        newVC.modalPresentationStyle = .fullScreen
        present(newVC, animated: true, completion: nil)
    }
    
    @objc func balanceButtonTapped() {
        let newVC = ManageViewController()
        newVC.modalPresentationStyle = .fullScreen
        present(newVC, animated: true, completion: nil)
    }
}
