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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func viewWillAppear(_ animated: Bool) {
        let viewController = VLSnapCheckViewController.load(from: Storyboard.depositCheck)
        viewController.view.backgroundColor = UIColor.red
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
