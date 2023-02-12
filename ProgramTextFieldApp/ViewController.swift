//
//  ViewController.swift
//  ProgramTextFieldApp
//
//  Created by brubru on 21.12.2022.
//

import UIKit
//MARK: - ViewController
final class ViewController: UIViewController {
    
    //MARK: - Private property
    private let registerTextField = RegisterTextField(placeholder: "Enter your password")
    private let eyeButton = EyeButton()
    
    private var isPrivate = true

    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK: - Actions
    @objc
    private func displayBookmarks() {
        let imageName = isPrivate ? "eye" : "eye.slash"
        
        registerTextField.isSecureTextEntry.toggle()
        eyeButton.setImage(UIImage(systemName:  imageName), for: .normal)
        isPrivate.toggle()
    }
}

//MARK: - Settings View
private extension ViewController {
    func setupViews() {
        view.backgroundColor = .systemCyan
        addSubviews()
        
        addActions()

        setupPasswordTF()
        
        setupLayout()
    }
}

//MARK: - Setting
private extension ViewController {
    func addSubviews() {
        view.addSubview(registerTextField)
    }
    
    func addActions() {
        eyeButton.addTarget(self, action: #selector(displayBookmarks),
            for: .touchUpInside)
    }
    
    func setupPasswordTF() {
        registerTextField.delegate = self
        registerTextField.rightView = eyeButton
        registerTextField.rightViewMode = .always
    }
}

//MARK: - Layout
private extension ViewController {
    func setupLayout() {
        registerTextField.translatesAutoresizingMaskIntoConstraints = false
        
        registerTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        registerTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
    }
}

//MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        eyeButton.isEnabled = !text.isEmpty
    }
}
