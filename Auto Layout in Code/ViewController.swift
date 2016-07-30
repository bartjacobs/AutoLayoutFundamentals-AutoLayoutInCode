//
//  ViewController.swift
//  Auto Layout in Code
//
//  Created by Bart Jacobs on 30/07/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var containerView = UIView()

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: - View Methods

    private func setupView() {
        setupContainerView()
    }

    private func setupContainerView() {
        // Configure Container View
        containerView.backgroundColor = UIColor.grayColor()
        containerView.translatesAutoresizingMaskIntoConstraints = false

        // Add to Superview
        view.addSubview(containerView)

        // Width
        let constraintWidth = NSLayoutConstraint(
            item: containerView,
            attribute: .Width,
            relatedBy: .LessThanOrEqual,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1.0,
            constant: 320.0
        )
        
        // Add Constraint
        containerView.addConstraint(constraintWidth)

        // Center
        let constraintCenter = NSLayoutConstraint(
            item: containerView,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: view,
            attribute: .CenterX,
            multiplier: 1.0,
            constant: 0.0
        )

        // Add Constraint
        view.addConstraint(constraintCenter)

        // Top
        let constraintTop = NSLayoutConstraint(
            item: containerView,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: topLayoutGuide,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 8.0
        )

        // Add Constraint
        view.addConstraint(constraintTop)

        // Bottom
        let constraintBottom = NSLayoutConstraint(
            item: containerView,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: bottomLayoutGuide,
            attribute: .Top,
            multiplier: 1.0,
            constant: 0.0
        )

        // Add Constraint
        view.addConstraint(constraintBottom)

        // Leading
        let constraintLeading = NSLayoutConstraint(
            item: containerView,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Leading,
            multiplier: 1.0,
            constant: 0.0
        )
        
        constraintLeading.priority = 750.0
        
        // Add Constraint
        view.addConstraint(constraintLeading)
        
        // Trailing
        let constraintTrailing = NSLayoutConstraint(
            item: containerView,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Trailing,
            multiplier: 1.0,
            constant: 0.0
        )
        
        constraintTrailing.priority = 750.0
        
        // Add Constraint
        view.addConstraint(constraintTrailing)
    }

}
