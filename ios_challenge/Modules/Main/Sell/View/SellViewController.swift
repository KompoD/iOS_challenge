//
//  SellViewController.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05/05/2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import UIKit
import RealmSwift

class SellViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var output: SellViewOutput!
    
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
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        output.showAddScreen()
    }
}

extension SellViewController: SellViewInput {
    func setupInitialState() {
      registerCell()
    }
}

extension SellViewController {
    fileprivate func registerCell() {
        tableView.register(UINib(nibName: "CustomCell", bundle: nil) , forCellReuseIdentifier: "customCell")
    }
}

extension SellViewController: UITableViewDelegate {
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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Удалить"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            output.deleteProduct(products[indexPath.row])
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension SellViewController: UITableViewDataSource {
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
