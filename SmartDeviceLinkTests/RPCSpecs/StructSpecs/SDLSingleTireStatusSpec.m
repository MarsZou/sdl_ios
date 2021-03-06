//
//  SDLSingleTireStatusSpec.m
//  SmartDeviceLink


#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLSingleTireStatus.h"
#import "SDLComponentVolumeStatus.h"
#import "SDLNames.h"

QuickSpecBegin(SDLSingleTireStatusSpec)

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLSingleTireStatus* testStruct = [[SDLSingleTireStatus alloc] init];
        
        testStruct.status = SDLComponentVolumeStatusNormal;
        testStruct.monitoringSystemStatus = SDLTPMSLow;
        testStruct.pressure = @67.78;
        
        expect(testStruct.status).to(equal(SDLComponentVolumeStatusNormal));
        expect(testStruct.monitoringSystemStatus).to(equal(SDLTPMSLow));
        expect(testStruct.pressure).to(equal(@67.78));
    });
    
    it(@"Should get correctly when initialized", ^ {
        NSDictionary* dict = @{
                               SDLNameStatus: SDLComponentVolumeStatusLow,
                               SDLNameTPMS: SDLTPMSLow,
                               SDLNamePressure: @67.78
                               };
        SDLSingleTireStatus* testStruct = [[SDLSingleTireStatus alloc] initWithDictionary:dict];
        
        expect(testStruct.status).to(equal(SDLComponentVolumeStatusLow));
        expect(testStruct.monitoringSystemStatus).to(equal(SDLTPMSLow));
        expect(testStruct.pressure).to(equal(@67.78));
    });
    
    it(@"Should return nil if not set", ^ {
        SDLSingleTireStatus* testStruct = [[SDLSingleTireStatus alloc] init];
        
        expect(testStruct.status).to(beNil());
        expect(testStruct.monitoringSystemStatus).to(beNil());
        expect(testStruct.pressure).to(beNil());
    });
});

QuickSpecEnd
