CGVector-Awesome
================

Additions to CoreGraphics CGVector, most useful with Apple's SpriteKit

Methods
```
/* Create a vector from the given point */
CG_INLINE CGVector CGVectorFromPoint(CGPoint pt);

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

/* Calculate the angle of `vector` for use with a SpriteKit zRotation property */
CG_INLINE CGFloat CGVectorAngleSK(CGVector vector);

/* Calculate the dot product of two vectors */
CG_INLINE CGFloat CGVectorDotProduct(CGVector vector1, CGVector vector2);

/* Calculate the magnitude (length) of a vector */
CG_INLINE CGFloat CGVectorLength(CGVector vector);

/* Calculate the distance between two vectors */
CG_INLINE CGFloat CGVectorDistance(CGVector vectorStart, CGVector vectorEnd);

/* Determine if two vectors are equal */
CG_INLINE bool __CGVectorEqualToVector(CGVector vector1, CGVector vector2);

/* Determine if two vectors are perpendicular */
CG_INLINE bool __CGVectorPerpendicularToVector(CGVector vector1, CGVector vector2);
```

# zLib License

Copyright (c) 2014 Sam Green

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must not
   claim that you wrote the original software. If you use this software
   in a product, an acknowledgement in the product documentation would be
   appreciated but is not required.
2. Altered source versions must be plainly marked as such, and must not be
   misrepresented as being the original software.
3. This notice may not be removed or altered from any source distribution.
