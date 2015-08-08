//
//  TouchClassifier.swift
//  SwiftGL
//
//  Created by jerry on 2015/6/10.
//  Copyright (c) 2015年 Scott Bennett. All rights reserved.
//

import Foundation

/* This file is automatically generated by convert_j48.py */

//
//  features.h
//  TouchRecord
//
//  Created by Julia Schwarz on 8/9/13.
//
//


struct list_feature {
    var mean:Float
    var std:Float
    var min:Float
    var max:Float
}

struct window_features {
    var num_events:Int;
    var num_other_events:Int;
    var  dist:list_feature;
    var  major_axis:list_feature;
    var  speed:list_feature;
    var  accel:list_feature;
};

struct Features {
    var window_features_50:window_features;
    var window_features_100:window_features;
    var window_features_200:window_features;
    var window_features_300:window_features;
    var window_features_400:window_features;
    var window_features_500:window_features;
    var window_features_600:window_features;
    var window_features_700:window_features;
    var window_features_800:window_features;
    var window_features_900:window_features;
    var window_features_1000:window_features;
};


class TouchClassifier {
    //#define CLASS(x) TOUCH_KIND_##x
    //#define return(x) do { DEBUG("%s at line %d", #x, __LINE__); return CLASS(x); } while(0)
    enum TouchClass:Int{
       case Pointer = 0,PALM,UNKNOWN
    }
    
    func classify_1000(features:Features)->TouchClass
    {
    if((features.window_features_900.major_axis.mean) <= 6.39999) {
    if((features.window_features_1000.accel.std) <= 0.000516) {
    if((features.window_features_1000.dist.std) <= 61.713456) { return(TouchClass.Pointer); /* (41.0/3.0) */ }
    if((features.window_features_1000.dist.std) > 61.713456) {
    if((features.window_features_800.dist.min) <= 180.825883) { return(TouchClass.PALM); /* (204.0) */ }
    if((features.window_features_800.dist.min) > 180.825883) { return(TouchClass.Pointer); /* (13.0) */ }
    }
    }
    if((features.window_features_1000.accel.std) > 0.000516) {
    if((features.window_features_1000.major_axis.std) <= 0.3154) {
    if((features.window_features_1000.dist.min) <= 83.216585) {
    if((features.window_features_50.num_other_events) <= 1) { return(TouchClass.Pointer); /* (129.0) */ }
    if((features.window_features_50.num_other_events) > 1) { return(TouchClass.PALM); /* (55.0) */ }
    }
    if((features.window_features_1000.dist.min) > 83.216585) { return(TouchClass.Pointer); /* (1297.0/3.0) */ }
    }
    if((features.window_features_1000.major_axis.std) > 0.3154) {
    if((features.window_features_100.dist.mean) <= 401.72607) { return(TouchClass.PALM); /* (25.0/1.0) */ }
    if((features.window_features_100.dist.mean) > 401.72607) { return(TouchClass.Pointer); /* (7.0) */ }
    }
    }
    }
    if((features.window_features_900.major_axis.mean) > 6.39999) {
    if((features.window_features_900.num_other_events) <= 0) {
    if((features.window_features_400.major_axis.min) <= 8.34999) { return(TouchClass.Pointer); /* (16.0) */ }
    if((features.window_features_400.major_axis.min) > 8.34999) { return(TouchClass.PALM); /* (10.0) */ }
    }
    if((features.window_features_900.num_other_events) > 0) { return(TouchClass.PALM); /* (9576.0/6.0) */ }
    }
    return(TouchClass.UNKNOWN);
    }
    
