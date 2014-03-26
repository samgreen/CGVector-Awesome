//
//  CGVectorAdditions.h
//  SMG
//
//  Created by Sam Green on 3/25/14.
//  Copyright (c) 2014 Sam Green. All rights reserved.
//

@import CoreGraphics;
@import Foundation;

CG_EXTERN const CGVector CGVectorZero;
CG_EXTERN const CGVector CGVectorUnit;

/* Add two vectors */
CG_INLINE CGVector CGVectorSum(CGVector vector1, CGVector vector2);

/* Subtract two vectors */
CG_INLINE CGVector CGVectorDifference(CGVector vector1, CGVector vector2);

/* Multiply two vectors */
CG_INLINE CGVector CGVectorMultiply(CGVector vector1, CGVector vector2);

/* Multiply a vector by a single scalar */
CG_INLINE CGVector CGVectorMultiplyByScalar(CGVector vector, CGFloat scalar);

/* Normalize a vector. This scales the length of the vector to 1 */
CG_INLINE CGVector CGVectorNormalize(CGVector vector);

/* Creates a vector perpendicular to `vector` */
CG_INLINE CGVector CGVectorMakePerpendicular(CGVector vector);

/* Calculate the angle of between two vectors */
CG_INLINE CGFloat CGVectorAngleBetween(CGVector vector1, CGVector vector2);

/* Calculate the angle of `vector` */
CG_INLINE CGFloat CGVectorAngle(CGVector vector);

/* Calculate the dot product of two vectors */
CG_INLINE CGFloat CGVectorDotProduct(CGVector vector1, CGVector vector2);

/* Calculate the magnitude (length) of a vector */
CG_INLINE CGFloat CGVectorMagnitude(CGVector vector);

/* Create an NSString describing this vector */
CG_INLINE NSString* NSStringFromCGVector(CGVector vector);

/* Determine if two vectors are equal */
CG_INLINE bool __CGVectorEqualToVector(CGVector vector1, CGVector vector2);

/* Determine if two vectors are perpendicular */
CG_INLINE bool __CGVectorPerpendicularToVector(CGVector vector1, CGVector vector2);


CG_INLINE CGVector
CGVectorSum(CGVector vector1, CGVector vector2)
{
    return CGVectorMake(vector1.dx + vector2.dx, vector1.dy + vector2.dy);
}

CG_INLINE CGVector
CGVectorDifference(CGVector vector1, CGVector vector2)
{
    return CGVectorMake(vector1.dx - vector2.dx, vector1.dy - vector2.dy);
}

CG_INLINE CGVector
CGVectorMultiply(CGVector vector1, CGVector vector2)
{
    return CGVectorMake(vector1.dx * vector2.dx, vector1.dy * vector2.dy);
}

CG_INLINE CGVector
CGVectorMultiplyByScalar(CGVector vector, CGFloat scalar)
{
    return CGVectorMake(vector.dx * scalar, vector.dy * scalar);
}

CG_INLINE CGVector
CGVectorNormalize(CGVector vector)
{
    const CGFloat kMagnitude = CGVectorMagnitude(vector);
    return CGVectorMake(vector.dx / kMagnitude, vector.dy / kMagnitude);
}

CG_INLINE CGVector
CGVectorMakePerpendicular(CGVector vector)
{
    return CGVectorMake(-vector.dy, vector.dx);
}

CG_INLINE CGFloat
CGVectorAngleBetween(CGVector vector1, CGVector vector2)
{
    CGFloat dot = CGVectorDotProduct(vector1, vector2);
    CGFloat magnitude = CGVectorMagnitude(vector1) * CGVectorMagnitude(vector2);
    return cos(dot / magnitude);
}

CG_INLINE CGFloat
CGVectorAngle(CGVector vector)
{
    return atan(vector.dy / vector.dx);
}

CG_INLINE CGFloat
CGVectorDotProduct(CGVector vector1, CGVector vector2)
{
    return (vector1.dx * vector2.dx) + (vector1.dy * vector2.dy);
}

CG_INLINE CGFloat
CGVectorMagnitude(CGVector vector)
{
    return hypotf(vector.dx, vector.dy);
}

CG_INLINE NSString*
NSStringFromCGVector(CGVector vector)
{
    return [NSString stringWithFormat:@"{%f, %f}", vector.dx, vector.dy];
}

CG_INLINE bool
__CGVectorEqualToVector(CGVector vector1, CGVector vector2)
{
    return vector1.dx == vector2.dx && vector1.dy == vector2.dy;
}
#define CGVectorEqualToVector __CGVectorEqualToVector

CG_INLINE bool
__CGVectorPerpendicularToVector(CGVector vector1, CGVector vector2)
{
    return CGVectorDotProduct(vector1, vector2) == 0;
}
#define CGVectorPerpendicularToVector __CGVectorPerpendicularToVector
#define CGVectorOrthogonalToVector __CGVectorPerpendicularToVector
