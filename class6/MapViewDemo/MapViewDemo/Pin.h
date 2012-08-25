//
//  Pin.h
//  MapViewDemo
//
//  Created by Freshman on 6/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Pin : NSObject <MKAnnotation>

// required by the MKAnnotation
@property (nonatomic) CLLocationCoordinate2D coordinate;

// optional but we need these
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

// and extra data
@property (nonatomic) BOOL isCurrentLocationMark;

@end
