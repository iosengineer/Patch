//
//  MGIndexMappedDataSource.m
//  Mytograph
//
//  Created by Adam Iredale on 13/02/2015.
//  Copyright (c) 2015 Bionic Monocle Pty Ltd. All rights reserved.
//

#import "MGIndexMappedDataSource.h"

#pragma mark - CocoaLumberjack

static const int ddLogLevel = DDLogLevelDefault;

@implementation MGIndexMappedDataSource

- (NSInteger)forwardMappedIndexFromIndex:(NSInteger)index
{
    NSInteger forwardMappedIndex = index;
    if (_forwardIndexMapBlock)
    {
        forwardMappedIndex = _forwardIndexMapBlock(index);
    }
    DDLogVerbose(@"Mapped index %ld -> %ld", (long)index, (long)forwardMappedIndex);
    return forwardMappedIndex;
}

- (NSInteger)reverseMappedIndexFromIndex:(NSInteger)index
{
    NSInteger reverseMappedIndex = index;
    if (_reverseIndexMapBlock)
    {
        reverseMappedIndex = _reverseIndexMapBlock(index);
    }
    DDLogVerbose(@"Mapped index %ld <- %ld", (long)reverseMappedIndex, (long)index);
    return reverseMappedIndex;
}

- (NSInteger)forwardMappedSectionFromSection:(NSInteger)section
{
    NSInteger forwardMappedSection = section;
    if (_forwardSectionMapBlock)
    {
        forwardMappedSection = _forwardSectionMapBlock(section);
    }
    DDLogVerbose(@"Mapped section %ld -> %ld", (long)section, (long)forwardMappedSection);
    return forwardMappedSection;
}

- (NSInteger)reverseMappedSectionFromSection:(NSInteger)section
{
    NSInteger reverseMappedSection = section;
    if (_reverseSectionMapBlock)
    {
        reverseMappedSection = _reverseSectionMapBlock(section);
    }
    DDLogVerbose(@"Mapped section %ld <- %ld", (long)reverseMappedSection, (long)section);
    return reverseMappedSection;
}

- (NSIndexPath *)forwardMappedIndexPathFromIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *forwardMappedIndexPath = indexPath;
    if (_forwardIndexPathMapBlock)
    {
        forwardMappedIndexPath = _forwardIndexPathMapBlock(indexPath);
    }
    DDLogVerbose(@"Mapped indexPath %@ -> %@", indexPath, forwardMappedIndexPath);
    return forwardMappedIndexPath;
}

- (NSIndexPath *)reverseMappedIndexPathFromIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *reverseMappedIndexPath = indexPath;
    if (_reverseIndexPathMapBlock)
    {
        reverseMappedIndexPath = _reverseIndexPathMapBlock(indexPath);
    }
    DDLogVerbose(@"Mapped indexPath %@ <- %@", reverseMappedIndexPath, indexPath);
    return reverseMappedIndexPath;
}

#pragma mark - MGDataSource

- (id)itemAtIndex:(NSInteger)index
{
    return [self.dataSource itemAtIndex:[self forwardMappedIndexFromIndex:index]];
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.dataSource itemAtIndexPath:[self forwardMappedIndexPathFromIndexPath:indexPath]];
}

- (NSUInteger)numberOfItemsInSection:(NSInteger)section
{
    return [self.dataSource numberOfItemsInSection:[self forwardMappedSectionFromSection:section]];
}

#pragma mark - MGDataSourceChangeListener

- (void)dataSource:(id<MGDataSource>)dataSource didInsertItemAtIndexPath:(NSIndexPath *)indexPath
{
    [super dataSource:self didInsertItemAtIndexPath:[self reverseMappedIndexPathFromIndexPath:indexPath]];
}

- (void)dataSource:(id<MGDataSource>)dataSource didUpdateItemAtIndexPath:(NSIndexPath *)indexPath
{
    [super dataSource:self didUpdateItemAtIndexPath:[self reverseMappedIndexPathFromIndexPath:indexPath]];
}

- (void)dataSource:(id<MGDataSource>)dataSource didRemoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    [super dataSource:self didRemoveItemAtIndexPath:[self reverseMappedIndexPathFromIndexPath:indexPath]];
}

- (void)dataSource:(id<MGDataSource>)dataSource didInsertSectionAtIndex:(NSInteger)index
{
    // TODO
}

- (void)dataSource:(id<MGDataSource>)dataSource didUpdateSectionAtIndex:(NSInteger)index
{
    // TODO
}

- (void)dataSource:(id<MGDataSource>)dataSource didRemoveSectionAtIndex:(NSInteger)index
{
    // TODO
}

@end