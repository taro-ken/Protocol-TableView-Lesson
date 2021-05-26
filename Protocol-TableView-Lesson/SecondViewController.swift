//
//  SecondViewController.swift
//  Protocol-TableView-Lesson
//
//  Created by 木元健太郎 on 2021/05/26.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            tableView.delegate = self
            tableView.dataSource = self
        }
    }

    let dataStrings = ["First", "Second", "Third", "Another", "More"]
    weak var delegate: ToPassDataProtocol?
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStrings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataStrings[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(dataStrings[indexPath.row])のセルがタップされました")
        let data = dataStrings[indexPath.row] // delegateに渡す定数を用意
            delegate?.dataDidSelect(data: data) // ここで値を渡す
            self.navigationController?.popViewController(animated: true)
    }

}
