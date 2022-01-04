//
//  FooterUIView.swift
//  DanaReksa
//
//  Created by Farhandika on 04/01/22.
//

import UIKit

final class FooterUIView: UIView {
    
    private lazy var detailStackView = UIStackView()
    private lazy var buyStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
