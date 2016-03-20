//  Created by Johann Garces on 3/16/16.
//  Copyright © 2016 johannmg. All rights reserved.

import UIKit


class ViewController: UIViewController {
    
    let standardNodeViewSize = CGSize(width: 200, height: 100)
    let backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1.00)

    @IBOutlet weak var actionStatusLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //setup color
        view.backgroundColor = backgroundColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addNodeButton(sender: UIButton) {
        
        createNewImageNodeAtLocation()
        
    }
    
    func createNewImageNodeAtLocation(){
        
        let newNode = NodeView(frame: CGRect(origin: CGPoint(x: 60, y: 60), size: standardNodeViewSize))
        view.addSubview(newNode)
        newNode.delegate = self
    }
}



extension ViewController: NodeButtonActionDelegate{
    
    func nodeButtonWasClickedWithType(type: InputOutType, fromNodeView nodeView: NodeView) {
        print("Node button clicked with type \(type) fromView: \(nodeView)")
    }
    
}