//
//  ViewController.m
//  CityHallFinder
//
//  Created by Ian MacKinnon on 2014-10-30.
//  Copyright (c) 2014 Ian MacKinnon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    CLLocationManager *_locationManager;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //we need to do this to make showsUserlocation work
    _locationManager = [[CLLocationManager alloc] init];
    [_locationManager requestWhenInUseAuthorization];
    [_locationManager startUpdatingLocation];
    _locationManager.delegate = self;
    
    self.mapview.delegate =self;
    self.mapview.showsUserLocation = true;
    
    CLLocationCoordinate2D startingLocation;
    startingLocation.latitude = 49.281815;
    startingLocation.longitude =-123.108219;
    
    //[self.mapview setCenterCoordinate:startingLocation];
    
    MKCoordinateRegion startingRegion;
    startingRegion.center = startingLocation;
    startingRegion.span.latitudeDelta = 0.02;
    startingRegion.span.longitudeDelta = 0.02;
    
    [self.mapview setRegion:startingRegion];
    
    MKPointAnnotation *marker=[[MKPointAnnotation alloc] init];
    CLLocationCoordinate2D cityHallLocation;
    cityHallLocation.latitude = 49.2607834;
    cityHallLocation.longitude = -123.1151686;
    
    marker.coordinate = cityHallLocation;
    marker.title = @"Vancouver City Hall";
    
    [self.mapview addAnnotation:marker];
}

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)_annotation{
    
    
    if (_annotation == self.mapview.userLocation){
        return nil; //default to blue dot
    }
    
    static NSString* annotationIdentifier = @"cityHallAnnotation";
    
    MKAnnotationView* pinView = (MKAnnotationView *)
    [self.mapview dequeueReusableAnnotationViewWithIdentifier:annotationIdentifier];
    
    if (!pinView) {
        // if an existing pin view was not available, create one
        pinView = [[MKPinAnnotationView alloc]
                    initWithAnnotation:_annotation reuseIdentifier:annotationIdentifier];
    }
    pinView.tintColor = [UIColor greenColor];
    pinView.canShowCallout = YES;
    //pinView.calloutOffset = CGPointMake(-7, 0);
    //pinView.draggable = false;
    return pinView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
