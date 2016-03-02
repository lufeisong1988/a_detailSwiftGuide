//
//  QRCode.swift
//  JJWeiBo
//
//  Created by jxf on 16/3/2.
//  Copyright © 2016年 JJ.sevn. All rights reserved.
//

import UIKit
import AVFoundation

class QRCode: NSObject {
    
    // MARK:- 属性
    private var previewViewRect: CGRect?
    private var customCaptureRect: CGRect?
    private var  scanCompleted: ((qrMessage: String) -> ())?
    private var  photoReadCompleted: ((qrMessage: String) -> ())?
    // API
    func startQrView(preview : UIView, customCaptureView : UIView, resultBlock: (qrMessage: String) -> ()) {
        previewViewRect = preview.frame
        customCaptureRect = customCaptureView.frame
        startScan(preview)
        scanCompleted = resultBlock
    }
    func readQrCodeFromePhotoLibrary(modalVc: UIViewController, resultBlock: (qrMessage: String) -> ()) {
        
        photoReadCompleted = resultBlock
        // 0. 判断是否可以打开相册
        guard UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) else
        {
            return
        }
        
        // 1.创建图片选择器
        let pickerVc = UIImagePickerController()
        pickerVc.delegate = self
        // 2.弹出图片选择器
        modalVc.presentViewController(pickerVc, animated: true, completion: nil)

    }
    
    deinit {
        print("被销毁了")
    }
    // MARK:- 懒加载
    /// 输入
    private lazy var input : AVCaptureDeviceInput? = {
       let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        let deviceInput = try? AVCaptureDeviceInput(device: device)
        return deviceInput
    }()
    ///输出
    private lazy var output : AVCaptureMetadataOutput = {
        let output = AVCaptureMetadataOutput()
        // 1.捕捉范围的frame
        let rect = self.previewViewRect ?? CGRectZero
        // 2.有效捕捉的frame
        let customRect = self.customCaptureRect ?? CGRectZero
        output.rectOfInterest = CGRect(x: customRect.origin.y / rect.size.height, y: customRect.origin.x / rect.size.width , width: customRect.size.height / rect.size.height , height: customRect.size.width / rect.size.width)
        return output
    }()
    // 会话
    private lazy var session: AVCaptureSession = AVCaptureSession()
    /// 创建预览图层
    private lazy var previewLayer: AVCaptureVideoPreviewLayer = {
        let layer = AVCaptureVideoPreviewLayer(session: self.session)
        layer.frame = self.previewViewRect ?? CGRectZero
        return layer
    }()
    // 条码描边 layer
    private lazy var drawLayer: CALayer = {
        let drawerLayer = CALayer()
        drawerLayer.frame = self.previewViewRect ?? CGRectZero
        return drawerLayer
    }()
    
    private func startScan(preview : UIView)
    {
        
        // 1.判断输入能否添加到会话中
        if !session.canAddInput(input)
        {
            return
        }
        // 2.判断输出能否添加到会话中
        if !session.canAddOutput(output)
        {
            return
        }
        // 3.添加输入和输出
        session.addInput(input)
        session.addOutput(output)
        
        // 4.告诉系统输出可以解析的数据类型
        // 注意点:设置可以解析数据类型一定要在输出对象添加到会话之后设置, 否则就会报错
        output.metadataObjectTypes =  output.availableMetadataObjectTypes
        
        // 5.设置代理监听解析结果
        output.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        
        // 6.添加预览图层
        preview.layer.insertSublayer(previewLayer, atIndex: 0)
        preview.layer.insertSublayer(drawLayer, above: previewLayer)
        
        // 7.开始扫描
        session.startRunning()
    }

}
// MARK:- 捕捉二维码
extension QRCode : AVCaptureMetadataOutputObjectsDelegate {
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!){
        // 获取扫描信息
        let qrMessage =  metadataObjects.last?.stringValue ?? "将二维码/条形码放入框中即可扫描"
        if scanCompleted != nil {
            scanCompleted!(qrMessage: qrMessage)
        }
        clearLines()
        
        // 1.遍历结果集
        for objc in metadataObjects as! [AVMetadataMachineReadableCodeObject]
        {
            // 2.将结果集中的对象中保存的corners坐标, 转换为我们能够识别的坐标
            let res = previewLayer.transformedMetadataObjectForMetadataObject(objc)
            
            // 3.绘制二维码边线
            drawLines(res as! AVMetadataMachineReadableCodeObject)
        }

    }
    // MARK:- 描二维码边
    private func drawLines(cornersObjc: AVMetadataMachineReadableCodeObject) {

        // 0.进行安全校验
        guard let corners = cornersObjc.corners else
        {
//            print("没有数据")
            return
        }
        // 1.创建CAShapeLayer
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.greenColor().CGColor
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.lineWidth = 4
        
        // 2.创建路径
        let path = UIBezierPath()
        
        // 定义变量保存从corners取出来得结果
        var point: CGPoint = CGPointZero
        // 定义变量记录索引
        var index = 0
        
        // 2.1移动到起点
        CGPointMakeWithDictionaryRepresentation((corners[index++] as! CFDictionary), &point)
        path.moveToPoint(point)
        
        // 2.2连接其它的点
        while index < corners.count
        {
            CGPointMakeWithDictionaryRepresentation((corners[index++] as! CFDictionary), &point)
            path.addLineToPoint(point)
        }
        path.closePath()
        
        shapeLayer.path = path.CGPath
        
        // 3.将绘制好得图层添加到drawLayer
        drawLayer.addSublayer(shapeLayer)
    }
    
    /// 清空二维码边线
    private func clearLines()
    {
        // 1.检查有没有子图层
        guard let subLayers = drawLayer.sublayers else
        {
//            print("没有子图层")
            return
        }
        
        // 2.删除子图层
        for layer in subLayers
        {
            layer.removeFromSuperlayer()
        }
    }

}

