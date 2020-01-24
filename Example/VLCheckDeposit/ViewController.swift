//
//  ViewController.swift
//  VLCheckDeposit
//
//  Created by ashish.mishra@eastwestbank.com on 01/21/2020.
//  Copyright (c) 2020 ashish.mishra@eastwestbank.com. All rights reserved.
//

import UIKit
import VLCheckDeposit
import VLCommonClasses

public enum Storyboard: String {
    case depositCheck
    /// returns storyboard name.
    public var name: String {
        switch self {
        case .depositCheck:
            return "DepositCheck"

        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func viewWillAppear(_ animated: Bool) {
        let viewController = VLSnapCheckViewController.load(storyboardName: Storyboard.depositCheck.name)
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
