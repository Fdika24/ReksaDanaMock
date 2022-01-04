//
//  SecondaryTableViewCell.swift
//  DanaReksa
//
//  Created by Farhandika on 03/01/22.
//

import UIKit

class SecondaryTableViewCell: UITableViewCell {
    
    private lazy var greenView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.greenBareksaLight
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
        ])
        return view
    }()
    
    private lazy var purpleView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.purpleBareksaLight
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var blueView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blueBareksaLight
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
        ])
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
            //stackView.widthAnchor.constraint(equalToConstant: self.bounds.width),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
    public func setContent(green:String,purple:String,blue:String) {
        setLabel(text: green, view: &greenView)
        setLabel(text: purple, view: &purpleView)
        setLabel(text: blue, view: &blueView)
    }
    private func setLabel(text:String, view:inout UIView ) {
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = text
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
        ])
    }
}
