//
//  RangeSlider.swift
//  DemoApp
//
//  Created by Ankit Verma on 14/07/23.
//

import UIKit

@propertyWrapper
struct InBounds0And1 {
    private var number: CGFloat = 0
    init(wrappedValue number: CGFloat) {
        self.number = number
    }
    
    var wrappedValue: CGFloat {
        get { return number }
        set {
            if newValue >= 0 && newValue <= 1 {
                number = newValue
            }
        }
    }
}

@IBDesignable
class RangeSlider: UIControl {
    // MARK: - Variables
    var minimumValue: CGFloat = 0 {
        didSet {
            updateLayerFrames()
        }
    }
    
    var maximumValue: CGFloat = 1 {
        didSet {
            updateLayerFrames()
        }
    }
    
    @IBInspectable
    @InBounds0And1 var lowerValue: CGFloat = 0.2 {
        didSet {
            updateLayerFrames()
        }
    }
    
    @IBInspectable
    @InBounds0And1 var upperValue: CGFloat = 0.8 {
        didSet {
            updateLayerFrames()
        }
    }
    
    @IBInspectable
    var trackTintColor = UIColor(white: 0.9, alpha: 1) {
        didSet {
            trackLayer.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var trackHighlightTintColor = UIColor.red {
        didSet {
            trackLayer.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var thumbImage = R.image.rectThumb() {
        didSet {
            upperThumbImageView.image = thumbImage
            lowerThumbImageView.image = thumbImage
            updateLayerFrames()
        }
    }
    
    @IBInspectable
    var highlightedThumbImage = R.image.highlightedRect() {
        didSet {
            upperThumbImageView.highlightedImage = highlightedThumbImage
            lowerThumbImageView.highlightedImage = highlightedThumbImage
            updateLayerFrames()
        }
    }
    
    private var previousLocation = CGPoint()
    private let trackLayer = RangeSliderTrackLayer()
    private let lowerThumbImageView = UIImageView()
    private let upperThumbImageView = UIImageView()
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
        updateLayerFrames()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialSetup()
        updateLayerFrames()
    }
    
    // MARK: - Observers
    override var frame: CGRect {
        didSet {
            updateLayerFrames()
        }
    }
}

// MARK: - Touch Listeners
extension RangeSlider {
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        previousLocation = touch.location(in: self)
        if lowerThumbImageView.frame.contains(previousLocation) {
            lowerThumbImageView.isHighlighted = true
        } else if upperThumbImageView.frame.contains(previousLocation) {
            upperThumbImageView.isHighlighted = true
        }
        return lowerThumbImageView.isHighlighted || upperThumbImageView.isHighlighted
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        let deltaLocation = location.x - previousLocation.x
        let deltaValue = (maximumValue - minimumValue) * deltaLocation / bounds.width
        previousLocation = location
        if lowerThumbImageView.isHighlighted {
            lowerValue += deltaValue
            lowerValue = boundValue(lowerValue, toLowerValue: minimumValue,
                                    upperValue: upperValue)
        } else if upperThumbImageView.isHighlighted {
            upperValue += deltaValue
            upperValue = boundValue(upperValue, toLowerValue: lowerValue,
                                    upperValue: maximumValue)
        }
        sendActions(for: .valueChanged)
        return true
    }
    
    private func boundValue(_ value: CGFloat, toLowerValue lowerValue: CGFloat,
                            upperValue: CGFloat) -> CGFloat {
        return min(max(value, lowerValue), upperValue)
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        lowerThumbImageView.isHighlighted = false
        upperThumbImageView.isHighlighted = false
    }
}

// MARK: - Functions
extension RangeSlider {
    private func initialSetup() {
        trackLayer.rangeSlider = self
        trackLayer.contentsScale = UIScreen.main.scale
        layer.addSublayer(trackLayer)
        
        lowerThumbImageView.image = thumbImage
        addSubview(lowerThumbImageView)
        
        upperThumbImageView.image = thumbImage
        addSubview(upperThumbImageView)
    }
    
    private func updateLayerFrames() {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        trackLayer.frame = bounds.insetBy(dx: 0.0, dy: bounds.height / 3)
        trackLayer.setNeedsDisplay()
        if let thumbImage {
            lowerThumbImageView.frame = CGRect(origin: thumbOriginForValue(lowerValue),
                                               size: thumbImage.size)
            upperThumbImageView.frame = CGRect(origin: thumbOriginForValue(upperValue),
                                               size: thumbImage.size)
        }
        CATransaction.commit()
    }
    
    func positionForValue(_ value: CGFloat) -> CGFloat {
        return bounds.width * value
    }
    
    private func thumbOriginForValue(_ value: CGFloat) -> CGPoint {
        guard let thumbImage else {
            return CGPoint()
        }
        let x = positionForValue(value) - thumbImage.size.width / 2.0
        return CGPoint(x: x, y: (bounds.height - thumbImage.size.height) / 2.0)
    }
}
