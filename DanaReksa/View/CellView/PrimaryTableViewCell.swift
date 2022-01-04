//
//  PrimaryTableViewCell.swift
//  DanaReksa
//
//  Created by Farhandika on 04/01/22.
//

import UIKit

class PrimaryTableViewCell: UITableViewCell {
    
    private let stackView = UIStackView()
    
    private lazy var greenView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.greenBareksaLight
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
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
    public func initializeBlueViews() {
        stackView.addArrangedSubview(blueView)
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
            stackView.heightAnchor.constraint(equalToConstant: 150),
            //stackView.widthAnchor.constraint(equalToConstant: self.bounds.width),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
    public func setCardContent(
        greenTitle:String,
        greenAvatar:String,
        purpleTitle:String,
        purpleAvatar:String,
        blueTitle:String,
        blueAvatar:String
    ) {
        addCardContent(title: greenTitle, avatar: greenAvatar, view: &greenView)
        addCardContent(title: purpleTitle, avatar: purpleAvatar, view: &purpleView)
        addCardContent(title: blueTitle, avatar: blueAvatar, view: &blueView)
    }
    
    private func addCardContent(title:String, avatar:String, view:inout UIView) {
        let label = UILabel(frame: CGRect(
            x: 30,
            y: view.layer.bounds.width*0.35 + 5,
            width: view.layer.bounds.width-(16*2),
            height: 120))
        label.text = title
        label.font = label.font.withSize(14)
        label.textAlignment = .left
        label.numberOfLines = 3
        
        let image = UIImageView()
        image.loadImageRemotely(link: avatar)
        image.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(image)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            //Image
            image.topAnchor.constraint(equalTo: view.topAnchor,constant: 16),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            image.widthAnchor.constraint(equalToConstant: view.layer.bounds.width*0.35),
            image.heightAnchor.constraint(equalToConstant: view.layer.bounds.width*0.35),
        ])
    }

}