// MARK:- 读取图片二维码
extension QRCode : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    /// 只要选中一张图片, 就会调用这个代理方法
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        // 1.取出当前选中的图片
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else
        {
            print("没有拿到图片")
            return
        }
        // 2.从图片中识别二维码数据
        // 2.1创建一个CIImage
        let ciImage = CIImage(image: image)!
        
        // 2.2创建一个探测器
        let dict = [CIDetectorAccuracy : CIDetectorAccuracyHigh]
        let detector = CIDetector(ofType: CIDetectorTypeQRCode, context: nil, options: dict)
        
        // 2.3利用探测器检测结果
        let features = detector.featuresInImage(ciImage)
        
        for objc in features
        {
            let qrMessage = (objc as! CIQRCodeFeature).messageString
            if photoReadCompleted != nil {
                photoReadCompleted!(qrMessage: qrMessage)
            }

        }
        
        // 3.关闭图片选择器
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

}

 // MARK:- 生成二维码
extension QRViewController {
    
    // MARK:- 生成原始二维码图片
    class func getQRCodeImage(content : String, sizeWH : CGFloat) -> UIImage {
        
        // 1.创建滤镜对象
        let filter = CIFilter(name: "CIQRCodeGenerator")!
        // 2.恢复默认设置
        filter.setDefaults()
        // 3.设置二维码数据
        let data = "极客江南".dataUsingEncoding(NSUTF8StringEncoding)
        filter.setValue(data, forKey: "inputMessage")
        // 4.从滤镜中刚取出二维码
        let ciImage = filter.outputImage!
        //        let image = UIImage(CIImage: ciImage)
        
        // 5.返回高清二维码图片
        return createNonInterpolatedUIImageFormCIImage(ciImage, size: sizeWH)
    }
    
    /**
     生成高清二维码
     - parameter image: 需要生成原始图片
     - parameter size:  生成的二维码的宽高
     */
    private class func createNonInterpolatedUIImageFormCIImage(image: CIImage, size: CGFloat) -> UIImage {
        
        let extent: CGRect = CGRectIntegral(image.extent)
        let scale: CGFloat = min(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent))
        
        // 1.创建bitmap;
        let width = CGRectGetWidth(extent) * scale
        let height = CGRectGetHeight(extent) * scale
        let cs: CGColorSpaceRef = CGColorSpaceCreateDeviceGray()!
        let bitmapRef = CGBitmapContextCreate(nil, Int(width), Int(height), 8, 0, cs, 0)!
        
        let context = CIContext(options: nil)
        let bitmapImage: CGImageRef = context.createCGImage(image, fromRect: extent)
        
        CGContextSetInterpolationQuality(bitmapRef,  CGInterpolationQuality.None)
        CGContextScaleCTM(bitmapRef, scale, scale);
        CGContextDrawImage(bitmapRef, extent, bitmapImage);
        
        // 2.保存bitmap到图片
        let scaledImage: CGImageRef = CGBitmapContextCreateImage(bitmapRef)!
        
        return UIImage(CGImage: scaledImage)
    }

}
















