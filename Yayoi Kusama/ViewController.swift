//
//  ViewController.swift
//  Yayoi Kusama
//
//  Created by 陳佩琪 on 2023/5/26.
//

import UIKit


class TakashiFlower: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFlowerLayers()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(circleColor: UIColor, petalColor1: UIColor, petalColor2: UIColor,transform: CGAffineTransform) {
        super.init(frame: .zero)
        setupFlowerLayers(circleColor: circleColor, petalColor1: petalColor1, petalColor2: petalColor2)
        applyTransform(transform)
    }

    private func setupFlowerLayers(circleColor: UIColor = UIColor.white, petalColor1: UIColor = UIColor(red: 235/255, green: 132/255, blue: 149/255, alpha: 1), petalColor2: UIColor = UIColor(red: 235/255, green: 132/255, blue: 149/255, alpha: 1)) {
        
        let flowerCirclePath = UIBezierPath()
        flowerCirclePath.move(to: CGPoint(x: -0.4, y: -69.9))
        flowerCirclePath.addCurve(to: CGPoint(x: 60.2, y: 35.1), controlPoint1: CGPoint(x: 53.5, y: -69.9), controlPoint2: CGPoint(x: 87.1, y: -11.6))
        flowerCirclePath.addCurve(to: CGPoint(x: -61, y: 35.1), controlPoint1: CGPoint(x: 33.3, y: 81.7), controlPoint2: CGPoint(x: -34, y: 81.7))
        flowerCirclePath.addCurve(to: CGPoint(x: -16.1, y: -68.1), controlPoint1: CGPoint(x: -84.5, y: -5.6), controlPoint2: CGPoint(x: -61.9, y: -57.5))
        flowerCirclePath.addCurve(to: CGPoint(x: -0.4, y: -69.9), controlPoint1: CGPoint(x: -11, y: -69.4), controlPoint2: CGPoint(x: -5.7, y: -70))
        flowerCirclePath.close()
        
        let flowerCircleLayer = CAShapeLayer()
        flowerCircleLayer.path = flowerCirclePath.cgPath
        
        
        let petalPath = UIBezierPath()
        petalPath.move(to: CGPoint(x: 0.5, y: -0.2))
        petalPath.addLine(to: CGPoint(x: 96.1, y: 93.6))
        petalPath.addCurve(to: CGPoint(x: 36.3, y: 129.9), controlPoint1: CGPoint(x: 107.8, y: 122.2), controlPoint2: CGPoint(x: 73.6, y: 162.2))
        petalPath.addLine(to: CGPoint(x: 0.5, y: -0.2))
        petalPath.close()
        
        let rotation = CGAffineTransform(rotationAngle: .pi/180 * 60)
        
        //單數辦
        for _ in 1...5 {
            let petalPathS = petalPath.copy() as! UIBezierPath
            petalPathS.apply(rotation)
            petalPath.append(petalPathS)
        }
        
        let petalLayer1 = CAShapeLayer()
        petalLayer1.path = petalPath.cgPath
        
        //雙數辦
        let petalPath2 = petalPath.copy() as! UIBezierPath
        petalPath2.apply(CGAffineTransform(rotationAngle: .pi/180 * 30))
        
        for _ in 1...5 {
            let petalPathS = petalPath2.copy() as! UIBezierPath
            petalPathS.apply(rotation)
            petalPath2.append(petalPathS)
        }
        
        let petalLayer2 = CAShapeLayer()
        petalLayer2.path = petalPath2.cgPath
        
        
        let smilePath = UIBezierPath()
        smilePath.move(to: CGPoint(x: -51.4, y: -6.9))
        smilePath.addCurve(to: CGPoint(x: 51.4, y: -7.8), controlPoint1: CGPoint(x: -27.7, y: -25.9), controlPoint2: CGPoint(x: 43.4, y: -18.2))
        smilePath.addCurve(to: CGPoint(x: 0.1, y: 48.4), controlPoint1: CGPoint(x: 53.1, y: 28.8), controlPoint2: CGPoint(x: 21, y: 49.4))
        smilePath.addCurve(to: CGPoint(x: -51.4, y: -6.9), controlPoint1: CGPoint(x: -15, y: 47.7), controlPoint2: CGPoint(x: -45.2, y: 43.1))
        smilePath.close()
        
        let smileLayer = CAShapeLayer()
        smileLayer.path = smilePath.cgPath
        
        
        let eyePath = UIBezierPath()
        eyePath.move(to: CGPoint(x: -22.7, y: -43.9))
        eyePath.addCurve(to: CGPoint(x: -31.9, y: -38.5), controlPoint1: CGPoint(x: -27.3, y: -45.5), controlPoint2: CGPoint(x: -30.6, y: -41.8))
        eyePath.addCurve(to: CGPoint(x: -29.2, y: -26.9), controlPoint1: CGPoint(x: -34.1, y: -32.5), controlPoint2: CGPoint(x: -32.5, y: -28.4))
        eyePath.addCurve(to: CGPoint(x: -19.9, y: -34.3), controlPoint1: CGPoint(x: -23.1, y: -25.2), controlPoint2: CGPoint(x: -20.4, y: -32.4))
        eyePath.addCurve(to: CGPoint(x: -22.7, y: -43.9), controlPoint1: CGPoint(x: -19.3, y: -36.5), controlPoint2: CGPoint(x: -18.5, y: -41.7))
        eyePath.close()
        
        let eyePath2 = eyePath.copy() as! UIBezierPath
        eyePath2.apply(CGAffineTransform(scaleX: -1, y: 1))
        eyePath.append(eyePath2)
        
        let eyeLayer = CAShapeLayer()
        eyeLayer.path = eyePath.cgPath
        eyeLayer.fillColor = UIColor.black.cgColor
        
        
        let eyeHighlight1 = UIImageView(frame: CGRect(x: -29.5, y: -42, width: 5, height: 6))
        let eyeHighlight2 = UIImageView(frame: CGRect(x: -29, y: -35, width: 5, height: 6))
        let eyeHighlight3 = UIImageView(frame: CGRect(x: 24, y: -42, width: 5, height: 6))
        let eyeHighlight4 = UIImageView(frame: CGRect(x: 23.5, y: -35, width: 5, height: 6))
        
        
        let eyeHighlights = [eyeHighlight1,eyeHighlight2,eyeHighlight3,eyeHighlight4]
        for eyeHighlight in eyeHighlights {
            eyeHighlight.image = UIImage(systemName: "circle.fill")
            eyeHighlight.tintColor = UIColor.white
            eyeLayer.addSublayer(eyeHighlight.layer)
        }
        
        
        
        //colors
        flowerCircleLayer.fillColor = circleColor.cgColor
        petalLayer1.fillColor = petalColor1.cgColor
        petalLayer2.fillColor = petalColor2.cgColor
        smileLayer.fillColor = UIColor(red: 231/255, green: 59/255, blue: 91/255, alpha: 1).cgColor
        eyeLayer.fillColor = UIColor.black.cgColor
        
        //strokes
        let layers = [petalLayer1,petalLayer2,flowerCircleLayer,smileLayer,eyeLayer]

        for layer in layers {
            layer.strokeColor = UIColor.black.cgColor
            layer.lineWidth = 4
            self.layer.addSublayer(layer)
        }
        
        
    }
    
    private func applyTransform(_ transform: CGAffineTransform) {
        self.transform = transform
    }
}






