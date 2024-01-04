//
//  Extension+UIView.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/4/24.
//

import UIKit

extension UIView {
    func addLine(fromPoint start: CGPoint, toPoint end: CGPoint, color : UIColor) {
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: start)
        linePath.addLine(to: end)
        line.path = linePath.cgPath
        line.strokeColor = color.cgColor
        line.lineWidth = 1
        line.lineJoin = CAShapeLayerLineJoin.round
        self.layer.addSublayer(line)
    }
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11.0, *) {
            self.clipsToBounds = true
            self.layer.cornerRadius = radius
            self.layer.maskedCorners.remove([.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner])
            
            if corners.contains(.topLeft) {
                self.layer.maskedCorners.insert(.layerMinXMinYCorner)
            }
            if corners.contains(.topRight) {
                self.layer.maskedCorners.insert(.layerMaxXMinYCorner)
            }
            if corners.contains(.bottomLeft) {
                self.layer.maskedCorners.insert(.layerMinXMaxYCorner)
            }
            if corners.contains(.bottomRight) {
                self.layer.maskedCorners.insert(.layerMaxXMaxYCorner)
            }
            if corners.contains(.allCorners) {
                self.layer.maskedCorners.insert(.layerMinXMinYCorner)
                self.layer.maskedCorners.insert(.layerMinXMaxYCorner)
                self.layer.maskedCorners.insert(.layerMaxXMinYCorner)
                self.layer.maskedCorners.insert(.layerMaxXMaxYCorner)
            }
            
        }
        else {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
    }
    func roundCorner(borderColor: UIColor, borderWidth: CGFloat, cornerRadius: CGFloat) {
        self.layer.cornerRadius  = cornerRadius
        self.layer.masksToBounds = true
        self.layer.borderWidth   = borderWidth
        self.layer.borderColor   = borderColor.cgColor
    }
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
      }
    
    func dropShadow(scale: Bool = true) {
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = self.frame.size.height/2
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        
    }
    
    func addColors(colors: [UIColor], withPercentage percentages: [Double]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        var colorsArray: [CGColor] = []
        var locationsArray: [NSNumber] = []
        var total = 0.0
        locationsArray.append(0.0)
        for (index, color) in colors.enumerated() {
            // append same color twice
            colorsArray.append(color.cgColor)
            colorsArray.append(color.cgColor)
            // Calculating locations w.r.t Percentage of each
            if index+1 < percentages.count{
                total += percentages[index]
                let location: NSNumber = NSNumber(value: total/100)
                locationsArray.append(location)
                locationsArray.append(location)
            }
        }
        locationsArray.append(1.0)
        gradientLayer.colors = colorsArray
        gradientLayer.locations = locationsArray
        self.backgroundColor = .clear
        self.layer.addSublayer(gradientLayer)
    }
    
    func addDashedBorder() {
        //Create a CAShapeLayer
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 1
     
        shapeLayer.lineDashPattern = [2,3]

        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 0, y: 0),
                                CGPoint(x: 0, y: self.frame.height)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
    
    func addDashedBorderHorizontal(y:CGFloat, x: CGFloat) {
        //Create a CAShapeLayer
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 0.5
        
        
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 0, y: y),
                                CGPoint(x: x, y: y)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
    
    private static let lineDashPattern: [NSNumber] = [4, 4]
    private static let lineDashWidth: CGFloat = 0.5

    func makeDashedBorderLine() {
           let path = CGMutablePath()
           let shapeLayer = CAShapeLayer()
           shapeLayer.lineWidth = UIView.lineDashWidth
           shapeLayer.strokeColor = UIColor.lightGray.cgColor
           shapeLayer.lineDashPattern = UIView.lineDashPattern
           path.addLines(between: [CGPoint(x: 0, y: 0),
                                   CGPoint(x: 1000, y: 0)])
           shapeLayer.path = path
           layer.addSublayer(shapeLayer)
       }
    
    func circle() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true
    }
    
    func rounderLeftConnerView(cornerRadius: CGFloat) {
        if #available(iOS 11.0, *) {
            self.clipsToBounds = false
            self.layer.cornerRadius = cornerRadius
            self.layer.maskedCorners = [ .layerMinXMinYCorner, .layerMinXMaxYCorner]
        } else {
            // Fallback on earlier versions
            let rectShape = CAShapeLayer()
            rectShape.bounds = self.frame
            rectShape.position = self.center
            rectShape.path = UIBezierPath(roundedRect: self.bounds,    byRoundingCorners: [.topLeft , .bottomLeft], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
            self.layer.mask = rectShape
        }
    }
    func rounderTopConnerView( cornerRadius: Double) {
        if #available(iOS 11.0, *) {
            self.clipsToBounds = true
            self.layer.cornerRadius = CGFloat(cornerRadius)
            self.layer.maskedCorners = [ .layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else {
            // Fallback on earlier versions
            let rectShape = CAShapeLayer()
            rectShape.bounds = self.frame
            rectShape.position = self.center
            rectShape.path = UIBezierPath(roundedRect: self.bounds,    byRoundingCorners: [.topLeft , .topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
            self.layer.mask = rectShape
        }
    }
    
    func addShadowAndCorner(radiusView : CGFloat = 12 ,color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1){
        self.layer.cornerRadius = radiusView
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offSet
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false
    }
    
    func dropShadowcornerRadius( cornerRadius : CGFloat ,color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1){
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false
      }
    
    func addShadow(location: VerticalLocation, color: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1), opacity: Float = 0.5, radius: CGFloat = 5.0) {
        switch location {
        case .bottom:
            addShadow(offset: CGSize(width: 0, height: 0.5), color: color, opacity: opacity, radius: radius)
        case .top:
            addShadow(offset: CGSize(width: 0, height: -0.5), color: color, opacity: opacity, radius: radius)
        }
    }
    func addShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 5.0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
    
    @IBInspectable public var cornerRadiusUIView: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable public var cornerRadiusRatio: CGFloat {
        get {
            return layer.cornerRadius / frame.width
        }
        
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
//            layer.cornerRadius = frame.width * normalizedRatio
        }
    }
    
    @IBInspectable var borderWidthUIView: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var borderColorUIView: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
    func drawDottedLine(p1: CGPoint, p2: CGPoint) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [7, 3]

        let path = CGMutablePath()
        path.addLines(between: [p1, p2])
        shapeLayer.path = path
        self.layer.addSublayer(shapeLayer)
    }
    
    var globalFrame: CGRect? {
        let rootView = UIApplication.shared.keyWindow?.rootViewController?.view
        return self.superview?.convert(self.frame, to: rootView)
    }
}