    func classify_100(features:Features)->TouchClass {
    if((features.window_features_100.major_axis.mean) <= 6.404995) {
    if((features.window_features_100.dist.min) <= 162.373027) {
    if((features.window_features_50.num_other_events) <= 2) { return(TouchClass.Pointer); /* (308.0/10.0) */ }
    if((features.window_features_50.num_other_events) > 2) {
    if((features.window_features_50.dist.min) <= 110.476242) { return(TouchClass.PALM); /* (311.0) */ }
    if((features.window_features_50.dist.min) > 110.476242) {
    if((features.window_features_100.dist.min) <= 146.863883) { return(TouchClass.PALM); /* (14.0) */ }
    if((features.window_features_100.dist.min) > 146.863883) { return(TouchClass.Pointer); /* (3.0) */ }
    }
    }
    }
    if((features.window_features_100.dist.min) > 162.373027) { return(TouchClass.Pointer); /* (1391.0/11.0) */ }
    }
    if((features.window_features_100.major_axis.mean) > 6.404995) {
    if((features.window_features_50.major_axis.mean) <= 6.63999) {
    if((features.window_features_100.dist.min) <= 268.516294) {
    if((features.window_features_100.num_other_events) <= 0) { return(TouchClass.Pointer); /* (11.0/1.0) */ }
    if((features.window_features_100.num_other_events) > 0) { return(TouchClass.PALM); /* (158.0) */ }
    }
    if((features.window_features_100.dist.min) > 268.516294) { return(TouchClass.Pointer); /* (9.0) */ }
    }
    if((features.window_features_50.major_axis.mean) > 6.63999) { return(TouchClass.PALM); /* (9951.0/7.0) */ }
    }
    return(TouchClass.UNKNOWN);
    }
    
