//
//  InformationRateTableViewController.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 09.12.2021.
//

import UIKit

@available(iOS 12.0, *)
final class InformationRateTableViewController: ViewController {
    
    var presenter: InformationRatePresenterType!
    private var cells: [CellViewType] = []
    
    //    MARK: - UI elements
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CellViewType.self, forCellReuseIdentifier: String(describing: CellViewType.self))
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        return tableView
    }()
    
    private lazy var arrowView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Arrow_left")
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - init -
    init(presenter: InformationRatePresenterType){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.onInformationRatePresenter(on: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup View -
    override func addSubviews() {
        super.addSubviews()
        [tableView, arrowView].forEach { view.addSubview($0) }
    }
    
    override func addConstraints() {
        super.addConstraints()
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            arrowView.heightAnchor.constraint(equalToConstant: 24),
            arrowView.widthAnchor.constraint(equalToConstant: 24),
            arrowView.topAnchor.constraint(equalTo: view.topAnchor, constant: 56),
            arrowView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
    }
}

//MARK: Extension
extension InformationRateTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cells[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}

//Вызов из презентора, передача данных
extension InformationRateTableViewController: InformationRateViewControllerType {
    func onInformationRateFetched(cells: [CellViewType]) {
        self.cells = cells
        tableView.reloadData()
    }
}