enum VerticalLocation: String {
    case bottom
    case top
}

@IBDesignable
class DashedLineView : UIView {
    @IBInspectable var perDashLength: CGFloat = 4.0
    @IBInspectable var spaceBetweenDash: CGFloat = 3.0
    @IBInspectable var dashColor: UIColor = UIColor(red: 0.917, green: 0.917, blue: 0.917, alpha: 1)


    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let  path = UIBezierPath()
        if height > width {
            let  p0 = CGPoint(x: self.bounds.midX, y: self.bounds.minY)
            path.move(to: p0)

            let  p1 = CGPoint(x: self.bounds.midX, y: self.bounds.maxY)
            path.addLine(to: p1)
            path.lineWidth = width

        } else {
            let  p0 = CGPoint(x: self.bounds.minX, y: self.bounds.midY)
            path.move(to: p0)

            let  p1 = CGPoint(x: self.bounds.maxX, y: self.bounds.midY)
            path.addLine(to: p1)
            path.lineWidth = height
        }

        let  dashes: [ CGFloat ] = [ perDashLength, spaceBetweenDash ]
        path.setLineDash(dashes, count: dashes.count, phase: 0.0)

        path.lineCapStyle = .butt
        dashColor.set()
        path.stroke()
    }

    private var width : CGFloat {
        return self.bounds.width
    }

    private var height : CGFloat {
        return self.bounds.height
    }
}

@IBDesignable
class AddDashedBorderDetailTrasaction : UIView {
    
