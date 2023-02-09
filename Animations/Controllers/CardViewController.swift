//
//  CardViewController.swift
//  Animations
//
//  Created by Stef Castillo on 2/8/23.
//

import UIKit

class CardViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var redCard: UIView!
    @IBOutlet weak var blueCard: UIView!
    @IBOutlet weak var greenCard: UIView!
    @IBOutlet weak var yellowCard: UIView!
    
    //MARK: Properties
    let colors: [UIColor] = [#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)]
    
    
//MARK: Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()

    }
    
    //MARK: Actions
    
    @IBAction func redCardButtonTapped(_ sender: Any) {
        rotateRed()
    }
    
    @IBAction func blueCardButtonTapped(_ sender: Any) {
        flipBlue()
    }
    
    @IBAction func greenCardButtonTapped(_ sender: Any) {
        changeGreen()
    }
    @IBAction func yellowButtonClicked(_ sender: UIButton, forEvent event: UIEvent) {
        let touches = event.touches(for: sender)
        guard let touchPoint = touches?.first?.location(in: self.view) else { return}
        likeYellow(touchPoint: touchPoint)
    }
    
    
    //MARK: Helper Methods
    func setupViews() {
        redCard.layer.cornerRadius = 8.0
        blueCard.layer.cornerRadius = 8.0
        greenCard.layer.cornerRadius = 8.0
        yellowCard.layer.cornerRadius = 8.0
    }
    
    func rotateRed() {
        UIView.animate(withDuration: 0.5, delay: 0,options: .curveEaseInOut) {
            self.redCard.transform = self.redCard.transform.rotated(by: .pi/2)
        }
        
    }
    
    func flipBlue() {
        UIView.animate(withDuration: 0.5, delay: 0,options: .curveEaseInOut) {
            self.blueCard.transform = self.blueCard.transform.scaledBy(x: -1, y: 1)
        }
    }
    
    func changeGreen() {
        UIView.animate(withDuration: 0.5, delay: 0) {
            self.view.backgroundColor = self.colors.randomElement()
        }
    }
    
    func likeYellow(touchPoint: CGPoint) {
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customVerticalPath(touchPoint: touchPoint).cgPath
        animation.duration = 2
        animation.isRemovedOnCompletion = true
        animation.fillMode = .forwards
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        let imageView = UIImageView(image: UIImage(systemName: "heart.fill"))
        imageView.tintColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        imageView.frame = CGRect(x: -40, y: 0, width: 40, height: 40)
        
        imageView.layer.add(animation, forKey: nil)
        view.addSubview(imageView)
        
        UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseIn) {
            imageView.alpha = 0
        } completion: { _ in
            imageView.removeFromSuperview()
        }
    }
    
    func customVerticalPath(touchPoint: CGPoint) -> UIBezierPath {
        let path = UIBezierPath()
        
        let pathLength = 400
        let curveLength = pathLength / 4
        
        path.move(to: touchPoint)
        
        let endpoint = CGPoint(x: touchPoint.x, y: touchPoint.y - CGFloat(pathLength))
        
        let curve1 = CGPoint(x: touchPoint.x - 50, y: touchPoint.y - CGFloat(pathLength))
        let curve2 = CGPoint(x: touchPoint.x + 50, y: touchPoint.y - CGFloat(3 * curveLength))
        
        path.addCurve(to: endpoint, controlPoint1: curve1, controlPoint2: curve2)
        
        return path
    }
    
    

}//End of class
