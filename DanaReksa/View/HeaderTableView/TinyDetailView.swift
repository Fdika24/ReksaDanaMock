//
//  TinyDetailView.swift
//  DanaReksa
//
//  Created by Farhandika on 04/01/22.
//

import UIKit

class TheDetailView:UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(label labelText:String,image:String) {
        let label = UILabel()
        label.font = label.font.withSize(10)
        label.text = labelText
        label.translatesAutoresizingMaskIntoConstraints = false
        let dot = UIImageView(image: UIImage(named: image))
        dot.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(dot)
        self.addSubview(label)
        
        NSLayoutConstraint.activate([
            dot.widthAnchor.constraint(equalToConstant: 18),
            dot.heightAnchor.constraint(equalToConstant: 18),
            dot.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            dot.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            label.leadingAnchor.constraint(equalTo: dot.trailingAnchor,constant: 6),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}

class TinyDetailView: UIView {
    
    let blueItem:TheDetailView = {
        let view = TheDetailView()
        return view
    }()

    let purpleItem:TheDetailView = {
        let view = TheDetailView()
        return view
    }()

    let greenItem:TheDetailView = {
        let view = TheDetailView()
        return view
    }()

    private lazy var dateLabel:UILabel = {
        let label = UILabel()
        let currentDateTime = Date()
        let convertDateFormatter = DateFormatter()
        convertDateFormatter.dateFormat = "dd MMM yyyy"
        label.text = "(\(convertDateFormatter.string(from: currentDateTime)))"
        label.font = label.font.withSize(14)
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        //stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
       return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor.surfaceDark
        setInitialContentData()
        self.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 6),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -6),
            stackView.topAnchor.constraint(equalTo: self.topAnchor,constant: 6),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -6),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setInitialContentData() {
        blueItem.setup(label: "nan %", image: "blueDot")
        greenItem.setup(label: "nan %", image: "greenDot")
        purpleItem.setup(label: "nan %", image: "purpleDot")
        stackView.addArrangedSubview(greenItem)
        stackView.addArrangedSubview(purpleItem)
        stackView.addArrangedSubview(blueItem)
        stackView.addArrangedSubview(dateLabel)
    }
    public func removeBlueView() {
        blueItem.removeFromSuperview()
    }
}
