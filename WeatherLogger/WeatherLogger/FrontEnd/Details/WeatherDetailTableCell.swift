//
//  WeatherDetailTableCell.swift
//  WeatherLogger
//
//  Created by Swati on 27/02/21.
//  Copyright © 2021 Swati. All rights reserved.
//

import UIKit
import Foundation

final class WeatherDetailTableCell: UITableViewCell {
    private(set) weak var stackView : UIStackView?

    private(set) weak var cityLbl : UILabel?
    private(set) weak var countryLbl : UILabel?
    private(set) weak var tempLbl : UILabel?
    private(set) weak var coordinateLbl : UILabel?
    private(set) weak var dateLbl : UILabel?

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func verticalStack() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }
    
    private func horizontalStack() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }
    
    private func makeLabel(font: UIFont = UIFont.systemFont(ofSize: 20),
                           color: UIColor = .white) -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = font
        lbl.textColor = color
        return lbl
    }
    
    func setupCellView() {
        contentView.backgroundColor = .gray
        let parentstackView = verticalStack()
        
        let topstackView = horizontalStack()
        parentstackView.addArrangedSubview(topstackView)
        
        let countryLbl = makeLabel()
        topstackView.addArrangedSubview(countryLbl)
        
        let cityLbl = makeLabel()
        topstackView.addArrangedSubview(cityLbl)
        
        let footerStackView = verticalStack()
        parentstackView.addArrangedSubview(footerStackView)
        
        let tempLbl = makeLabel(font: UIFont.italicSystemFont(ofSize: 15), color: .black)
        footerStackView.addArrangedSubview(tempLbl)
        
        let coordinateLbl = makeLabel(font: UIFont.systemFont(ofSize: 15))
        footerStackView.addArrangedSubview(coordinateLbl)
        
        let dateLbl = makeLabel(font: UIFont.italicSystemFont(ofSize: 15), color: .black)
        footerStackView.addArrangedSubview(dateLbl)
        
        contentView.addSubview(parentstackView)
        NSLayoutConstraint.activate([
            parentstackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            parentstackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            parentstackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            parentstackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
        
        self.cityLbl = cityLbl
        self.countryLbl = countryLbl
        self.coordinateLbl = coordinateLbl
        self.tempLbl = tempLbl
        self.dateLbl = dateLbl
    }
}
