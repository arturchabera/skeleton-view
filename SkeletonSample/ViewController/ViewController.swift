//
//  ViewController.swift
//  SkeletonSample
//
//  Created by Artur Chabera on 25/05/2019.
//  Copyright © 2019 Artur Chabera. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SkeletonDisplayable {

    @IBOutlet weak var tableView: UITableView!
    private var cellReuseIdentifier: String! {
        return "CellIdentifier"
    }

    var dataSource: [CellData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(
            UINib(nibName: "Cell", bundle: nil),
            forCellReuseIdentifier: cellReuseIdentifier
        )
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 120.0
        tableView.rowHeight = 120.0

        prepareDataSource()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showSkeleton()
    }

    private func prepareDataSource() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {

            self.dataSource = [
                CellData(title: "Title 0", subtitle: "Subtitle 0"),
                CellData(title: "Title 1", subtitle: "Subtitle 1"),
                CellData(title: "Title 2", subtitle: "Subtitle 2"),
                CellData(title: "Title 3", subtitle: "Subtitle 3"),
                CellData(title: "Title 4", subtitle: "Subtitle 4"),
                CellData(title: "Title 5", subtitle: "Subtitle 5"),
                CellData(title: "Title 6", subtitle: "Subtitle 6"),
                CellData(title: "Title 7", subtitle: "Subtitle 7")
            ]

            self.tableView.reloadData()
            self.hideSkeleton()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! Cell
        if let data = dataSource?[indexPath.row] {
            cell.cellData = data
        }
        return cell
    }
}
