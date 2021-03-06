//
//  PDSDataSourceChangeListener.m
//  Patch
//
//  Created by Adam Iredale on 5/12/2014.
//  Copyright (c) 2014 Bionic Monocle Pty Ltd. All rights reserved.
//

#import "PDSDataSourceChangeListener.h"

@implementation PDSDataSourceChangeListener

#pragma mark - Init

- (instancetype)init
{
    // Always fails - please use designated init
    self = [self initWithDataSource:nil];
    if (self)
    {
        
    }
    return self;
}

- (instancetype)initWithDataSource:(id<PDSChangingDataSource>)dataSource
{
    NSParameterAssert(dataSource);
    self = [super init];
    if (self)
    {
        [dataSource.changeNotifier addChangeListener:self];
    }
    return self;
}

#pragma mark - PDSDataSourceChangeListener

- (void)dataSourceWillChange:(id<PDSDataSource>)dataSource
{
    if (_dataSourceWillChangeBlock)
    {
        _dataSourceWillChangeBlock(dataSource);
    }
}

- (void)dataSourceDidChange:(id<PDSDataSource>)dataSource
{
    if (_dataSourceDidChangeBlock)
    {
        _dataSourceDidChangeBlock(dataSource);
    }
}

- (void)dataSourceDidReload:(id<PDSDataSource>)dataSource
{
    if (_dataSourceDidReloadBlock)
    {
        _dataSourceDidReloadBlock(dataSource);
    }
}

- (void)dataSourceWillStartLoading:(id<PDSDataSource>)dataSource
{
    if (_dataSourceWillStartLoadingBlock)
    {
        _dataSourceWillStartLoadingBlock(dataSource);
    }
}

- (void)dataSourceDidStopLoading:(id<PDSDataSource>)dataSource error:(NSError *)error
{
    if (_dataSourceDidStopLoadingBlock)
    {
        _dataSourceDidStopLoadingBlock(dataSource, error);
    }
}

- (void)dataSource:(id<PDSDataSource>)dataSource didInsertItem:(id)item atIndexPath:(NSIndexPath *)indexPath
{
    if (_dataSourceDidInsertItemBlock)
    {
        _dataSourceDidInsertItemBlock(dataSource, item, indexPath);
    }
}

- (void)dataSource:(id<PDSDataSource>)dataSource didRemoveItem:(id)item atIndexPath:(NSIndexPath *)indexPath
{
    if (_dataSourceDidRemoveItemBlock)
    {
        _dataSourceDidRemoveItemBlock(dataSource, item, indexPath);
    }
}

- (void)dataSource:(id<PDSDataSource>)dataSource didUpdateItem:(id)item atIndexPath:(NSIndexPath *)indexPath
{
    if (_dataSourceDidUpdateItemBlock)
    {
        _dataSourceDidUpdateItemBlock(dataSource, item, indexPath);
    }
}

- (void)dataSource:(id<PDSDataSource>)dataSource didInsertSection:(id)sectionInfo atIndex:(NSInteger)index
{
    if(_dataSourceDidInsertSectionAtIndex)
    {
        _dataSourceDidInsertSectionAtIndex(dataSource,index);
    }
}

- (void)dataSource:(id<PDSDataSource>)dataSource didUpdateSection:(id)sectionInfo atIndex:(NSInteger)index
{
    if(_dataSourceDidUpdateSectionAtIndex)
    {
        _dataSourceDidUpdateSectionAtIndex(dataSource,index);
    }
}

- (void)dataSource:(id<PDSDataSource>)dataSource didRemoveSection:(id)sectionInfo atIndex:(NSInteger)index
{
    if(_dataSourceDidDeleteSectionAtIndex)
    {
        _dataSourceDidDeleteSectionAtIndex(dataSource,index);
    }
}

#pragma mark - Class Methods

+ (instancetype)listenerForDataSource:(id<PDSChangingDataSource>)dataSource
{
    PDSDataSourceChangeListener *listener = nil;
    @autoreleasepool
    {
        listener = [[PDSDataSourceChangeListener alloc] initWithDataSource:dataSource];
    }
    return listener;
}

@end
