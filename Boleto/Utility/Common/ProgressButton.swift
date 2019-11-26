//
//  ProgressButton.swift
//  Tikiti
//
//  Created by Rose Maina on 28/10/2019.
//  Copyright © 2019 rose maina. All rights reserved.
//

import UIKit

@IBDesignable
class ProgressButton: UIButton {
    
    @IBInspectable open var radius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = radius
            layer.masksToBounds = radius > 0
        }
    }
    
    @IBInspectable open var bgColor: UIColor? {
        didSet {
            layer.backgroundColor = bgColor?.cgColor
        }
    }
    
    @IBInspectable open var progressColor: UIColor? {
        didSet {
            progressLayer.fillColor = UIColor.clear.cgColor
            progressLayer.strokeColor = progressColor?.cgColor
            
            if let titleLabel = titleLabel {
                self.bringSubviewToFront(titleLabel)
            }
        }
    }
    
    @IBInspectable open var title: String? {
        didSet {
            setTitle(title, for: .normal)
            
            guard title != nil else { return }
            
            guard titleColor == nil else { return }
            
            titleColor = .white
        }
    }
    
    @IBInspectable open var titleColor: UIColor? {
        didSet {
            setTitleColor(titleColor, for: .normal)
        }
    }
    
    private let progressLayer = CAShapeLayer()
    var currentProgress: Double = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    init(title: String?, progress: Double) {
        super.init(frame: .zero)
        configure(with: title, progress: progress)
        setup()
    }
    
    func setProgress(progress: Double) {
        let stroke = CABasicAnimation(keyPath: "strokeEnd")
        stroke.fromValue = CGFloat(currentProgress)
        stroke.toValue = CGFloat(progress)
        stroke.duration = 0.3
        stroke.fillMode = CAMediaTimingFillMode.both
        stroke.isRemovedOnCompletion = false
        stroke.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.progressLayer.add(stroke, forKey: nil)
        self.currentProgress = progress
    }
    
    open func setup() {
        configureProgressLayer()
        setProgress(progress: 0.0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutProgressLayer()
    }
    
}

extension ProgressButton {
    fileprivate func configureProgressLayer() {
        progressLayer.zPosition = 0
        progressLayer.masksToBounds = true
        
        let buttonPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        progressLayer.path = buttonPath.cgPath
        
        progressLayer.lineWidth = frame.width
        
        layer.addSublayer(progressLayer)
    }
    
    fileprivate func configure(with title: String?, progress: Double) {
        self.title = title
        self.currentProgress = progress
    }
    
    fileprivate func layoutProgressLayer() {
        progressLayer.frame = bounds
        progressLayer.cornerRadius = layer.cornerRadius
    }
}

