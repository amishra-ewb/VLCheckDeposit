//
//  CheckDepositSnapCheckViewController.swift
//  velo-ios
//
//  Created by Ashish Mishra on 1/20/20.
//  Copyright © 2020 East West Bank. All rights reserved.
//

import UIKit
import VLComponents
import VLUtilities
import VLAnalytics
import VLResources
import VLCommonClasses
import VLThemes

public class VLSnapCheckViewController: VLBaseViewController {
    
    // deposit outltes
    @IBOutlet var depositToLabel: UILabel!
    @IBOutlet weak var depositDropDown: VLDropdownView!
    // amount outlets
    @IBOutlet  var amountView: UIView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var amountTextField: VLFormTextField!
    @IBOutlet weak var amountStackView: UIStackView!

    // continue Button
    @IBOutlet weak var continueBUtton: UIButton!
    @IBOutlet weak var limitsButton: UIButton!
    
    var snapCheckViewModel: VLSnapCheckViewModel?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViewModel()
        self.configureUI()
    }
    
    func setUpViewModel() {
        guard let profile = VLRunTime.shared.profile else {return}
        guard let account = VLRunTime.shared.accounts?.first else {return}
        self.snapCheckViewModel = VLSnapCheckViewModel(profile: profile,
                                                       account: account)
    }
    
    func configureUI() {
        // set navigation controller theme
        setNavigationBar(title: "Snap Check", leftBarImageName: "back_arrow", rightBarImageName: nil, style: .light)
        applyGradient = false
//        self.backgroundGradientColor = nil
        self.setUpDepositToView()
        self.configureAmountView()
        self.setUpContinueButton()
        self.setUpLimitsButton()
    }
    
    func setUpDepositToView() {
        let depositLabelsView = VLDepositLabelsView.fromNib() as VLDepositLabelsView

        depositLabelsView.accountNameLabel.text = "Velo Checking Account"
        depositLabelsView.accountNameLabel.textColor = UIColor.lightGray

        depositLabelsView.remainingBalanceLabel.text = "Remaining bal is 1500$"
        depositLabelsView.remainingBalanceLabel.textColor = UIColor.lightGray

        
        self.depositDropDown.selectedView = depositLabelsView
        self.depositDropDown.isEnabled = false

    }
    
    // Configure FromAmountView
    private func configureAmountView() {
        // set empty text to amount textfield
        amountTextField.text = ""
        amountTextField.placeholder = "Enter Deposit Amount"
//        amountTextField.title = "transfermoney.amount.placeholder.title".localized()
        amountTextField.isTopTitleHidden = true
        amountTextField.set(style: .formFieldAmountOnLight)
        amountTextField.delegate = self
        amountTextField.setLeftText("$", style: .sectionHeaderOnLight, width: 15)
        amountLabel.text = "Amount"
        amountTextField.textField.keyboardType = .decimalPad
        // done button on keyboard
//        amountTextField.textField.addDoneButtonOnKeyboard(title: "vl.common.done.title.text".localized(), font: VLThemeManager.Label.headerDescriptionOnDark.textFont!, titleColor: .white, barStyle: .black)
    }
    
    private func setUpContinueButton() {
        continueBUtton.setTitle("Continue", for: .normal)
        continueBUtton.set(style: .primaryOnLight)
    }
    
    private func setUpLimitsButton() {
        limitsButton.setTitle("Mobile deposit limits and cutoff times apply", for: .normal)
        limitsButton.set(style: .linkOnLight)
    }
    
    
}

extension VLSnapCheckViewController: VLFormFieldDelegate {
    
}



extension UIView {
    public class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }

}
