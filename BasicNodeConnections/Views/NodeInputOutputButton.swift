//
//  NodeInputOutputButton.swift
//  BasicNodeConnections
//
//  Created by Johann Garces on 3/17/16.
//  Copyright © 2016 johannmg. All rights reserved.
//

import UIKit

enum InputOutType {
    case MaskInput
    case ImageInput
    case ImageOutput
}


class NodeInputOutputButton: UIButton {
    
    var inOutButtonType: InputOutType?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        let nibString = "NodeInputOutputButton"
//        NSBundle.mainBundle().loadNibNamed(nibString, owner: self, options: nil)[0]
//        self.addSubview()
        
        
        
        /*
        
        NSString * nibName = @"MyCustomView";
        [[[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil] firstObject];
        
        [self addSubview:self.labelContinentName];
        */
        
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
