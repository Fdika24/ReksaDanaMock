//
//  DetailTableViewCell.swift
//  DanaReksa
//
//  Created by Farhandika on 04/01/22.
//

import UIKit

protocol tapDetailButton:AnyObject {
    func didTapButton(identifier:Int)
}

class DetailTableViewCell: UITableViewCell {
    private lazy var greenView:UIView = {
        let view = UIButton()
        view.setTitle("Detail", for: .normal)
        view.setTitleColor(UIColor.greenBareksaDark, for: .normal)
        view.backgroundColor = .white
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.greenBareksaDark.cgColor
        return view
    }()
    
    private lazy var purpleView:UIView = {
        let view = UIButton()
        view.setTitle("Detail", for: .normal)
        view.setTitleColor(UIColor.greenBareksaDark, for: .normal)
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.greenBareksaDark.cgColor
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return view
    }()
    
    private lazy var blueView:UIView = {
        let view = UIButton()
        view.setTitle("Detail", for: .normal)
        view.setTitleColor(UIColor.greenBareksaDark, for: .normal)
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.greenBareksaDark.cgColor
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .clear
        self.initializeStackView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    private func initializeViews() {
        
    }
    private func initializeStackView() {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.addArrangedSubview(greenView)
        stackView.addArrangedSubview(purpleView)
        stackView.addArrangedSubview(blueView)
        self.contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
}
