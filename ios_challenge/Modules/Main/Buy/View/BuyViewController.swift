//
//  BuyViewController.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05/05/2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import UIKit
import RealmSwift

class BuyViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var output: BuyViewOutput!
    
    let realm = try! Realm()
    lazy var products: Results<Products> = {
        realm.objects(Products.self)
    }()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}

extension BuyViewController: BuyViewInput {
    func setupInitialState() {
        registerCell()
    }
}

extension BuyViewController {
    fileprivate func registerCell() {
        tableView.register(UINib(nibName: "CustomCell", bundle: nil) , forCellReuseIdentifier: "customCell")
    }
}

extension BuyViewController: UITableViewDelegate {
    // Remove margin in table view
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.000001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        output.showProductDetail(forProduct: products[indexPath.row])
    }
}

extension BuyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        
        let item = products[indexPath.row]
        
        cell.productNameLabel.text = item.name
        cell.countLabel.text = String(item.count)
        
        return cell
    }
}
