//  Created by Johann Garces on 3/16/16.
//  Copyright © 2016 johannmg. All rights reserved.

import UIKit


protocol NodeButtonActionDelegate {
    func nodeButtonWasClickedWithType(type: InputOutType, fromNodeView nodeView: NodeView)
}

class NodeView: UIView {
    
    //UI
    @IBOutlet weak var nodeNameLabel: UILabel!
    @IBOutlet weak var nodeBodyView: UIView!
    @IBOutlet weak var imageInputButton: NodeInputOutputButton!
    @IBOutlet weak var maskInputButton: NodeInputOutputButton!
    @IBOutlet weak var imageOutputButton: NodeInputOutputButton!
    
    //State
    var isActive = true
    var delegate: NodeButtonActionDelegate?
    
    //Node links
//    var inputMask: 
    var customView: UIView!
    
    var isBeingDragged = false
    var dragStartLocation: CGPoint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customView = NSBundle.mainBundle().loadNibNamed("NodeView", owner: self, options: nil).first as! UIView
        customView.frame = self.bounds
        if frame.isEmpty{
            self.bounds = customView.bounds
        }
        addSubview(customView)
        
        setInitialValues()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if self.subviews.count == 0 {
            customView = NSBundle.mainBundle().loadNibNamed("NodeView", owner: self, options: nil)[0] as! UIView
            customView.frame = self.bounds
            addSubview(customView)
        }
        
        setInitialValues()
    }
    
    
    func setInitialValues(){
//        print("NodeView Init")
//        imageInputButton.inOutButtonType = InputOutType.ImageInput
//        maskInputButton.inOutButtonType = InputOutType.MaskInput
//        imageOutputButton.inOutButtonType = InputOutType.ImageOutput
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
    
    // MARK: Dragging Touch Controllers
    
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
    
    //MARK - Node Piping Buttons
    
    @IBAction func imageInputTouched(sender: NodeInputOutputButton) {
        sendButtonPushToDelegate(sender)
    }
    
    @IBAction func maskInputTouched(sender: NodeInputOutputButton) {
        sendButtonPushToDelegate(sender)
    }

    @IBAction func imageOutputTouched(sender: NodeInputOutputButton) {
        sendButtonPushToDelegate(sender)
    }
    
    func sendButtonPushToDelegate(buttonView: NodeInputOutputButton){
        
        if delegate != nil {
            delegate!.nodeButtonWasClickedWithType(buttonView.inOutButtonType!, fromNodeView: self)
        }
        
    }
    
    
    
    
    

}
