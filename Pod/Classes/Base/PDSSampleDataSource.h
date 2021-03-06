//
//  PDSSampleDataSource.h
//  Patch
//
//  Created by Adam Iredale on 13/02/2015.
//  Copyright (c) 2015 Bionic Monocle Pty Ltd. All rights reserved.
//

#import "PDSIndexMappedDataSource.h"

/**
 *  Allows setting of a maximum count such that data returned is an averaged subset of
 *  available data.
 */

@interface PDSSampleDataSource : PDSIndexMappedDataSource
/**
 *  By default, the sample count is 0, which is the same as setting the sample count
 *  to the number of available data items.
 */
@property (nonatomic, assign) NSUInteger maximumCount;

@end

#ifndef PDS_SampleMappingMacro
#define PDS_SampleMappingMacro

/**
 *  @name Macro for index-mapping (hopefully temporary)
 */
static inline double PDSIndexMappingDelta(NSInteger fromMaxIndex, NSInteger toMaxIndex)
{
    if (fromMaxIndex <= 0 || toMaxIndex <= 0)
    {
        return 1;
    }
    else
    {
        return (double)fromMaxIndex / (double)toMaxIndex;
    }
}

#endif