    let borderLayer = CAShapeLayer()

//        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//            super.init
//            commonInit()
//        }
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
        func commonInit() {
            layer.cornerRadius = 10
            layer.masksToBounds = true
            borderLayer.strokeColor = UIColor(red: 0.27, green: 0.394, blue: 0.929, alpha: 0.5).cgColor
            borderLayer.lineDashPattern = [4, 3]
            borderLayer.fillColor = nil
            self.layer.addSublayer(borderLayer)
        }
        override func layoutSublayers(of layer: CALayer) {
            super.layoutSublayers(of: layer)
            borderLayer.frame = self.bounds
            borderLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 10).cgPath
        }
    
}
class UIKeyValueView: UIView {

    lazy var lblKey = UILabel()
    lazy var lblValue = UILabel()
    lazy var lineView = UIView()
    lazy var verticalStackView = UIStackView()
    lazy var horizotalStackView = UIStackView()
    lazy var btnEditView = UIView()
    lazy var btnEdit = UIButton()
    var isCellContractNo : Bool = false
    var isShowBtnEdit : Bool = false
    var isShowLineView : Bool = false
    
    var btnEditCallback : (()->Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        
    }

//    func fillData(data: ECounterKeyValueButtonLineView? = nil, keyTitle: String, value: NSMutableAttributedString , cellType : DetailItemType, isShowBtnEdit : Bool = false, isShowLineView : Bool = true, actionButton: (()->())? = nil) {
//        if isShowBtnEdit{
//            btnEdit.isHidden = false
//        }else{
//            btnEdit.isHidden = true
//        }
//        if isShowLineView{
//            self.lineView.isHidden = false
//        }else{
//            self.lineView.isHidden = true
//        }
//        self.btnEditCallback = actionButton
//        self.lblKey.text = keyTitle
//        self.lblValue.numberOfLines = 2
//        self.lblValue.attributedText = value
//        switch cellType {
//        case .icon:
//            break
//        case .econtract:
//            lblValue.textColor = UIColor(red: 0.188, green: 0.843, blue: 0.545, alpha: 1)
//            lblValue.font = UIFont.systemFont(ofSize: 14, weight: .medium)
//            self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actionEdit)))
//        case .contractNo:
//            lblValue.textColor = UIColor(red: 1, green: 0.495, blue: 0.029, alpha: 1)
//            lblValue.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
//        case .text:
//            lblValue.textColor = UIColor(hex: "#333333")
//            lblValue.font = UIFont.systemFont(ofSize: 14, weight: .regular)
//        case .upgradePackage:
//            self.lblValue.numberOfLines = 3
//            let mTable = NSMutableAttributedString(string: "")
//            let attributes: [NSAttributedString.Key: Any] = [
//                .foregroundColor: UIColor(red: 1, green: 0.495, blue: 0.029, alpha: 1),
//                .font: UIFont(name: AppFontName.semiBold, size: 16) ?? UIFont()
//            ]
//            let attributes2: [NSAttributedString.Key: Any] = [
//                .foregroundColor: UIColor(red: 0.157, green: 0.157, blue: 0.157, alpha: 1),
//                .font: UIFont(name: AppFontName.medium, size: 14) ?? UIFont()
//            ]
//            let attributes3: [NSAttributedString.Key: Any] = [
//                .foregroundColor: UIColor(red: 0.463, green: 0.463, blue: 0.463, alpha: 1),
//                .font: UIFont(name: AppFontName.medium, size: 12) ?? UIFont()
//            ]
//            guard let data = data else { return }
//
//            mTable.append(NSMutableAttributedString(string: data.value, attributes:attributes))
//            mTable.append(NSMutableAttributedString(string: !data.typePackage.isEmpty ? "\n\(data.typePackage)" : data.typePackage, attributes:attributes2))
//            mTable.append(NSMutableAttributedString(string: !data.descriptionPackage.isEmpty ? "\n\(data.descriptionPackage)" : data.descriptionPackage, attributes:attributes3))
//            self.lblValue.attributedText = mTable
//        case .changePM:
//            self.lblValue.numberOfLines = 3
//            let mTable = NSMutableAttributedString(string: "")
//            let attributes: [NSAttributedString.Key: Any] = [
//                .foregroundColor: UIColor(red: 0.157, green: 0.157, blue: 0.157, alpha: 1),
//                .font: UIFont(name: AppFontName.medium, size: 14) ?? UIFont()
//            ]
//            
//            let attributes3: [NSAttributedString.Key: Any] = [
//                .foregroundColor: UIColor(red: 0.463, green: 0.463, blue: 0.463, alpha: 1),
//                .font: UIFont(name: AppFontName.medium, size: 14) ?? UIFont()
//            ]
//            guard let data = data else { return }
//
//            mTable.append(NSMutableAttributedString(string: data.value, attributes:attributes))
//            mTable.append(NSMutableAttributedString(string: !data.descriptionPackage.isEmpty ? "\n\(data.descriptionPackage)" : data.descriptionPackage, attributes:attributes3))
//            self.lblValue.attributedText = mTable
//        }
//
//        
//    }
    @objc func actionEdit(){
        btnEditCallback?()
    }
    func setupUI(){
        self.backgroundColor = .white
        btnEdit.setTitleColor(UIColor(red: 0.27, green: 0.394, blue: 0.929, alpha: 1), for: .normal)
        btnEdit.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        btnEdit.setTitle("", for: .normal)
        btnEdit.addTarget(self, action: #selector(actionEdit), for: .touchUpInside)

        btnEdit.isHidden = true
        
        lblKey.text = "KEY"
        lblValue.text = "VALUE"
        lblKey.textColor = UIColor(red: 0.463, green: 0.463, blue: 0.463, alpha: 1)
        lblKey.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        lblValue.textColor = UIColor(red: 0.157, green: 0.157, blue: 0.157, alpha: 1)
        lblValue.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        lineView.backgroundColor = UIColor(hex: "#DCE5FF")
        
        
        lblKey.translatesAutoresizingMaskIntoConstraints = false
        lblValue.translatesAutoresizingMaskIntoConstraints = false
        btnEdit.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        btnEditView.translatesAutoresizingMaskIntoConstraints = false
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        horizotalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizotalStackView.axis = .horizontal
        
        verticalStackView.addArrangedSubview(lblKey)
        verticalStackView.addArrangedSubview(lblValue)
        verticalStackView.spacing = 8
        horizotalStackView.addArrangedSubview(verticalStackView)
        horizotalStackView.addArrangedSubview(btnEditView)
        horizotalStackView.spacing = 8
        self.addSubview(horizotalStackView)
        self.addSubview(lineView)
        btnEditView.addSubview(btnEdit)
        NSLayoutConstraint.activate([
            btnEdit.topAnchor.constraint(equalTo: btnEditView.topAnchor),
            btnEdit.widthAnchor.constraint(equalToConstant: 50),
            btnEdit.heightAnchor.constraint(equalToConstant: 18),
        ])
        NSLayoutConstraint.activate([
            horizotalStackView.topAnchor.constraint(equalTo: self.topAnchor,constant: 12),
            horizotalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:  16),
            horizotalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -12),
            horizotalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:  -16),
            
            horizotalStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            horizotalStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor , constant:  16),
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor , constant:  -16),
            lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:  0),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            btnEditView.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    
}


