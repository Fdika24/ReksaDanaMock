//
//  BuyButtonTableViewCell.swift
//  DanaReksa
//
//  Created by Farhandika on 04/01/22.
//

import UIKit

class BuyButtonTableViewCell: UITableViewCell {
    
    private lazy var greenView:UIButton = {
        let view = UIButton()
        view.setTitle("Beli", for: .normal)
        view.setTitleColor(UIColor.black, for: .normal)
        view.backgroundColor = .greenBareksaNormal
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var purpleView:UIButton = {
        let view = UIButton()
        view.setTitle("Beli", for: .normal)
        view.setTitleColor(UIColor.black, for: .normal)
        view.backgroundColor = .greenBareksaNormal
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var blueView:UIButton = {
        let view = UIButton()
        view.setTitle("Beli", for: .normal)
        view.setTitleColor(UIColor.black, for: .normal)
        view.backgroundColor = .greenBareksaNormal
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    private let stackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initializeStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initializeStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.addArrangedSubview(greenView)
        stackView.addArrangedSubview(purpleView)
        self.contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
    
    public func initializeBlueViews() {
        stackView.addArrangedSubview(blueView)
    }
    
}
