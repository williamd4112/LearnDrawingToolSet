//
//  PaintRecorder.swift
//  SwiftGL
//
//  Created by jerry on 2015/5/31.
//  Copyright (c) 2015年 Scott Bennett. All rights reserved.
//

import SwiftGL
import Darwin
import Foundation
import UIKit

/**
    record the given input data and save into PaintArtwork
*/
class PaintRecorder {
    var stroke:PaintStroke!
    var recordClip:PaintClip!
    //var artwork:PaintArtwork!
    /**
    * 
        When touch begin and stroke started, send in the location, velocity and current time
        
    
    */
    func setRecordClip(clip:PaintClip)
    {
        recordClip = clip
    }
    var strokeStartTime:CFAbsoluteTime = 0
    var strokeEndTime:CFAbsoluteTime = 0
    
    
    func startPoint(sender:UIPanGestureRecognizer,view:PaintView)
    {
        stroke = PaintStroke(tool: PaintToolManager.instance.currentTool)
        PaintToolManager.instance.useCurrentTool()
        stroke.addPoint(genPaintPoint(sender, view: view), time: recordClip.currentTime)
        strokeStartTime = CFAbsoluteTimeGetCurrent()
    }
    func startPoint(touch:UITouch,view:PaintView)
    {
        stroke = PaintStroke(tool: PaintToolManager.instance.currentTool)
        PaintToolManager.instance.useCurrentTool()
        stroke.addPoint(genPaintPoint(touch, view: view), time: recordClip.currentTime)
        strokeStartTime = CFAbsoluteTimeGetCurrent()
    }
    func _movePoint(point:PaintPoint)
    {
        let time = CFAbsoluteTimeGetCurrent()
        if stroke != nil
        {
            PaintToolManager.instance.useCurrentTool()
            let lastPoint = stroke.last()
            let newPoint = point
            /* if the distance of points more than stroke texture size...
            ??
            */
            if (newPoint.position-lastPoint.position).length2>0.5
            {
                //the time is offset by the begining of the touch
                stroke.addPoint(newPoint, time: recordClip.currentTime + time - strokeStartTime)
                //var points = stroke.lastThree()
                let points = stroke.lastTwo()
                if(!points.isEmpty){
                    Painter.renderStaticLine(points)
                }
            }
        }

    }
    func movePoint(sender:UIPanGestureRecognizer,view:PaintView)
    {
        let newPoint = genPaintPoint(sender,view: view)
        _movePoint(newPoint)
    }
    func movePoint(touch:UITouch,view:PaintView)
    {
        let newPoint = genPaintPoint(touch,view: view)
        _movePoint(newPoint)
    }
    
    
    
    func endStroke()
    {
        let time = CFAbsoluteTimeGetCurrent()
        if stroke != nil
        {
            strokeEndTime = time
            recordClip.currentTime += strokeEndTime - strokeStartTime
            
            //GLContextBuffer.instance.endStroke()
            recordClip.addPaintStroke(stroke)
            GLContextBuffer.instance.checkCache(recordClip.strokes.count)
            stroke = nil
            //PaintView.display()
        }
    }
}
func genPaintPoint(sender:UIPanGestureRecognizer,view:PaintView)->PaintPoint
{
    
    var location = sender.locationInView(view)
    location.y = CGFloat(view.bounds.height) - location.y
    let dis = sender.translationInView(view)
    
    return PaintPoint(position: Vec4(point: location)*Float(view.contentScaleFactor), force:Float(1), altitude: Float(M_PI_2), azimuth: normalize(Vec2(1,0)),velocity: Vec2(point: dis))
}
func genPaintPoint(touch:UITouch,view:PaintView)->PaintPoint!
{
    var location:CGPoint

    let previousLocation = touch.previousLocationInView(view)
    var force:CGFloat = 1
    var altitude:CGFloat = CGFloat(M_PI_2)
    var azimuth:CGVector = CGVector.zero
    
    if #available(iOS 9.1, *) {
        if touch.type == UITouchType.Stylus{
            location = touch.preciseLocationInView(view)
            force = touch.force/touch.maximumPossibleForce
            altitude = touch.altitudeAngle
            azimuth = touch.azimuthUnitVectorInView(view)
            location.y = CGFloat(view.bounds.height) - location.y
            let dir = CGPoint(x: location.x - previousLocation.x, y: location.y - previousLocation.y)

            //DLog("Azimuth: \(azimuth)")
            //DLog("altitude: \(altitude)")
            return PaintPoint(position: Vec4(point: location)*Float(view.contentScaleFactor), force:Float(force), altitude: Float(altitude), azimuth: normalize(Vec2(cgVector:azimuth)),velocity: Vec2(point: dir))

        }
    }
    return nil
    

    
    
    //DLog("\(Vec4(point: location)*Float(view.contentScaleFactor)) scale\(view.contentScaleFactor)")
}
