//
//  ViewController.h
//  CityHallFinder
//
//  Created by Ian MacKinnon on 2014-10-30.
//  Copyright (c) 2014 Ian MacKinnon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface ViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>



@property(nonatomic,strong) IBOutlet MKMapView *mapview;

@end

