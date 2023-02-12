//
//  RegisterTextField.swift
//  LoginScreen
//
//  Created by brubru on 14.12.2022.
//

import UIKit

//MARK: - RegisterTextField
final class RegisterTextField: UITextField {
    
    private let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 40)
    
    //MARK: - Initializers
    init(placeholder: String) {
        super.init(frame: .zero)
        setupTextField(placeholder: placeholder)
    }
    
    @available(*, unavailable) // никогда не используется, потому что нам не нужен инит сториборда
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Override Methods
    override func textRect(forBounds bounds: CGRect) -> CGRect { // Этот метод отвечает за размещение текста, внесенного пользователем
        // bounds прямоугольник для текстового поля
        // И мы для него задаем размеры при помощи метода inset, в параметр которого передаем размеры.
        bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        // отвечает ра заположение плейсхолдера
        bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        // отвечает за размещение текста после редактирования
        bounds.inset(by: padding)
    }
    
    //MARK: - Private Methods
    private func setupTextField(placeholder: String) {
        textColor = .white
        
        layer.cornerRadius = 10
        layer.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 7
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 15, height: 15)
        
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemCyan])
        font = .boldSystemFont(ofSize: 18)
        
        isSecureTextEntry = true
        
        heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
