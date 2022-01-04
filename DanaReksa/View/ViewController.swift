//
//  ViewController.swift
//  DanaReksa
//
//  Created by Farhandika on 03/01/22.
//

import UIKit
import Charts
import RxSwift

final class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tview = UITableView()
        tview.translatesAutoresizingMaskIntoConstraints = false
        tview.register(BuyButtonTableViewCell.self, forCellReuseIdentifier: buyNowCellIdentifier)
        tview.register(DetailTableViewCell.self, forCellReuseIdentifier: detailCellIdentifier)
        tview.register(SecondaryTableViewCell.self, forCellReuseIdentifier: secondaryCellIdentifier)
        tview.register(UITableViewCell.self, forCellReuseIdentifier: defaultCell)
        tview.backgroundColor = UIColor.surfaceDark
        return tview
    }()
    
    private let tableHeaderView:TableHeaderView = {
        let view = TableHeaderView(frame:
                                    CGRect(x: 0, y: 0,
                                           width: UIScreen.main.bounds.width, height: 460))
        view.backgroundColor = UIColor.white
        return view
    }()
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    private let viewModel = ViewModelDelegate()
    //MARK: View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        
        segmentedControl.addUnderlineForSelectedSegment()
        segmentedControl.selectedSegmentIndex = 0
        
        tableView.delegate = self
        tableView.dataSource = self
        tableHeaderView.delegate = self
        setupTableView()
        self.view.addSubview(self.tableView)
        
        self.getData()
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor,constant: 16),
            self.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 10),
        ])
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    private func setupTableView() {
        self.tableView.tableHeaderView = tableHeaderView
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        let footerView = UIView(
            frame: CGRect(
                x: 0, y: 0,
                width: UIScreen.main.bounds.width, height: 30))
        footerView.backgroundColor = UIColor.surfaceDark
        self.tableView.tableFooterView = footerView
    }
    
    private func getData() {
        viewModel.fetchChartData()
        viewModel.fetchData()
    }
    
    @IBAction func segmentedControlDidChange(_ sender: UISegmentedControl){
        segmentedControl.changeUnderlinePosition()
        print("works")
    }

}

//MARK: ViewModel result delegate
extension ViewController:ResultDelegate {
    func didFinnishFetchChartData() {
        print("works bgt")
    }
    
    func errorOnfetchChartsData(error: Error) {
        
    }
    
    func didFinnishFetchData() {
        /// do something like reloadData on tableview
        print("finnish fetching data")
        DispatchQueue.main.async {
            self.tableView.reloadData()
            
            self.tableHeaderView.setCardContent(
                greenTitle: self.viewModel.imbalHasilData[0].name ?? "",
                greenAvatar: self.viewModel.imbalHasilData[0].details?.imAvatar ?? "",
                purpleTitle: self.viewModel.imbalHasilData[1].name ?? "",
                purpleAvatar: self.viewModel.imbalHasilData[1].details?.imAvatar ?? "",
                blueTitle: self.viewModel.imbalHasilData[2].name ?? "",
                blueAvatar: self.viewModel.imbalHasilData[2].details?.imAvatar ?? "")
            //MARK: SHIT
            self.viewModel.imbalHasilData.count == 2 ? self.tableHeaderView.removeBlueViews() : print("not == 2")
        }
    }
    
    func errorOnFetchData(error:Error) {
        /// do error handler
        print(error.localizedDescription)
    }
}

//MARK: Tableview
extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.imbalHasilData.isEmpty ? 0 : 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.imbalHasilData.isEmpty ? 0 : 10
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return investmentType(rawValue: section)?.getStringTitle() ?? "default"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 7{
            let cell = tableView.dequeueReusableCell(withIdentifier: detailCellIdentifier, for: indexPath) as! DetailTableViewCell
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = UIColor.surfaceDark
            if viewModel.imbalHasilData.count == 3 {
                cell.initializeBlueViews()
            }
            return cell
        }
        if indexPath.section == 8 {
            let cell = tableView.dequeueReusableCell(withIdentifier: buyNowCellIdentifier, for: indexPath) as! BuyButtonTableViewCell
            if viewModel.imbalHasilData.count == 3 {
                cell.initializeBlueViews()
            }
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = UIColor.surfaceDark
            return cell
        }
        //TODO: Add end cell
        if indexPath.section == 9 {
            let cell = tableView.dequeueReusableCell(withIdentifier: defaultCell, for: indexPath)
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = UIColor.surfaceDark
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: secondaryCellIdentifier, for: indexPath) as! SecondaryTableViewCell
        cell.selectionStyle = .none
        cell.contentView.backgroundColor = UIColor.surfaceDark
        if viewModel.imbalHasilData.count != 0 {
            cell.setContent(
                green: viewModel.getTitleData(
                    data: viewModel.imbalHasilData[0],
                    idx: indexPath.section) ?? " ",
                purple: viewModel.getTitleData(
                    data: viewModel.imbalHasilData[1],
                    idx: indexPath.section) ?? " ",
                blue:  viewModel.getTitleData(
                    data: viewModel.imbalHasilData[2],
                    idx: indexPath.section) ?? " "
            )
            if viewModel.imbalHasilData.count == 3 {
                cell.initializeBlueViews()
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 7 || indexPath.section == 8 {
            return 25
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 7 {
            return 13
        }
        if section == 8 {
            return 13
        }
        if section == 9 {
            return 0
        }
        return UITableView.automaticDimension
    }
    
    
}

extension ViewController:imbalHasilSelectorDelegate {
    func didChangeSelectorIndex(idx: Int) {
        print("segment change to idx : \(idx)")
    }
    
}

