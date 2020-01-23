//
//  VLRoundedImageView.swift
//  Pods
//
//  Created by Ashish Mishra on 1/22/20.
//

import UIKit


@IBDesignable class VLRoundedImageView: UIView {
    
//    @IBInspectable
//    var cornerRadius: CGFloat = 5 {
//        didSet {
//            self.layer.cornerRadius = cornerRadius
//        }
//    }
//    
//    @IBInspectable
//    var borderWidth: CGFloat = 1 {
//        didSet {
//            self.layer.borderWidth = borderWidth
//        }
//    }
//
//    @IBInspectable
//    var borderColor: CGColor = UIColor.lightGray.cgColor {
//        didSet {
//            self.layer.borderColor = borderColor
//        }
//    }
    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("VLRoundedImageView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}


