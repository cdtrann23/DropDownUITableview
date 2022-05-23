//
//  CardCell.swift
//  TableView
//
//  Created by Duy  Tran on 24/05/2022.
//

import UIKit

class CardCell: UITableViewCell {
    
    var cellData: CellData! {
        didSet {
//            textLabel?.text = cellData.title
//            imageView?.image  = cellData.img
            img.image = cellData.img
            titleLabel.text = cellData.title.uppercased()
        }
    }
    
    fileprivate var img: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 8
        iv.layer.masksToBounds = true
        return iv
    }()
    
    fileprivate var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    fileprivate var infoText: UITextView = {
        let infoText = UITextView()
        infoText.translatesAutoresizingMaskIntoConstraints = false
        infoText.font = UIFont.systemFont(ofSize: 12, weight: .light)
        infoText.isEditable = false
        infoText.textColor = .black
        infoText.text = "In this video, we create every subview for our custom UITableView cell and lay them out with NSLayoutConstraint for Programmatic Auto Layout"
        return infoText
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        backgroundColor = .clear
        setupConstraints()
    }
    
    func setupConstraints() {
        contentView.addSubview(img)
        contentView.addSubview(titleLabel)
        contentView.addSubview(infoText)
        
        img.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        img.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        img.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        
        infoText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        infoText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        infoText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        infoText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }
    
    
    override func layoutSubviews() {
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30))
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
