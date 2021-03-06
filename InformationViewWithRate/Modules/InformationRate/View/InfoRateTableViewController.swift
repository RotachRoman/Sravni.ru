//
//  InformationRateTableViewController.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 09.12.2021.
//

import UIKit

final class InfoRateTableViewController: ViewController {
    var presenter: InfoRatePresenterType!
    
    var additionallyCells: [AnyClass] = []
    var additionallyIndex: Int
    
    let cells: [CellConfiguratorProtocol] = []
    
    //    MARK: - UI elements
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CellViewType.self, forCellReuseIdentifier: String(describing: CellViewType.self))
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
       
        
//        tableView.backgroundColor = UIColor(red: 0.722, green: 0.914, blue: 1, alpha: 0.25)
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        return tableView
    }()
    
    lazy var leftBarButton: UIBarButtonItem = {
        let button = UIButton()
        button.setImage(UIImage(named: "Arrow_left"), for: .normal)
        let barButton = UIBarButtonItem(customView: button)
        return barButton
    }()
    
    //MARK: - init -
    init(presenter: InfoRatePresenterType){
        self.presenter = presenter
        self.additionallyIndex = 0
        super.init(nibName: nil, bundle: nil)
        presenter.onInformationRatePresenter(on: self)
        additionallyCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        registerCells()
    }
    
    //MARK: - Setup View -
    override func addSubviews() {
        super.addSubviews()
        self.view.addSubview(tableView)
        
        var frame = self.tableView.bounds
        frame.origin.y = -frame.size.height
        let grayView = UIView(frame: frame)
        grayView.backgroundColor = .red
        self.tableView.addSubview(grayView)
    }
    
    override func addConstraints() {
        super.addConstraints()
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupNavigationBar(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    private func registerCells() {
        [
            HeaderInfoRateCell.self,
            StaticTextInfoRateCell.self,
            BulletInfoRateCell.self,
            TariffCellInfoRateCell.self,
            HeaderSlctButtonInfoRateCell.self,
            ButtonRateCell.self,
            RateInfoRateCell.self,
            NoteInfoRateCell.self,
            BackButtonInfoRateCell.self
        ].forEach { tableView.registerCell($0) }
    }
    
    private func additionallyCell(){
        additionallyCells.append(BackButtonInfoRateCell.self)
    }
}

//MARK: Extension
extension InfoRateTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCountView() + additionallyCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let modelView = presenter.getModelView(for: indexPath.row){
            
        switch modelView {
        case is HeaderViewData :
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderInfoRateCell.self)) as! HeaderInfoRateCell
            cell.updateWithViewData(modelView as! HeaderViewData)
            return cell
            
        case is StaticTextViewData:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: StaticTextInfoRateCell.self)) as! StaticTextInfoRateCell
            cell.updateWithViewData(modelView as! StaticTextViewData)
            return cell
            
        case is BulletViewData:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BulletInfoRateCell.self)) as! BulletInfoRateCell
            cell.updateWithViewData(modelView as! BulletViewData)
            return cell
        
        case is TariffsViewData:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TariffCellInfoRateCell.self)) as! TariffCellInfoRateCell
            cell.updateWithViewData(modelView as! TariffsViewData)
            return cell
            
        case is ButtonHeaderViewData:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderSlctButtonInfoRateCell.self)) as! HeaderSlctButtonInfoRateCell
            cell.updateWithViewData(modelView as! ButtonHeaderViewData)
            return cell
            
        case is ButtonChangeTariffViewData:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ButtonRateCell.self)) as! ButtonRateCell
            cell.updateWithViewData(modelView as! ButtonChangeTariffViewData)
            return cell
        case is RateInfoViewData:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RateInfoRateCell.self)) as! RateInfoRateCell
            cell.updateWithViewData(modelView as! RateInfoViewData)
            return cell
        case is NoteViewData:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NoteInfoRateCell.self)) as! NoteInfoRateCell
            cell.updateWithViewData(modelView as! NoteViewData)
            return cell
        default:
            return UITableViewCell()
        }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: additionallyCells[additionallyIndex].self)) as! CellViewType
            return cell
        }
    }
}

//?????????? ???? ????????????????????, ???????????????? ????????????
extension InfoRateTableViewController: InfoRateViewControllerType {
    func onInformationRateFetched() {
//        let index = 0
//        while(index < presenter.getCountView() + additionallyCells.count){
//            let model = presenter.getModelView(for: index)
////            cells.append<HeaderInfoRateCell>(CellConfigurator(viewData: model))
//        }
        tableView.reloadData()
    }
}



