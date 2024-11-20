//
//  ViewController.swift
//  SparrowMarathon-UIKit-Stretchable
//
//  Created by Sergey Leontiev on 19.11.24..
//

import UIKit

class ViewController: UIViewController {
    private let imageHeight: CGFloat = 270
    private var imageViewHeightConstraint: NSLayoutConstraint?
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "image1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + imageHeight)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.addSubview(scrollView)
        view.addSubview(imageView)
       
        imageViewHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: imageHeight)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageViewHeightConstraint!,
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: imageHeight - 20),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        imageViewHeightConstraint?.constant = max(imageHeight - offset, 0)
        if offset <= 0 {
            scrollView.verticalScrollIndicatorInsets.top = -scrollView.contentOffset.y + 25
        }
    }
}
