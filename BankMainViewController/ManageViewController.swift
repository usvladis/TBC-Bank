//
//  ManageViewController.swift
//  TBC Bank
//
//  Created by Владислав Усачев on 01.08.2024.
//

import UIKit

class ManageViewController: UIViewController{
    let backgroundView = UIView()
    let bottomView = UIView()
    let label = UILabel()
    let backButton = UIButton()
    let infoImage = UIImageView()
    let lineImage = UIImageView()
    var firstDate = UIDatePicker()
    var secondDate = UIDatePicker()
    let nextImage = UIImageView()
    let nextButton = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
    }
    
    func setUpView() {
        backgroundView.backgroundColor = UIColor(named: "greyTBC")
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        
        bottomView.backgroundColor = UIColor(named: "greyTBC")
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomView)
        
        label.text = "Управление счетом"
        label.font = UIFont(name: "System-Regular", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(label)
        
        backButton.setImage(UIImage(named: "back_button"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(backButton)
        
        infoImage.image = UIImage(named: "parametors_image")
        infoImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoImage)
        
        lineImage.image = UIImage(named: "line_separator_image")
        lineImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lineImage)
        
        nextImage.image = UIImage(named: "manage_next_button")
        nextImage.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(nextImage)
        
        nextButton.backgroundColor = .clear
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(nextButton)
        
        firstDate.clipsToBounds = true
        firstDate.locale = Locale(identifier: "ru_RU")
        firstDate.calendar.firstWeekday = 2
        firstDate.datePickerMode = .date
        firstDate.preferredDatePickerStyle = .compact
        firstDate.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstDate)
        
        secondDate.clipsToBounds = true
        secondDate.locale = Locale(identifier: "ru_RU")
        secondDate.calendar.firstWeekday = 2
        secondDate.datePickerMode = .date
        secondDate.preferredDatePickerStyle = .compact
        secondDate.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(secondDate)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 120),
            
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 430),
            
            nextImage.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -40),
            nextImage.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            nextImage.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
            nextImage.heightAnchor.constraint(equalToConstant: 70),
            
            nextButton.bottomAnchor.constraint(equalTo: nextImage.bottomAnchor),
            nextButton.leadingAnchor.constraint(equalTo: nextImage.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: nextImage.trailingAnchor),
            nextButton.topAnchor.constraint(equalTo: nextImage.topAnchor),
            
            backButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            backButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -20),
            backButton.widthAnchor.constraint(equalToConstant: 12),
            backButton.heightAnchor.constraint(equalToConstant: 23),
            
            label.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -20),
            
            infoImage.topAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            infoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoImage.heightAnchor.constraint(equalToConstant: 265),
            
            firstDate.topAnchor.constraint(equalTo: infoImage.bottomAnchor),
            firstDate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            firstDate.heightAnchor.constraint(equalToConstant: 34),
            firstDate.widthAnchor.constraint(equalToConstant: 100),
            
            lineImage.topAnchor.constraint(equalTo: firstDate.bottomAnchor, constant: 5),
            lineImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lineImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lineImage.heightAnchor.constraint(equalToConstant: 30),
            
            secondDate.topAnchor.constraint(equalTo: lineImage.bottomAnchor, constant: 5),
            secondDate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            secondDate.heightAnchor.constraint(equalToConstant: 34),
            secondDate.widthAnchor.constraint(equalToConstant: 100),
            
        ])
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true)
    }
    @objc func nextButtonTapped() {
        let newVC = ReferenceLoaderViewController()
        newVC.modalPresentationStyle = .fullScreen
        present(newVC, animated: false, completion: nil)
    }
}
