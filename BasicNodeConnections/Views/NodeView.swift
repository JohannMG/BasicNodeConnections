//
//  NodeView.swift
//  BasicNodeConnections
//
//  Created by Johann Garces on 3/16/16.
//  Copyright © 2016 johannmg. All rights reserved.
//

import UIKit

class NodeView: UIView {

    @IBOutlet weak var nodeNameLabel: UILabel!
    @IBOutlet weak var nodeBodyView: UIView!
    
    var isBeingDragged = false
    var dragStartLocation: CGPoint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setInitialStyles()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setInitialStyles()
    }
    
    func setInitialStyles(){
        
    }
    
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        
        guard let touch = touches.first
            else{ return }
        
        dragStartLocation = touch.locationInView(self)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
        
        guard let touch = touches.first
            else { return }
        
        let newFrameposition = frame.offsetBy(dx: touch.locationInView(self).x - dragStartLocation!.x, dy: touch.locationInView(self).y - dragStartLocation!.y)
        self.frame  = newFrameposition
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let bounceSpeed = 0.5 //seconds
        let paddingForEnd:CGFloat = 10 //UI points
        
        super.touchesEnded(touches, withEvent: event)
        
        if frame.origin.x < 0 || frame.origin.y < 0 {
            UIView.animateWithDuration(bounceSpeed, animations: { () -> Void in
                self.frame.origin = CGPoint(x: paddingForEnd, y: paddingForEnd)
            })
        } else if frame.origin.x + frame.width > superview!.frame.size.width || frame.origin.y + frame.height > superview!.frame.size.height {
            UIView.animateWithDuration(bounceSpeed, animations: { () -> Void in
                self.frame.origin = CGPoint(x: self.superview!.frame.size.width - self.frame.width - paddingForEnd ,
                    y: self.superview!.frame.size.height - self.frame.size.height - paddingForEnd)
            })
        }
        
        
        
    }

}
