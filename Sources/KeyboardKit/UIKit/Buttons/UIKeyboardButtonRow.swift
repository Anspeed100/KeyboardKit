//
//  UIKeyboardButtonRow.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2019-04-28.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This view presents buttons in horizontal rows. The provided
 `buttonCreator` function maps each action to a view.
 */
open class UIKeyboardButtonRow: UIView, KeyboardStackViewComponent {
    
    public convenience init(
        actions: KeyboardActions,
        height: CGFloat = .standardKeyboardRowHeight(),
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fillEqually,
        buttonCreator: KeyboardButtonCreator) {
        self.init(frame: .zero)
        self.height = height
        buttonStackView.alignment = alignment
        buttonStackView.distribution = distribution
        let buttons = actions.map { buttonCreator($0) }
        buttonStackView.addArrangedSubviews(buttons)
    }
    
    public typealias KeyboardButtonCreator = (KeyboardAction) -> (UIView)
    
    public var heightConstraint: NSLayoutConstraint?
    
    public lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        addSubview(stackView, fill: true)
        return stackView
    }()
}