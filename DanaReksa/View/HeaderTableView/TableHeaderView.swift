//
//  TableHeaderView.swift
//  DanaReksa
//
//  Created by Farhandika on 03/01/22.
//

import UIKit
import Charts

protocol imbalHasilSelectorDelegate:AnyObject {
    func didChangeSelectorIndex(idx:Int)
}

class TableHeaderView: UIView {
    weak var delegate:imbalHasilSelectorDelegate?
    
    private lazy var lineChart:LineChartView = {
        let chart = LineChartView()
        chart.translatesAutoresizingMaskIntoConstraints = false
        return chart
    }()
    
    private lazy var tinyDetailView = TinyDetailView(frame:
                                                        CGRect(
                                                            x: 16, y: 10,
                                                            width:UIScreen.main.bounds.width*0.70 , height: 30)) 
        
    private let stackView = UIStackView()
    
    private lazy var bottomBGView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .surfaceDark
        return view
    }()
    
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
    
    private func initiateStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.addArrangedSubview(greenView)
        stackView.addArrangedSubview(purpleView)
        stackView.addArrangedSubview(blueView)
        
        self.addSubview(stackView)
    }
    let yearSegment:UISegmentedControl = {
        let items = ["1W","1M","1Y","3Y","5Y","10Y","ALL"]
        let sc = UISegmentedControl(items: items)
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    // Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(bottomBGView)
        self.addSubview(lineChart)
        //
        //self.initializeSegmentedControl()
        self.initiateStackView()
        //
        //yearSegment.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width-32, height: 50)
        yearSegment.selectedSegmentIndex = 0
        yearSegment.addUnderlineForSelectedSegment()
        yearSegment.addTarget(self, action: #selector(self.filterApply), for: UIControl.Event.valueChanged)
        self.addSubview(yearSegment)
        self.addSubview(tinyDetailView)
        
        NSLayoutConstraint.activate([
            //CHART
            lineChart.topAnchor.constraint(equalTo: self.tinyDetailView.bottomAnchor,constant: 5),
            lineChart.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
            lineChart.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16),
            lineChart.heightAnchor.constraint(equalToConstant: 200),
            //STACKVIEW
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16),
            stackView.topAnchor.constraint(equalTo: self.bottomBGView.topAnchor,constant: 15),
            stackView.heightAnchor.constraint(equalToConstant: 150),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            //Segmented Control
            yearSegment.topAnchor.constraint(equalTo: lineChart.bottomAnchor,constant: 10),
            yearSegment.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            yearSegment.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
            yearSegment.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16),
            
            //Bottom bg
            bottomBGView.topAnchor.constraint(equalTo: self.yearSegment.bottomAnchor,constant: 15),
            bottomBGView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomBGView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomBGView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initializeSegmentedControl() {

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
            x: 16,
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
    
    @objc private func filterApply(segment: UISegmentedControl) -> Void {
        yearSegment.changeUnderlinePosition()
        self.delegate?.didChangeSelectorIndex(idx: segment.selectedSegmentIndex)
    }
}
