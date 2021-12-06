//
//  InformationRateViewController.swift
//  InformationViewWithRate
//
//  Created by Rotach Roman on 28.11.2021.
//

import UIKit

@available(iOS 10.0, *)
final class InformationRateViewController: ViewController {

    // MARK: - Public properties
    var presenter: InformationRatePresenterType!
    
    var headerView: HeaderInformationRateView!
    var statTextView: StaticTextInformationRateView!
    var bezierView: TariffCellInfRateView!
    var bulletView: BulletInformationRateView!
    var backButtonView: BackButtonInformationRateView! = BackButtonInformationRateView()
    
    private var informationRate: InformationRate?
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    lazy var contentView: UIView = {
        let scroll = UIView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()

    init(presenter: InformationRatePresenterType){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
        create()
        presenter.onInformationRatePresenter(on: self)
    }
    
    func createView() {
        guard let infRate = informationRate else {
            return
        }

        headerView = HeaderInformationRateView(header: infRate.name + infRate.header, title: infRate.headerTitle, imageName: infRate.header)
        statTextView = StaticTextInformationRateView(text: infRate.staticText)
        bulletView = BulletInformationRateView(text: infRate.bullet)
        let cheaperTariff =  TariffInformationRateView(text: infRate.minRate.info, ratio: infRate.minRate.info, sale: nil, backgroundCoolor: UIColor(red: 1, green: 1, blue: 1, alpha: 1), saleColor: UIColor(red: 0.051, green: 0.82, blue: 0.286, alpha: 1))
        let expensivelyTariff = TariffInformationRateView(text: infRate.minRate.info, ratio: infRate.minRate.info, sale: nil, backgroundCoolor: UIColor(red: 0.984, green: 0.945, blue: 0.945, alpha: 1), saleColor: UIColor(red: 0.757, green: 0.114, blue: 0.114, alpha: 1))
        
//        MARK: - имя или заголовок, путаница
        bezierView = TariffCellInfRateView(name: infRate.header, cheaperBezier: cheaperTariff, expensivelyBezier: expensivelyTariff)
    }
    
    private func create(){
        let imageName = "Car"
        let header = "БТ- "
        let name = "Базовый тариф"
        let title = "Различается в каждой страховой компании"
        
        headerView = HeaderInformationRateView(header: header + name, title: title, imageName: imageName)
        
        let staticText = "@Тариф* устанавливается страховой компанией индивидуально, именно от этого тарифа пойдет расчет цены на ОСАГО, ведь все другие коэффициенты будут едины для всех страховых. \n\nБазовый тариф может меняться от всевозможных параметров, @которые* устанавливает страховая самостоятельно:"
        statTextView = StaticTextInformationRateView(text: staticText)
        
        let array = ["Количество водителей", "Мощность или марка автомобиля"]
        bulletView = BulletInformationRateView(text: array)
        
        let cheaperTariff =  TariffInformationRateView(text: "Нижняя граница, которую могут установть страховые", ratio: "2 471 ₽", sale: nil, backgroundCoolor: UIColor(red: 1, green: 1, blue: 1, alpha: 1), saleColor: UIColor(red: 0.051, green: 0.82, blue: 0.286, alpha: 1))
        
        let expensivelyTariff = TariffInformationRateView(text: "Верхняя граница, которую могут установть страховые", ratio: "5 476 ₽", sale: nil, backgroundCoolor: UIColor(red: 0.984, green: 0.945, blue: 0.945, alpha: 1), saleColor: UIColor(red: 0.757, green: 0.114, blue: 0.114, alpha: 1))
        bezierView = TariffCellInfRateView(name: name, cheaperBezier: cheaperTariff, expensivelyBezier: expensivelyTariff)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addSubviews()
    }
    
    override func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [headerView, statTextView, bezierView, bulletView, backButtonView].forEach {
            guard let view = $0 else { return }
            
            view.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(view)
        }
    }
    
    override func addConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
//            contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 325)
        ])
        
        NSLayoutConstraint.activate([
            statTextView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
            statTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            statTextView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            bulletView.topAnchor.constraint(equalTo: statTextView.bottomAnchor, constant: 8),
            bulletView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            bulletView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            bezierView.topAnchor.constraint(equalTo: bulletView.bottomAnchor, constant: 24),
            bezierView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor ,constant: 16),
            bezierView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
//            MARK: - BAD
            backButtonView.topAnchor.constraint(equalTo: bezierView.bottomAnchor, constant: 40),
            backButtonView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            backButtonView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
            backButtonView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
}

// MARK: - Extensions -

extension InformationRateViewController: InformationRateViewControllerType {
    func onInformationRateFetched(informationRate: InformationRate) {
        self.informationRate = informationRate
    }
}