class ViewController: UIViewController {
    
    
    var randomX = 0
    var randomY = 0
    let sizeArray = [20,40,60]
    var sizeIndex = 0
    var size = 0
    var generateCounts = 0
    var dotFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
    var overlapping = false
    var dotCount = 0
    var dotImages = [UIImageView()]
    var color = UIColor.white
    var backgroundColorIndex = 0
    
    //dot colors
    let blue = UIColor(red: 2/255, green: 84/255, blue: 1, alpha: 1)
    let green = UIColor(red: 2/255, green: 160/255, blue: 95/255, alpha: 1)
    let yellow = UIColor(red: 252/255, green: 228/255, blue: 63/255, alpha: 1)
    let pink = UIColor(red: 254/255, green: 43/255, blue: 182/255, alpha: 1)
    let orange = UIColor(red: 1, green: 114/255, blue: 35/255, alpha: 1)
    let red = UIColor(red: 253/255, green: 42/255, blue: 58/255, alpha: 1)
    
    let backgroundColor = [UIColor.white,UIColor.red,UIColor(red: 252/255, green: 186/255, blue: 3/255, alpha: 1),UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)]

    @IBOutlet var clickButton: UIButton!
    @IBOutlet var ballCountsLabel: UILabel!
    @IBOutlet var ballCountSlider: UISlider!
    @IBOutlet var theObliterationRoomView: UIView!
    @IBOutlet var noticeLabel: UILabel!
    @IBOutlet var noticeButton: UIButton!
    @IBOutlet var gestureView: UIView!
    @IBOutlet var takashiClickButton: UIButton!
    
    
    var flowerViews = [UIView()]

    
    let flowerCircleColor = [UIColor.white,UIColor(red: 248/255, green: 192/255, blue: 3/255, alpha: 1)]
    
    let petalWhite = UIColor.white
    let petalRed = UIColor(red: 231/255, green: 59/255, blue: 91/255, alpha: 1)
    let petalPink = UIColor(red: 235/255, green: 132/255, blue: 149/255, alpha: 1)
    let petalBlue = UIColor(red: 5/255, green: 172/255, blue: 228/255, alpha: 1)
    let petalYellow = UIColor(red: 248/255, green: 192/255, blue: 3/255, alpha: 1)
    let petalGreen = UIColor(red: 137/255, green: 181/255, blue: 37/255, alpha: 1)
    let petalPurple = UIColor(red: 171/255, green: 142/255, blue: 177/255, alpha: 1)
    
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        clickButton.setTitle("Click Me!", for: .normal)
        clickButton.setImage(UIImage(systemName: "hand.point.up.left.fill"), for: .normal)
        
        
        takashiClickButton.setTitle("Click Me!", for: .normal)
        takashiClickButton.setImage(UIImage(systemName: "hand.point.up.left.fill"), for: .normal)
        takashiClickButton.isHidden = true
        
        
        gestureView.isHidden = true
        
         
        
    }
    

    func makeFlower() {
        
        let flowerCircleIndex = Int.random(in: 0...1)
        let circleColor = flowerCircleColor[flowerCircleIndex]
        
        let flowerPetalColor = [petalWhite,petalRed,petalBlue,petalPink,petalGreen,petalPurple,petalYellow]
        var petalIndex = Int.random(in: 0..<flowerPetalColor.count)
        let petalColor1 = flowerPetalColor[petalIndex]
        
        let flowerPetalColor2 = [flowerPetalColor[petalIndex],flowerPetalColor[petalIndex],flowerPetalColor[petalIndex],petalWhite]
                
        petalIndex = Int.random(in: 0..<flowerPetalColor2.count)
        let petalColor2 = flowerPetalColor2[petalIndex]
        
        
        let randomSize = CGFloat.random(in: 0.2...0.5)
        let randomMoveX = CGFloat.random(in: -6...38) //預設範圍 -120 ~ 380
        let randomMoveY = CGFloat.random(in: -6...84) //預設範圍 -120 ~ 840
        
        let transform = CGAffineTransform(translationX: randomMoveX * 10, y: randomMoveY * 10).scaledBy(x: randomSize, y: randomSize)
        
        let flowerView = TakashiFlower(circleColor: circleColor, petalColor1:petalColor1, petalColor2: petalColor2, transform: transform)
        theObliterationRoomView.addSubview(flowerView)
        flowerViews.append(flowerView)
        
    }
    

    @IBAction func theObliterationRoom(_ sender: UIButton) {
        clickButton.setTitle("", for: .normal)
        clickButton.setImage(nil, for: .normal)
        ballCountSlider.isHidden = true
        ballCountsLabel.isHidden = true
        
        generateCounts = 0
        
        for _ in 1 ... Int(ballCountSlider.value) {
            dotCount += 1
            if dotCount < 420 {
                let imageView = UIImageView()
                imageView.image = UIImage(systemName: "circle.fill")
                theObliterationRoomView.addSubview(imageView)
                dotImages.append(imageView)
                
                generateDotFrame()
                checkOverlapping()
                
                while overlapping == true {
                    generateDotFrame()
                    overlapping = false
                    checkOverlapping()
                    
                    generateCounts += 1
                    print("Regenerating", generateCounts)
                }
                
                generateDotColor()
                
                imageView.frame = dotFrame
                imageView.tintColor = color
                
                
                print("dot count:",dotCount)
            } else {
                gestureView.isHidden = false
                clickButton.isEnabled = false
            }
        }
    }
    
    
    func generateDotColor() {
        if theObliterationRoomView.backgroundColor == backgroundColor[0] {
            let colorArray = [blue,green,yellow,pink,orange,red]
            let colorIndex = Int.random(in: 0..<colorArray.count)
            color = colorArray[colorIndex]
        } else if theObliterationRoomView.backgroundColor == backgroundColor[1] {
            color = UIColor.white
        } else if theObliterationRoomView.backgroundColor == backgroundColor[2] {
            color = UIColor.black
        }
    }
    
    func generateDotFrame() {
        randomX = Int.random(in: -121..<389)
        randomY = Int.random(in: -121..<843)
        
        sizeIndex = Int.random(in: 0..<sizeArray.count)
        size = sizeArray[sizeIndex]
        
        dotFrame = CGRect(x: randomX, y: randomY, width: size, height: size)
    }
    
    func checkOverlapping() {
        for subview in theObliterationRoomView.subviews {
            if dotFrame.intersects(subview.frame) {
                overlapping = true
                print("true")
            }
        }
    }
    
    
    
    @IBAction func takashiClickButton(_ sender: Any) {
        
        takashiClickButton.setTitle("", for: .normal)
        takashiClickButton.setImage(nil, for: .normal)
        ballCountSlider.isHidden = true
        ballCountsLabel.isHidden = true
        
        generateCounts = 0
        
        for _ in 1 ... Int(ballCountSlider.value) {
            dotCount += 1
            if dotCount < 120 {
                
                makeFlower()
                
                print("dot count:",dotCount)
            } else {
                gestureView.isHidden = false
                takashiClickButton.isEnabled = false
            }
        }
        
        
    }
    
    
    @IBAction func hideButton(_ sender: Any) {
        noticeLabel.isHidden = true
        noticeButton.isHidden = true
    }
    
    
    @IBAction func swipeToReset(_ sender: Any) {
        
        backgroundColorIndex = Int.random(in: 0...3)
        theObliterationRoomView.backgroundColor = backgroundColor[backgroundColorIndex]
        
        if theObliterationRoomView.backgroundColor != backgroundColor[3] {
            for imageview in dotImages {
                imageview.removeFromSuperview()
            }
            for views in flowerViews {
                views.removeFromSuperview()
            }
            
            theObliterationRoomView.isHidden = false
            clickButton.isHidden = false
            clickButton.isEnabled = true
            takashiClickButton.isHidden = true
            
            gestureView.isHidden = true
            ballCountSlider.isHidden = false
            ballCountsLabel.isHidden = false
            noticeLabel.isHidden = false
            noticeButton.isHidden = false
            dotCount = 0
            
            clickButton.setTitle("Click Me!", for: .normal)
            clickButton.setImage(UIImage(systemName: "hand.point.up.left.fill"), for: .normal)
            
            
            
        } else {
            //村上隆
            
            for imageview in dotImages {
                imageview.removeFromSuperview()
            }
            for views in flowerViews {
                views.removeFromSuperview()
            }
            
            takashiClickButton.setTitle("Click Me!", for: .normal)
            takashiClickButton.setImage(UIImage(systemName: "hand.point.up.left.fill"), for: .normal)
            takashiClickButton.isHidden = false
            
            theObliterationRoomView.isHidden = false
            clickButton.isHidden = true
            
            gestureView.isHidden = true
            ballCountSlider.isHidden = false
            ballCountsLabel.isHidden = false
            noticeLabel.isHidden = false
            noticeButton.isHidden = false
            dotCount = 0
            
            
        }
        
    }

    
}

