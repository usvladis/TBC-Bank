//
//  ReferenceLoaderViewController.swift
//  TBC Bank
//
//  Created by Владислав Усачев on 01.08.2024.
//

import UIKit

class ReferenceLoaderViewController: UIViewController{
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.showNextController()
        }
    }
    
    func setUpView(){
        imageView.image = UIImage(named: "TBC_loader")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func showNextController() {
        let newVC = ReferenceViewController()
        newVC.modalPresentationStyle = .fullScreen
        present(newVC, animated: false, completion: nil)
    }
}
