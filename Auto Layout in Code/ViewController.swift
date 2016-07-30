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

        setupForm()
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

    private func setupForm() {
        // Initialize Labels
        let labelFirstName = UILabel()
        labelFirstName.text = "First Name"
        labelFirstName.textAlignment = .Right
        labelFirstName.setContentHuggingPriority(251.0, forAxis: .Horizontal)

        let labelLastName = UILabel()
        labelLastName.text = "Last Name"
        labelLastName.textAlignment = .Right
        labelLastName.setContentHuggingPriority(251.0, forAxis: .Horizontal)

        let labelEmail = UILabel()
        labelEmail.text = "Email"
        labelEmail.textAlignment = .Right
        labelEmail.setContentHuggingPriority(251.0, forAxis: .Horizontal)

        // Initialize Text Fields
        let textFieldFirstName = UITextField()
        textFieldFirstName.borderStyle = .RoundedRect

        let textFieldLastName = UITextField()
        textFieldLastName.borderStyle = .RoundedRect

        let textFieldEmail = UITextField()
        textFieldEmail.borderStyle = .RoundedRect

        // Initialize Submit Button
        let submitButton = UIButton()
        submitButton.setTitle("Submit", forState: .Normal)
        submitButton.setTitleColor(UIColor(red: 0.086, green: 0.494, blue: 0.984, alpha: 1.0), forState: .Normal)

        let metrics = [
            "heightLabel" : 30.0,
            "heightTextField" : 30.0,
            "heightSubmitButton" : 30.0
        ]

        let views = [
            "labelFirstName" : labelFirstName,
            "textFieldFirstName" : textFieldFirstName,
            "labelLastName" : labelLastName,
            "textFieldLastName" : textFieldLastName,
            "labelEmail" : labelEmail,
            "textFieldEmail" : textFieldEmail,
            "submitButton" : submitButton
        ]

        for (_, subview) in views {
            // Configure Subview
            subview.translatesAutoresizingMaskIntoConstraints = false

            // Add to Superview
            containerView.addSubview(subview)
        }

        let formatHorizontalFirstName = "H:|-8-[labelFirstName]-8-[textFieldFirstName]-8-|"
        let formatHorizontalLastName = "H:|-8-[labelLastName]-8-[textFieldLastName]-8-|"
        let formatHorizontalEmail = "H:|-8-[labelEmail]-8-[textFieldEmail]-8-|"
        let formatHorizontalSubmitButton = "H:|-8-[submitButton]-8-|"

        let formatVerticalLabels = "V:|-8-[labelFirstName(==heightLabel)]-8-[labelLastName(==heightLabel)]-8-[labelEmail(==heightLabel)]-8-[submitButton(==heightSubmitButton)]"
        let formatVerticalTextFields = "V:|-8-[textFieldFirstName(==heightTextField)]-8-[textFieldLastName(==heightTextField)]-8-[textFieldEmail(==heightTextField)]"

        let constraintsHorizontalFirstName = NSLayoutConstraint.constraintsWithVisualFormat(formatHorizontalFirstName, options: [], metrics: nil, views: views)
        let constraintsHorizontalLastName = NSLayoutConstraint.constraintsWithVisualFormat(formatHorizontalLastName, options: [], metrics: nil, views: views)
        let constraintsHorizontalEmail = NSLayoutConstraint.constraintsWithVisualFormat(formatHorizontalEmail, options: [], metrics: nil, views: views)
        let constraintsHorizontalSubmitButton = NSLayoutConstraint.constraintsWithVisualFormat(formatHorizontalSubmitButton, options: [], metrics: nil, views: views)

        let constraintsVerticalLabels = NSLayoutConstraint.constraintsWithVisualFormat(formatVerticalLabels, options: [], metrics: metrics, views: views)
        let constraintsVerticalTextFields = NSLayoutConstraint.constraintsWithVisualFormat(formatVerticalTextFields, options: [.AlignAllLeading], metrics: metrics, views: views)

        containerView.addConstraints(constraintsHorizontalFirstName)
        containerView.addConstraints(constraintsHorizontalLastName)
        containerView.addConstraints(constraintsHorizontalEmail)
        containerView.addConstraints(constraintsHorizontalSubmitButton)
        
        containerView.addConstraints(constraintsVerticalLabels)
        containerView.addConstraints(constraintsVerticalTextFields)
    }

}
