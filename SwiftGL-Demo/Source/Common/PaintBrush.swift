//
//  PaintBrush.swift
//  SwiftGL
//
//  Created by jerry on 2015/5/21.
//  Copyright (c) 2015年 Scott Bennett. All rights reserved.
//

import Foundation
import OpenGLES
import GLKit
import SwiftGL

struct ToolStringInfo {
    var toolName:String = "pen"
    var brushTexture:String = "brush"
    init()
    {
        
    }
    init(tool:String,texture:String)
    {
        toolName = tool
        brushTexture = texture
    }
}
struct ToolValueInfo{
    init()
    {
        
    }
    init(color:Color, size:Float)
    {
        self.color = color
        self.size = size
    }
    var color:Color = Color(0,0,0,255)
    var size:Float = 0
}

class PaintBrush:NSObject{
    
    var texture:Texture!
    var name:String
    
    var sInfo:ToolStringInfo
    var vInfo:ToolValueInfo
    
    var toolType:PaintToolManager.PaintToolType
    
    init(textureName:String,color:Color,size:Float = 10,type:PaintToolManager.PaintToolType)
    {
        texture = BrushTextureLoader.instance.getTexture(textureName)
        name = textureName
    
        sInfo = ToolStringInfo(tool: "pen",texture: textureName)
        vInfo = ToolValueInfo(color: color, size: size)
        self.toolType = type
    }
    func changeColor(color:Color)
    {
        vInfo.color = color
        GLShaderBinder.instance.bindBrushColor(vInfo.color.vec)
    }

    func changeSize(size:Float)
    {
        vInfo.size = size
        GLShaderBinder.instance.bindBrushSize(vInfo.size)
    }
    
    func useTool()
    {
     // print("Tool color: \(vInfo.color.vec)")
        GLShaderBinder.instance.bindBrushSize(vInfo.size)
        GLShaderBinder.instance.bindBrushTexture(texture)
        // initialize brush color
        GLShaderBinder.instance.bindBrushColor(vInfo.color.vec)
        
        Painter.currentBrush = self
        
    }
}