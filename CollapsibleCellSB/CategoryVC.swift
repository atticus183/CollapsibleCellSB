//
//  ViewController.swift
//  CollapsibleCellSB
//
//  Created by Josh R on 5/13/19.
//  Copyright © 2019 Josh R. All rights reserved.
//

import UIKit

class CategoryVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //Removes the empty cells from the tableview
        tableView.tableFooterView = UIView()
    }


}


extension CategoryVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let subcategories = categories[section].subcategories.count
        
        if categories[section].isParentCellExpanded == true {
            return subcategories + 1
        } else {
            return 1
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoryCell else { return UITableViewCell() }
        
        let parentCategory = categories[indexPath.section]
        
        return cell.configure(parentCategory, at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("IndexPath.row is \(indexPath.row)")
        print("Section is \(indexPath.section)")
        
        switch indexPath.row {
        case 0:
            categories[indexPath.section].isParentCellExpanded.toggle()
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .automatic) //animation
            
            tableView.deselectRow(at: indexPath, animated: true)
        default:
            print("Subcategory cell")
        }
    }
    
    
}
