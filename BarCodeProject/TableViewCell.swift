//
//  TableViewCell.swift
//  BarCodeProject
//
//  Created by Alexey Minin on 30/11/2019.
//  Copyright © 2019 Alexey Minin. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    let imageViewCell: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let title: UILabel = {
        let title = UILabel()
        title.textColor = .black
        title.textAlignment = .left
        title.numberOfLines = 3
        title.lineBreakMode = .byTruncatingTail
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    let subTitle: UILabel = {
        let subTitle = UILabel()
        subTitle.textColor = .black
        subTitle.textAlignment = .left
        subTitle.numberOfLines = 1
        subTitle.lineBreakMode = .byTruncatingTail
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        return subTitle
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(imageViewCell)
        imageViewCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        imageViewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        imageViewCell.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageViewCell.widthAnchor.constraint(equalToConstant: 100).isActive = true
    
        contentView.addSubview(title)
        title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 120).isActive = true
        title.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8).isActive = true
        title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        
        contentView.addSubview(subTitle)
        subTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        subTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 120).isActive = true
        subTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8).isActive = true
        subTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }
}