extension UIView {
    
    private struct AssociatedKeys {
        static var touchAreaRatioAssociationKey: String = "touchAreaRatioAssociationKey"
    }
    
    var touchAreaRatio: CGFloat {
        get {
            guard let value = objc_getAssociatedObject(self, &AssociatedKeys.touchAreaRatioAssociationKey) as? CGFloat else {
                return 1.0 // default value
            }
            return value
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.touchAreaRatioAssociationKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    static let swizzlePointInside: Void = {
          let originalSelector = #selector(point(inside:with:))
          let swizzledSelector = #selector(swizzledPointInside(point:with:))
          let originalMethod = class_getInstanceMethod(UIView.self, originalSelector)!
          let swizzledMethod = class_getInstanceMethod(UIView.self, swizzledSelector)!
          method_exchangeImplementations(originalMethod, swizzledMethod)
      }()
      
      @objc private func swizzledPointInside(point: CGPoint, with event: UIEvent?) -> Bool {
          let bounds = self.bounds
          let widthToAdd = (bounds.size.width * touchAreaRatio - bounds.size.width) / 2
          let heightToAdd = (bounds.size.height * touchAreaRatio - bounds.size.height) / 2
          let largerFrame = bounds.insetBy(dx: -widthToAdd, dy: -heightToAdd)
          return largerFrame.contains(point)
      }
    
}

