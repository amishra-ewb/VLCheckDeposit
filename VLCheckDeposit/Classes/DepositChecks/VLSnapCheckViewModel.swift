//
//  VLSnapCheckViewModel.swift
//  VLCheckDeposit
//
//  Created by Ashish Mishra on 1/23/20.
//

import Foundation
import VLAPI

typealias DepositLimitCompletionHandler = (Double?, Error?) -> Void

class VLSnapCheckViewModel {
    
    let customerNumber: String?
    let accountNumber: String?
    let routingNumber: String?
    let accountId: String?
    let availableBalance: Double?
    
    var depositAmount: Double?
    var checkFrontImage: String?
    var checkBackImage: String?
    
    var remainingDepositLimit: Double?


    init(profile: VLProfile, account: VLAccount) {
        self.accountNumber = account.accountNumber
        self.customerNumber = profile.profile?.cisNumber ?? ""
        self.routingNumber = ""
        self.accountId = account.fiservAccountId
        self.availableBalance = NumberFormatter().number(from: account.availableBalance!)?.doubleValue
    }
    
}


extension VLSnapCheckViewModel {
    
    func fetchDepositLimit(completion: @escaping DepositLimitCompletionHandler) {
        
    }
    
    func depositCheck() {
        
    }
    
}
