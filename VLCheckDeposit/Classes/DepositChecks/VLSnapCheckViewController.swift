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
    
    @IBOutlet weak var remainingBalanceLabel: UILabel!
    @IBOutlet weak var amountErrorLabel: UILabel!
    @IBOutlet weak var amountSeperatorView: UIView!
    
    @IBOutlet weak var frontCameraView: VLRoundedImageView!
    @IBOutlet weak var backCameraView: VLRoundedImageView!
    
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
        setNavigationBar(title: "Snap Check", leftBarImageName: VLResourcesImageConstants.dark_black, rightBarImageName: nil, style: .light)
        applyGradient = false
        self.backgroundGradientColor = nil
        self.setUpDepositToView()
        self.configureAmountView()
        self.setUPCameraViews()
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
        
        //TODO: Localized
        amountTextField.title = "Enter deposit Amount"
        amountTextField.isTopTitleHidden = true
        amountTextField.set(style: .formFieldAmountOnLight)
        amountTextField.delegate = self
        amountLabel.text = "Amount"
        amountTextField.textField.keyboardType = .decimalPad
        amountTextField.setRightText("USD", style: .secondaryTitleOnLight, width: 35)
        
        self.remainingBalanceLabel.text = "Remaining mobile deposit limit: $1,000.00"
        self.remainingBalanceLabel.textColor = .gray
        
        self.amountErrorLabel.isHidden = true
        self.amountErrorLabel.text = "Deposit amount must be lower than remaining deposit limit"


//        amountTextField.textField.addDoneButtonOnKeyboard(title: "vl.common.done.title.text".localized(), font: VLThemeManager.Label.headerDescriptionOnDark.textFont!, titleColor: .white, barStyle: .black)
    }
    
    private func setUPCameraViews() {
        self.frontCameraView.iconDescriptionLabel.text = "Front"
        self.frontCameraView.clickAction = {
            print("Do Something")
        }
        
        self.backCameraView.iconDescriptionLabel.text = "Back"

    }
    
    public override func setupLocalization() {
        continueBUtton.setTitle("Continue >", for: .normal)
        limitsButton.setTitle("Mobile deposit limits and cutoff times apply >", for: .normal)

    }
    
    override public func setupTheme() {
        limitsButton.set(style: .linkOnLight)
        continueBUtton.set(style: .primaryOnLight)
    }
    
}

extension VLSnapCheckViewController: VLFormFieldDelegate {
    
    public func formFieldDidBeginEditing(_ view: VLBaseFormField) {
        amountTextField.setLeftText("$", style: .sectionHeaderOnLight, width: 15)
    }
    
    public func formField(_ view: VLBaseFormField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = amountTextField.text
        let replacementText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        if replacementText == "100"{
            self.showErrorMessage(isValidAmount: true)
        }else {
            self.showErrorMessage(isValidAmount: false)
        }
        
        return true
    }
    
    func showErrorMessage(isValidAmount: Bool) {
        if isValidAmount {
            //TODO: Color, LOcalizaed
            self.amountErrorLabel.isHidden = true
            self.amountSeperatorView.backgroundColor = UIColor.gray
            self.frontCameraView.setState(state: .highlighted)

        }else {
            self.amountErrorLabel.isHidden = false
            self.amountErrorLabel.textColor = UIColor.red
            self.amountSeperatorView.backgroundColor = UIColor.red
            
            self.frontCameraView.setState(state: .normal)
        }
    }
    
}



extension UIView {
    public class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
