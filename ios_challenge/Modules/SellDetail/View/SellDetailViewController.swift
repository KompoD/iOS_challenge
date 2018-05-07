//
//  SellDetailViewController.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05/05/2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import UIKit
import RealmSwift
import RxSwift
import RxCocoa

class SellDetailViewController: UIViewController {
    @IBOutlet weak var productNameField: UITextField!
    @IBOutlet weak var countField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var output: SellDetailViewOutput!
    var currentItem: Products?
    let realm = try! Realm()
    
    let disposeBag = DisposeBag()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewIsReady()
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        if let item = currentItem {
            output.updateProduct(item, name: productNameField.text!, count: Int(countField.text!)!)
        } else {
            output.createProduct(name: productNameField.text!, count: Int(countField.text!)!)
        }
        
        navigationController?.popViewController(animated: true)
    }
}

extension SellDetailViewController: SellDetailViewInput {
    func setupInitialState() {
        setupFields()
        setupModel()
    }
}

extension SellDetailViewController {
    fileprivate func setupFields() {
        if let item = currentItem {
            self.title = item.name
            productNameField.text = item.name
            countField.text = String(item.count)
        } else {
            self.title = "Добавить новый продукт"
        }
    }
    
    fileprivate func setupModel() {
        let viewModel = SellDetailViewModel(
            input: (
                productName: productNameField.rx.text.orEmpty.asObservable(),
                productCount: countField.rx.text.orEmpty.asObservable()
            )
        )
        
        viewModel.buttonEnabled
            .subscribe(
                onNext: { valid in
                    self.saveButton.isEnabled = valid
                    self.saveButton.alpha = valid ? 1.0 : 0.3
            }
            )
            .disposed(by: disposeBag)
    }
}
