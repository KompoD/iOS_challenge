//
//  BuyDetailViewController.swift
//  ios_challenge
//
//  Created by Nikita Merkel on 05/05/2018.
//  Copyright © 2018 Nikita Merkel. All rights reserved.
//

import UIKit
import RealmSwift
import RxSwift
import RxCocoa
import SVProgressHUD

class BuyDetailViewController: UIViewController {
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countField: UITextField!
    @IBOutlet weak var buyButton: UIButton!
    
    var output: BuyDetailViewOutput!
    var currentItem: Products!
    let realm = try! Realm()
    
    let disposeBag = DisposeBag()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewIsReady()
    }
    
    @IBAction func buyButtonTapped(_ sender: UIButton) {
        let productsRef = ThreadSafeReference(to: currentItem)
        let countField = Int(self.countField.text!)!
        
        output.writeToRealm(count: countField, productsRef: productsRef)
    }
}

extension BuyDetailViewController: BuyDetailViewInput {
    func setupInitialState() {
        setupFields()
        setupModel()
    }
    
    func updateUI() {
        SVProgressHUD.showSuccess(withStatus: "Покупка успешно совершена!")
        self.navigationController?.popViewController(animated: true)
    }
}

extension BuyDetailViewController {
    fileprivate func setupFields() {
        self.title = currentItem.name
        productNameLabel.text = currentItem.name
        countLabel.text = String(currentItem.count)
    }
    
    fileprivate func setupModel() {
        let viewModel = BuyDetailViewModel(
            input: (
                currentCount: Observable.just(currentItem.count),
                productCount: countField.rx.text.orEmpty.asObservable()
            )
        )
        
        viewModel.validatedCount
            .subscribe(
                onNext: { valid in
                    self.buyButton.isEnabled = valid
                    self.buyButton.alpha = valid ? 1.0 : 0.3
                }
                )
                .disposed(by: disposeBag)
    }
}
