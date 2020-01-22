//
//  CheckDepositSnapCheckViewController.swift
//  velo-ios
//
//  Created by Ashish Mishra on 1/20/20.
//  Copyright © 2020 East West Bank. All rights reserved.
//

import UIKit
import VLComponents
import VLResources
import VLCommonClasses

public class VLSnapCheckViewController: VLBaseViewController {
    
    @IBOutlet weak var depositToDropDownView: VLDropdownView!
    @IBOutlet weak var amountField: VLFormTextField!

    override public func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    func configureUI() {
        // set navigation controller theme
        setNavigationBar(title: "Snap Check" , leftBarImageName: VLResourcesImageConstants.back, rightBarImageName: "", style: .dark)
        self.setUpDepositToView()
        self.setUpAmountField()
    }
    
    func setUpDepositToView() {
        let depositLabelsView = VLDepositLabelsView.fromNib() as VLDepositLabelsView
        depositLabelsView.depositToLabel.text = "Deposit to"
        depositLabelsView.depositToLabel.textColor = UIColor.blue

        depositLabelsView.accountNameLabel.text = "Velo Checking Account"
        depositLabelsView.accountNameLabel.textColor = UIColor.blue

        depositLabelsView.remainingBalanceLabel.text = "Remaining bal is 1500$"
        depositLabelsView.remainingBalanceLabel.textColor = UIColor.blue

        
        self.depositToDropDownView.containerView.addSubview(depositLabelsView)

    }
    
    func setUpAmountField() {
        
        let leftLabel = UILabel()
        leftLabel.text = "Amount"
        leftLabel.textColor = UIColor.blue
        
        let rightLabel = UILabel()
        rightLabel.text = "USD"
        rightLabel.textColor = UIColor.blue

        
        self.amountField.textField.leftView = leftLabel
        self.amountField.textField.rightView = rightLabel
        
    }
    
}



extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }

}
