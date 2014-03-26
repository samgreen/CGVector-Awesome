//
//  CGVectorTests.m
//  SMG
//
//  Created by Sam Green on 3/25/14.
//  Copyright (c) 2014 Sam Green. All rights reserved.
//

@import XCTest;

@interface CGVectorTests : XCTestCase
@end

@implementation CGVectorTests

- (void)testSum {
    CGVector v1 = CGVectorMake(1, 2);
    CGVector v2 = CGVectorMake(2, 3);
    
    CGVector result = CGVectorSum(v1, v2);
    
    XCTAssertEqualWithAccuracy(result.dx, 3, FLT_EPSILON);
    XCTAssertEqualWithAccuracy(result.dy, 5, FLT_EPSILON);
}

- (void)testDifference {
    CGVector v1 = CGVectorMake(5, 5);
    CGVector v2 = CGVectorMake(1, 2);
    
    CGVector result = CGVectorDifference(v1, v2);
    
    XCTAssertEqualWithAccuracy(result.dx, 4, FLT_EPSILON);
    XCTAssertEqualWithAccuracy(result.dy, 3, FLT_EPSILON);
}

- (void)testMultiply {
    CGVector v1 = CGVectorMake(1, 2);
    CGVector v2 = CGVectorMake(2, 3);
    
    CGVector result = CGVectorMultiply(v1, v2);
    
    XCTAssertEqualWithAccuracy(result.dx, 2, FLT_EPSILON);
    XCTAssertEqualWithAccuracy(result.dy, 6, FLT_EPSILON);
}

- (void)testMultiplyByScalar {
    CGVector v1 = CGVectorMake(1, 2);
    
    CGVector result = CGVectorMultiplyByScalar(v1, 3);
    
    XCTAssertEqualWithAccuracy(result.dx, 3, FLT_EPSILON);
    XCTAssertEqualWithAccuracy(result.dy, 6, FLT_EPSILON);
}

- (void)testMakePerpendicular {
    CGVector v1 = CGVectorMake(0, 1);
    
    CGVector result = CGVectorMakePerpendicular(v1);
    
    XCTAssertEqualWithAccuracy(result.dx, 1, FLT_EPSILON);
    XCTAssertEqualWithAccuracy(result.dy, 0, FLT_EPSILON);
}

- (void)testAngleBetween {
    CGVector v1 = CGVectorMake(1, 0);
    CGVector v2 = CGVectorMake(0, 1);
    
    CGFloat result = CGVectorAngleBetween(v1, v2);
    
    XCTAssertEqualWithAccuracy(result, M_PI_2, FLT_EPSILON);
}

- (void)testAngle {
    CGVector v1 = CGVectorMake(1, 1);
    
    CGFloat result = CGVectorAngle(v1);
    
    XCTAssertEqualWithAccuracy(result, M_PI_4, FLT_EPSILON);
}

- (void)testDotProduct {
    //  X·Y = 0 if X is perpendicular to Y.
    
    {
        CGVector v1 = CGVectorMake(0, 1);
        CGVector v2 = CGVectorMake(1, 0);
        
        CGFloat result = CGVectorDotProduct(v1, v2);
        
        XCTAssertEqualWithAccuracy(result, 0, FLT_EPSILON);
    }
    
    {
        CGVector v1 = CGVectorMake(1, 1);
        CGVector v2 = CGVectorMake(1, 0);
        
        CGFloat result = CGVectorDotProduct(v1, v2);
        
        XCTAssertEqualWithAccuracy(result, 1, FLT_EPSILON);
    }
    
    {
        CGVector v1 = CGVectorMake(0, -1);
        CGVector v2 = CGVectorMake(0, 1);
        
        CGFloat result = CGVectorDotProduct(v1, v2);
        
        XCTAssertEqualWithAccuracy(result, -1, FLT_EPSILON);
    }
}

- (void)testMagnitude {
    CGVector v1 = CGVectorMake(1, 1);
    
    CGFloat result = CGVectorMagnitude(v1);
    
    static const CGFloat kSquareRootOfTwo = 1.4142f;
    XCTAssertEqualWithAccuracy(result, kSquareRootOfTwo, 0.0001f);
}

- (void)testNormalize {
    CGVector v1 = CGVectorMake(3, 3);
    
    CGVector result = CGVectorNormalize(v1);
    
    static const CGFloat kLengthOfDiagonal = 0.7071f;
    XCTAssertEqualWithAccuracy(result.dx, kLengthOfDiagonal, 0.0001f);
    XCTAssertEqualWithAccuracy(result.dy, kLengthOfDiagonal, 0.0001f);
}

- (void)testEquality {
    CGVector v1 = CGVectorMake(1, 1);
    CGVector v2 = CGVectorMake(1, 1);
    
    BOOL result = CGVectorEqualToVector(v1, v2);
    XCTAssertTrue(result);
}

- (void)testPerpendicularEquality {
    CGVector v1 = CGVectorMake(0, 1);
    CGVector v2 = CGVectorMake(1, 0);
    
    BOOL result = CGVectorPerpendicularToVector(v1, v2);
    XCTAssertTrue(result);
}

@end
