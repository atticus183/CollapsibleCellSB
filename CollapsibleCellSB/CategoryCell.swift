//
//  CategoryCell.swift
//  CollapsibleCellSB
//
//  Created by Josh R on 5/13/19.
//  Copyright © 2019 Josh R. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var iconBackground: UIView!
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var isExpandedIndicatorImg: UIImageView!
    
    @IBOutlet weak var indentCellOutlet: NSLayoutConstraint!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconBackground.layer.cornerRadius = iconBackground.frame.height / 2
        iconImg.image = iconImg.image?.withRenderingMode(.alwaysTemplate)
        iconImg.contentMode = .scaleAspectFit
        iconImg.tintColor = UIColor.white
        isExpandedIndicatorImg.tintColor = .darkGray
        selectionStyle = .none
    }

    
    func configure(_ parentCategory: ParentCategory, at indexPath: IndexPath) -> CategoryCell {
        let dataIndex = indexPath.row - 1
        
        //configure parent cell that contains subcagegories
        if indexPath.row == 0 && parentCategory.subcategories.count > 0 {
            iconImg.image = UIImage(named: parentCategory.iconImg.rawValue)
            iconBackground.backgroundColor = hexStringToUIColor(parentCategory.iconColor.rawValue)
            categoryLbl.text = parentCategory.name
            indentCellOutlet.constant = 15.0
            isExpandedIndicatorImg.image = UIImage(named: "expandArrow")
            
            //Rotate image
            if parentCategory.isParentCellExpanded {
                isExpandedIndicatorImg.transform = CGAffineTransform(rotationAngle: convertRadiansToDegrees(90))
            } else {
                isExpandedIndicatorImg.transform = .identity
            }
            
            return self
            
            //Configure Parent cell that contains 0 subcategories
        } else if indexPath.row == 0 && parentCategory.subcategories.count == 0 {
            iconImg.image = UIImage(named: parentCategory.iconImg.rawValue)
            iconBackground.backgroundColor = hexStringToUIColor(parentCategory.iconColor.rawValue)
            categoryLbl.text = parentCategory.name
            isExpandedIndicatorImg.image = UIImage(named: "")
            indentCellOutlet.constant = 15.0
            
            return self
            
        } else if indexPath.row >= 1 && parentCategory.subcategories.count >= 1 {
            //this clause formats the cells for the subcategories because indexPath.row >=1
            iconImg.image = UIImage(named: parentCategory.subcategories[dataIndex].iconImg.rawValue)
            iconBackground.backgroundColor = hexStringToUIColor(parentCategory.subcategories[dataIndex].iconColor.rawValue)
            categoryLbl.text = parentCategory.subcategories[dataIndex].name
            isExpandedIndicatorImg.image = UIImage(named: "")
            
            indentCellOutlet.constant = 30.0

            return self
            
        }
        
        return self
    }
}
