//
//  EyeButton.swift
//  ProgramTextFieldApp
//
//  Created by brubru on 22.12.2022.
//

import UIKit

final class EyeButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupEyeButton()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupEyeButton() {
        setImage(UIImage(systemName:  "eye.slash"), for: .normal)
        tintColor = .white
        isEnabled = false
        widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