    func classify_200(features:Features)->TouchClass {
    if((features.window_features_200.major_axis.mean) <= 6.414995) {
    if((features.window_features_200.dist.min) <= 147.787009) {
    if((features.window_features_200.dist.std) <= 6.470769) { return(TouchClass.Pointer); /* (285.0/6.0) */ }
    if((features.window_features_200.dist.std) > 6.470769) { return(TouchClass.PALM); /* (323.0/2.0) */ }
    }
    if((features.window_features_200.dist.min) > 147.787009) { return(TouchClass.Pointer); /* (1413.0/8.0) */ }
    }
    if((features.window_features_200.major_axis.mean) > 6.414995) {
    if((features.window_features_50.major_axis.mean) <= 6.569995) {
    if((features.window_features_200.dist.std) <= 8.172674) { return(TouchClass.Pointer); /* (13.0/1.0) */ }
    if((features.window_features_200.dist.std) > 8.172674) {
    if((features.window_features_50.dist.min) <= 166.532279) { return(TouchClass.PALM); /* (139.0) */ }
    if((features.window_features_50.dist.min) > 166.532279) {
    if((features.window_features_50.major_axis.std) <= 0.009995) { return(TouchClass.PALM); /* (6.0) */ }
    if((features.window_features_50.major_axis.std) > 0.009995) { return(TouchClass.Pointer); /* (2.0) */ }
    }
    }
    }
    if((features.window_features_50.major_axis.mean) > 6.569995) { return(TouchClass.PALM); /* (9975.0/7.0) */ }
    }
    return(TouchClass.UNKNOWN);
    }
    func classify_300(features:Features)->TouchClass {
    if((features.window_features_300.major_axis.mean) <= 6.39999) {
    if((features.window_features_300.accel.std) <= 0.000487) {
    if((features.window_features_200.dist.std) <= 5.180265) { return(TouchClass.Pointer); /* (58.0/2.0) */ }
    if((features.window_features_200.dist.std) > 5.180265) {
    if((features.window_features_200.dist.min) <= 239.718585) { return(TouchClass.PALM); /* (225.0) */ }
    if((features.window_features_200.dist.min) > 239.718585) { return(TouchClass.Pointer); /* (38.0) */ }
    }
    }
    if((features.window_features_300.accel.std) > 0.000487) {
    if((features.window_features_300.dist.min) <= 116.107709) {
    if((features.window_features_50.num_other_events) <= 2) { return(TouchClass.Pointer); /* (228.0/3.0) */ }
    if((features.window_features_50.num_other_events) > 2) { return(TouchClass.PALM); /* (79.0) */ }
    }
    if((features.window_features_300.dist.min) > 116.107709) { return(TouchClass.Pointer); /* (1371.0/7.0) */ }
    }
    }
    if((features.window_features_300.major_axis.mean) > 6.39999) {
    if((features.window_features_50.major_axis.mean) <= 6.569995) {
    if((features.window_features_200.dist.std) <= 8.172674) {
    if((features.window_features_300.major_axis.max) <= 7.46999) { return(TouchClass.Pointer); /* (16.0) */ }
    if((features.window_features_300.major_axis.max) > 7.46999) { return(TouchClass.PALM); /* (4.0/1.0) */ }
    }
    if((features.window_features_200.dist.std) > 8.172674) { return(TouchClass.PALM); /* (161.0) */ }
    }
    if((features.window_features_50.major_axis.mean) > 6.569995) { return(TouchClass.PALM); /* (9976.0/7.0) */ }
    }
    return(TouchClass.UNKNOWN);
    }
    func classify_400(features:Features)->TouchClass {
    if((features.window_features_400.major_axis.mean) <= 6.39999) {
    if((features.window_features_400.accel.std) <= 0.000487) {
    if((features.window_features_100.dist.std) <= 5.162305) {
    if((features.window_features_400.dist.std) <= 24.916651) { return(TouchClass.Pointer); /* (47.0/1.0) */ }
    if((features.window_features_400.dist.std) > 24.916651) {
    if((features.window_features_50.major_axis.min) <= 6.06) { return(TouchClass.PALM); /* (2.0) */ }
    if((features.window_features_50.major_axis.min) > 6.06) { return(TouchClass.Pointer); /* (3.0) */ }
    }
    }
    if((features.window_features_100.dist.std) > 5.162305) {
    if((features.window_features_400.dist.min) <= 226.2145) { return(TouchClass.PALM); /* (219.0) */ }
    if((features.window_features_400.dist.min) > 226.2145) { return(TouchClass.Pointer); /* (24.0) */ }
    }
    }
    if((features.window_features_400.accel.std) > 0.000487) {
    if((features.window_features_400.dist.min) <= 90) {
    if((features.window_features_50.num_other_events) <= 1) { return(TouchClass.Pointer); /* (229.0/3.0) */ }
    if((features.window_features_50.num_other_events) > 1) { return(TouchClass.PALM); /* (80.0) */ }
    }
    if((features.window_features_400.dist.min) > 90) { return(TouchClass.Pointer); /* (1394.0/9.0) */ }
    }
    }
    if((features.window_features_400.major_axis.mean) > 6.39999) {
    if((features.window_features_400.num_other_events) <= 0) {
    if((features.window_features_300.major_axis.max) <= 8.10999) { return(TouchClass.Pointer); /* (18.0/1.0) */ }
    if((features.window_features_300.major_axis.max) > 8.10999) { return(TouchClass.PALM); /* (125.0) */ }
    }
    if((features.window_features_400.num_other_events) > 0) { return(TouchClass.PALM); /* (10015.0/6.0) */ }
    }
    return(TouchClass.UNKNOWN);
    }
    func classify_50(features:Features)->TouchClass {
    if((features.window_features_50.major_axis.mean) <= 6.469995) {
    if((features.window_features_50.dist.min) <= 193.214906) {
    if((features.window_features_50.dist.std) <= 2.132406) {
    if((features.window_features_50.num_other_events) <= 0) { return(TouchClass.Pointer); /* (349.0/9.0) */ }
    if((features.window_features_50.num_other_events) > 0) {
    if((features.window_features_50.dist.mean) <= 152.806015) { return(TouchClass.PALM); /* (7.0) */ }
    if((features.window_features_50.dist.mean) > 152.806015) { return(TouchClass.Pointer); /* (19.0) */ }
    }
    }
    if((features.window_features_50.dist.std) > 2.132406) {
    if((features.window_features_50.dist.min) <= 124.02016) { return(TouchClass.PALM); /* (386.0) */ }
    if((features.window_features_50.dist.min) > 124.02016) {
    if((features.window_features_50.major_axis.mean) <= 5.76499) { return(TouchClass.Pointer); /* (7.0/2.0) */ }
    if((features.window_features_50.major_axis.mean) > 5.76499) {
    if((features.window_features_50.dist.std) <= 50.272625) { return(TouchClass.Pointer); /* (2.0) */ }
    if((features.window_features_50.dist.std) > 50.272625) { return(TouchClass.PALM); /* (12.0) */ }
    }
    }
    }
    }
    if((features.window_features_50.dist.min) > 193.214906) { return(TouchClass.Pointer); /* (1334.0/11.0) */ }
    }
    if((features.window_features_50.major_axis.mean) > 6.469995) {
    if((features.window_features_50.major_axis.mean) <= 6.63999) {
    if((features.window_features_50.dist.min) <= 255.280238) {
    if((features.window_features_50.num_other_events) <= 0) {
    if((features.window_features_50.major_axis.min) <= 6.48999) { return(TouchClass.PALM); /* (4.0/1.0) */ }
    if((features.window_features_50.major_axis.min) > 6.48999) { return(TouchClass.Pointer); /* (3.0) */ }
    }
    if((features.window_features_50.num_other_events) > 0) { return(TouchClass.PALM); /* (72.0) */ }
    }
    if((features.window_features_50.dist.min) > 255.280238) { return(TouchClass.Pointer); /* (7.0) */ }
    }
    if((features.window_features_50.major_axis.mean) > 6.63999) { return(TouchClass.PALM); /* (9954.0/7.0) */ }
    }
    return(TouchClass.UNKNOWN);
    }
    func classify_500(features:Features)->TouchClass {
    if((features.window_features_500.major_axis.mean) <= 6.400618) {
    if((features.window_features_500.accel.std) <= 0.000516) {
    if((features.window_features_500.dist.std) <= 19.547971) {
    if((features.window_features_200.major_axis.min) <= 6.09999) { return(TouchClass.Pointer); /* (36.0) */ }
    if((features.window_features_200.major_axis.min) > 6.09999) {
    if((features.window_features_200.major_axis.mean) <= 6.254995) { return(TouchClass.PALM); /* (2.0) */ }
    if((features.window_features_200.major_axis.mean) > 6.254995) { return(TouchClass.Pointer); /* (5.0) */ }
    }
    }
    if((features.window_features_500.dist.std) > 19.547971) {
    if((features.window_features_400.dist.min) <= 209.773688) { return(TouchClass.PALM); /* (220.0) */ }
    if((features.window_features_400.dist.min) > 209.773688) { return(TouchClass.Pointer); /* (21.0) */ }
    }
    }
    if((features.window_features_500.accel.std) > 0.000516) {
    if((features.window_features_500.dist.min) <= 90) {
    if((features.window_features_50.num_other_events) <= 1) { return(TouchClass.Pointer); /* (234.0/3.0) */ }
    if((features.window_features_50.num_other_events) > 1) { return(TouchClass.PALM); /* (79.0) */ }
    }
    if((features.window_features_500.dist.min) > 90) { return(TouchClass.Pointer); /* (1399.0/8.0) */ }
    }
    }
    if((features.window_features_500.major_axis.mean) > 6.400618) {
    if((features.window_features_500.num_other_events) <= 0) {
    if((features.window_features_200.major_axis.max) <= 8.10999) { return(TouchClass.Pointer); /* (17.0) */ }
    if((features.window_features_200.major_axis.max) > 8.10999) { return(TouchClass.PALM); /* (63.0) */ }
    }
    if((features.window_features_500.num_other_events) > 0) { return(TouchClass.PALM); /* (10080.0/6.0) */ }
    }
    return(TouchClass.UNKNOWN);
    }
    func classify_600(features:Features)->TouchClass {
    if((features.window_features_500.major_axis.mean) <= 6.400618) {
    if((features.window_features_500.accel.std) <= 0.000516) {
    if((features.window_features_500.dist.std) <= 19.547971) {
    if((features.window_features_200.major_axis.min) <= 6.09999) { return(TouchClass.Pointer); /* (36.0) */ }
    if((features.window_features_200.major_axis.min) > 6.09999) {
    if((features.window_features_200.major_axis.mean) <= 6.254995) { return(TouchClass.PALM); /* (2.0) */ }
    if((features.window_features_200.major_axis.mean) > 6.254995) { return(TouchClass.Pointer); /* (5.0) */ }
    }
    }
    if((features.window_features_500.dist.std) > 19.547971) {
    if((features.window_features_600.dist.min) <= 199.421664) { return(TouchClass.PALM); /* (220.0) */ }
    if((features.window_features_600.dist.min) > 199.421664) { return(TouchClass.Pointer); /* (21.0) */ }
    }
    }
    if((features.window_features_500.accel.std) > 0.000516) {
    if((features.window_features_600.dist.min) <= 89.88882) {
    if((features.window_features_50.num_other_events) <= 1) {
    if((features.window_features_600.num_events) <= 5) {
    if((features.window_features_50.major_axis.mean) <= 5.11499) { return(TouchClass.PALM); /* (2.0) */ }
    if((features.window_features_50.major_axis.mean) > 5.11499) { return(TouchClass.Pointer); /* (11.0) */ }
    }
    if((features.window_features_600.num_events) > 5) { return(TouchClass.Pointer); /* (221.0/1.0) */ }
    }
    if((features.window_features_50.num_other_events) > 1) { return(TouchClass.PALM); /* (79.0) */ }
    }
    if((features.window_features_600.dist.min) > 89.88882) { return(TouchClass.Pointer); /* (1399.0/8.0) */ }
    }
    }
    if((features.window_features_500.major_axis.mean) > 6.400618) {
    if((features.window_features_600.num_other_events) <= 0) {
    if((features.window_features_50.major_axis.max) <= 7.87999) { return(TouchClass.Pointer); /* (17.0) */ }
    if((features.window_features_50.major_axis.max) > 7.87999) { return(TouchClass.PALM); /* (40.0) */ }
    }
    if((features.window_features_600.num_other_events) > 0) { return(TouchClass.PALM); /* (10103.0/6.0) */ }
    }
    return(TouchClass.UNKNOWN);
    }
    func classify_700(features:Features)->TouchClass {
    if((features.window_features_500.major_axis.mean) <= 6.400618) {
    if((features.window_features_700.accel.std) <= 0.000516) {
    if((features.window_features_500.dist.std) <= 19.547971) {
    if((features.window_features_200.major_axis.min) <= 6.09999) { return(TouchClass.Pointer); /* (34.0) */ }
    if((features.window_features_200.major_axis.min) > 6.09999) {
    if((features.window_features_200.major_axis.mean) <= 6.254995) { return(TouchClass.PALM); /* (2.0) */ }
    if((features.window_features_200.major_axis.mean) > 6.254995) { return(TouchClass.Pointer); /* (5.0) */ }
    }
    }
    if((features.window_features_500.dist.std) > 19.547971) {
    if((features.window_features_700.dist.min) <= 194.126248) { return(TouchClass.PALM); /* (220.0) */ }
    if((features.window_features_700.dist.min) > 194.126248) { return(TouchClass.Pointer); /* (20.0) */ }
    }
    }
    if((features.window_features_700.accel.std) > 0.000516) {
    if((features.window_features_600.dist.min) <= 89.88882) {
    if((features.window_features_50.num_other_events) <= 1) { return(TouchClass.Pointer); /* (235.0/3.0) */ }
    if((features.window_features_50.num_other_events) > 1) { return(TouchClass.PALM); /* (79.0) */ }
    }
    if((features.window_features_600.dist.min) > 89.88882) { return(TouchClass.Pointer); /* (1401.0/8.0) */ }
    }
    }
    if((features.window_features_500.major_axis.mean) > 6.400618) {
    if((features.window_features_700.num_other_events) <= 0) {
    if((features.window_features_400.major_axis.min) <= 8.23) { return(TouchClass.Pointer); /* (17.0) */ }
    if((features.window_features_400.major_axis.min) > 8.23) { return(TouchClass.PALM); /* (24.0) */ }
    }
    if((features.window_features_700.num_other_events) > 0) { return(TouchClass.PALM); /* (10119.0/6.0) */ }
    }
    return(TouchClass.UNKNOWN);
    }
    func classify_800(features:Features)->TouchClass {
    if((features.window_features_500.major_axis.mean) <= 6.400618) {
    if((features.window_features_700.accel.std) <= 0.000516) {
    if((features.window_features_800.dist.std) <= 50.062134) {
    if((features.window_features_50.dist.std) <= 3.119) { return(TouchClass.Pointer); /* (40.0/1.0) */ }
    if((features.window_features_50.dist.std) > 3.119) {
    if((features.window_features_50.num_other_events) <= 4) { return(TouchClass.PALM); /* (2.0) */ }
    if((features.window_features_50.num_other_events) > 4) { return(TouchClass.Pointer); /* (5.0) */ }
    }
    }
    if((features.window_features_800.dist.std) > 50.062134) {
    if((features.window_features_800.dist.min) <= 180.867355) { return(TouchClass.PALM); /* (219.0) */ }
    if((features.window_features_800.dist.min) > 180.867355) { return(TouchClass.Pointer); /* (15.0) */ }
    }
    }
    if((features.window_features_700.accel.std) > 0.000516) {
    if((features.window_features_600.dist.min) <= 89.88882) {
    if((features.window_features_50.num_other_events) <= 1) { return(TouchClass.Pointer); /* (235.0/3.0) */ }
    if((features.window_features_50.num_other_events) > 1) { return(TouchClass.PALM); /* (79.0) */ }
    }
    if((features.window_features_600.dist.min) > 89.88882) { return(TouchClass.Pointer); /* (1401.0/8.0) */ }
    }
    }
    if((features.window_features_500.major_axis.mean) > 6.400618) {
    if((features.window_features_800.num_other_events) <= 0) {
    if((features.window_features_400.major_axis.min) <= 8.23) { return(TouchClass.Pointer); /* (17.0) */ }
    if((features.window_features_400.major_axis.min) > 8.23) { return(TouchClass.PALM); /* (15.0) */ }
    }
    if((features.window_features_800.num_other_events) > 0) { return(TouchClass.PALM); /* (10128.0/6.0) */ }
    }
    return(TouchClass.UNKNOWN);
    }
    func classify_900(features:Features)->TouchClass {
    if((features.window_features_900.major_axis.mean) <= 6.39999) {
    if((features.window_features_900.accel.std) <= 0.000516) {
    if((features.window_features_800.dist.std) <= 50.062134) {
    if((features.window_features_50.dist.std) <= 3.119) { return(TouchClass.Pointer); /* (38.0/1.0) */ }
    if((features.window_features_50.dist.std) > 3.119) {
    if((features.window_features_50.num_other_events) <= 4) { return(TouchClass.PALM); /* (2.0) */ }
    if((features.window_features_50.num_other_events) > 4) { return(TouchClass.Pointer); /* (5.0) */ }
    }
    }
    if((features.window_features_800.dist.std) > 50.062134) {
    if((features.window_features_800.dist.min) <= 180.867355) { return(TouchClass.PALM); /* (217.0) */ }
    if((features.window_features_800.dist.min) > 180.867355) { return(TouchClass.Pointer); /* (14.0) */ }
    }
    }
    if((features.window_features_900.accel.std) > 0.000516) {
    if((features.window_features_500.major_axis.std) <= 0.323218) {
    if((features.window_features_900.dist.min) <= 83.737686) {
    if((features.window_features_50.num_other_events) <= 1) {
    if((features.window_features_800.num_events) <= 5) {
    if((features.window_features_50.major_axis.mean) <= 5.11499) { return(TouchClass.PALM); /* (2.0) */ }
    if((features.window_features_50.major_axis.mean) > 5.11499) { return(TouchClass.Pointer); /* (12.0) */ }
    }
    if((features.window_features_800.num_events) > 5) { return(TouchClass.Pointer); /* (222.0/1.0) */ }
    }
    if((features.window_features_50.num_other_events) > 1) { return(TouchClass.PALM); /* (61.0) */ }
    }
    if((features.window_features_900.dist.min) > 83.737686) { return(TouchClass.Pointer); /* (1393.0/5.0) */ }
    }
    if((features.window_features_500.major_axis.std) > 0.323218) {
    if((features.window_features_50.dist.mean) <= 335.078328) { return(TouchClass.PALM); /* (23.0/1.0) */ }
    if((features.window_features_50.dist.mean) > 335.078328) { return(TouchClass.Pointer); /* (6.0) */ }
    }
    }
    }
    if((features.window_features_900.major_axis.mean) > 6.39999) {
    if((features.window_features_900.num_other_events) <= 0) {
    if((features.window_features_400.major_axis.min) <= 8.34999) { return(TouchClass.Pointer); /* (16.0) */ }
    if((features.window_features_400.major_axis.min) > 8.34999) { return(TouchClass.PALM); /* (10.0) */ }
    }
    if((features.window_features_900.num_other_events) > 0) {
    if((features.window_features_100.major_axis.max) <= 6.35999) {
    if((features.window_features_200.dist.min) <= 140.602276) { return(TouchClass.PALM); /* (29.0) */ }
    if((features.window_features_200.dist.min) > 140.602276) { return(TouchClass.Pointer); /* (3.0) */ }
    }
    if((features.window_features_100.major_axis.max) > 6.35999) { return(TouchClass.PALM); /* (10103.0/4.0) */ }
    }
    }
    return(TouchClass.UNKNOWN);
    }

}

