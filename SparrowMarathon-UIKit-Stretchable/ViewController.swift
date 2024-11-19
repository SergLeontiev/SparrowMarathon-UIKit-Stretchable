//
//  ViewController.swift
//  SparrowMarathon-UIKit-Stretchable
//
//  Created by Sergey Leontiev on 19.11.24..
//

import UIKit

class ViewController: UIViewController {
    private var imageViewHeightConstraint: NSLayoutConstraint?
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "shrek")
        imageView.contentMode = .top
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 300)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.addSubview(scrollView)
        view.addSubview(imageView)
       
        imageViewHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: 270)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageViewHeightConstraint!,
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 270),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        imageViewHeightConstraint?.constant = max(270 - scrollView.contentOffset.y, 0)
    }
}
