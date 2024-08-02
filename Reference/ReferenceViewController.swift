//
//  ReferebceViewController.swift
//  TBC Bank
//
//  Created by Владислав Усачев on 01.08.2024.
//

import UIKit

class ReferenceViewController: UIViewController, UIScrollViewDelegate{
    let scrollView = UIScrollView()
    let imageView = UIImageView()
    let shareButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpScrollView()
        setUpImageView()
        setUpShareButton()
    }
    
    func setUpScrollView() {
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 6.0
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setUpImageView() {
        guard let image = UIImage(named: "page_image_1") else { return } // Убедитесь, что у вас есть изображение с именем "page_image_1"
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100),
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            imageView.heightAnchor.constraint(equalToConstant: image.size.height * (view.bounds.width / image.size.width))
        ])
        
        scrollView.contentSize = CGSize(width: view.bounds.width, height: image.size.height * (view.bounds.width / image.size.width))
    }
    
    func setUpShareButton() {
        shareButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        
        shareButton.tintColor = .white // Убедитесь, что у вас правильный цвет для изображения
        
        // Стиль для круглой кнопки
        shareButton.backgroundColor = UIColor(named: "blueTBC")
        shareButton.layer.cornerRadius = 30 // Половина от 60
        shareButton.clipsToBounds = true
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        view.addSubview(shareButton)
        
        NSLayoutConstraint.activate([
            shareButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            shareButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shareButton.heightAnchor.constraint(equalToConstant: 60),
            shareButton.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc func shareButtonTapped() {
        guard let image = imageView.image else { return }
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    // UIScrollViewDelegate method for zooming
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
