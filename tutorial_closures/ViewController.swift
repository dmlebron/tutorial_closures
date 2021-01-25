//
//  ViewController.swift
//  tutorial_closures
//
//  Created by Dava on 5/6/17.
//  Copyright © 2017 Davaur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "My Label"
        
        return label
    }()
    
    private lazy var showVCButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(showViewController(sender:)), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textLabel)
        view.addSubview(showVCButton)
        
        addConstraints()
    }
    
    @objc private func showViewController(sender: UIButton) {
        if let secondViewController = storyboard?.instantiateViewController(withIdentifier: "secondViewController") as? SecondViewController {
            
            // TODO: listen for second view controller closure
            
            present(secondViewController, animated: true, completion: nil)
        }
    }
    
    private func addConstraints() {
        // label constraints
        textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        // button contraints
        showVCButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 16).isActive = true
        showVCButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showVCButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        showVCButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.setNeedsLayout()
    }
}
