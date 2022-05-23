//
//  HomeViewController.swift
//  TableView
//
//  Created by Duy  Tran on 24/05/2022.
//

import UIKit

class HomeViewController: UITableViewController {

    let CELL_ID = "CELL_ID"
    
    var sections: [SectionData] = [
        SectionData(open: true,
                    data: [
                        CellData(title: "Hello", img: UIImage(named: "1")!),
                        CellData(title: "Hi", img: UIImage(named: "3")!),
                        CellData(title: "Hola", img: UIImage(named: "4")!)
        ]),
        SectionData(open: true,
                    data: [
                        CellData(title: "Run", img: UIImage(named: "2")!),
                        
        ]),
        SectionData(open: false,
                    data: [
                        CellData(title: "Learn", img: UIImage(named: "1")!),
                        CellData(title: "Study", img: UIImage(named: "4")!)
        ])


    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Home"
        view.backgroundColor = .white
        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(CardCell.self, forCellReuseIdentifier: CELL_ID)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
    }
}

extension HomeViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as! CardCell
        let section = sections[indexPath.section]
        let cellData = section.data[indexPath.row]
        cell.cellData = cellData
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !sections[section].open {
            return 0
        }
        return sections[section].data.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton()
        button.tag = section
        button.setTitle("Close", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(openSection), for: .touchUpInside)
        return button
    }
    
    @objc func openSection(button: UIButton) {

        let section = button.tag

        var indexPaths = [IndexPath]()
        for row in sections[section].data.indices {
            let indexPathToDelete = IndexPath(row: row, section: section)
            indexPaths.append(indexPathToDelete)
        }
        
                let isOpen = sections[section].open
        sections[section].open = !isOpen
        button.setTitle(isOpen ? "Open" : "Close", for: .normal)
        
        if isOpen {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
        
            
    }
}
