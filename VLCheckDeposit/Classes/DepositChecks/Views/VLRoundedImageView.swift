//
//  VLRoundedImageView.swift
//  Pods
//
//  Created by Ashish Mishra on 1/22/20.
//

import UIKit
import VLUtilities

public enum ViewSelectedState {
    case normal
    case highlighted
}


@IBDesignable class VLRoundedImageView: UIView {
        
    @IBOutlet weak var topRectangluarImageView: UIImageView!
    @IBOutlet weak var centerIconImageView: UIImageView!
    @IBOutlet weak var iconDescriptionLabel: UILabel!
    
    @IBInspectable
    var labelInfo: String = "" {
        didSet {
            self.iconDescriptionLabel.text = labelInfo
        }
    }
    
    
    var selectedState: ViewSelectedState = .normal {
        didSet {
            self.setState(state: selectedState)
        }
    }
    
    var isCenterImageHidden: Bool = false {
        didSet {
            self.centerIconImageView.isHidden = isCenterImageHidden
        }
    }
    
    var isTopImageHidden: Bool = true {
        didSet {
            self.topRectangluarImageView.isHidden = isTopImageHidden
        }
    }
    
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
        let bundle = Bundle(for: VLRoundedImageView.self)
        bundle.loadNibNamed("VLRoundedImageView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.arrangeDefaultUI()
    }
    
    func arrangeDefaultUI() {
        self.cornerRadius = 20
        self.borderWidth = 2
        self.setState(state: .normal)
    }
    
    func setState(state: ViewSelectedState){
        if state == .highlighted {
            self.borderColor = UIColor.blue
            self.centerIconImageView.tintColor = UIColor.blue
        }else {
            self.borderColor = UIColor.lightGray
            self.centerIconImageView.tintColor = UIColor.lightGray
        }
    }
    
    func setTopRectangularImage(image: UIImage) {
        self.topRectangluarImageView.image = image
    }

}


