//
//  XFSettingAssistImageCell.m
//  XFSettingsExample
//
//  Created by 付星 on 15/9/2.
//  Copyright (c) 2015年 Yizzuide. All rights reserved.
//

#import "XFSettingAssistImageCell.h"
#import "XFSettingArrowItem.h"
#import "XFSettingAssistImageItem.h"

@implementation XFSettingAssistImageCell

- (UIImageView *)assistImageView{
    if (_assistImageView == nil) {
        UIImageView *assistImageView= [[UIImageView alloc] init];
        //        label.backgroundColor = [UIColor grayColor];
        assistImageView.bounds = CGRectMake(0, 0, 32, 32);
        assistImageView.contentMode = UIViewContentModeCenter;
        
        [self.contentView addSubview:assistImageView];
        _assistImageView = assistImageView;
    }
    return _assistImageView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect detailFrame = self.detailTextLabel.frame;
    detailFrame.origin.x = CGRectGetMaxX(self.textLabel.frame)  + 5;
    self.detailTextLabel.frame = detailFrame;
    
    XFSettingArrowItem *item = (XFSettingArrowItem *)self.item;
    CGRect assistImageFrame = self.assistImageView.frame;
    if (item.destVCClass) {
        assistImageFrame.origin.x = self.contentView.frame.size.width - assistImageFrame.size.width;
    }else{
        assistImageFrame.origin.x = self.contentView.frame.size.width - assistImageFrame.size.width - 10;
    }
    assistImageFrame.origin.y = (self.contentView.frame.size.height - assistImageFrame.size.height) * 0.5;
    self.assistImageView.frame = assistImageFrame;
}

+ (NSString *)settingCellReuseIdentifierString
{
    return @"settingAssistImage-cell";
}
- (void)setItem:(XFSettingItem *)item
{
    [super setItem:item];
    
    XFSettingAssistImageItem *assistImageItem = (XFSettingAssistImageItem *)item;
    
    self.detailTextLabel.font = [UIFont systemFontOfSize:12];
    self.detailTextLabel.text = assistImageItem.detailText;
    self.detailTextLabel.textAlignment = NSTextAlignmentLeft;
    
    self.assistImageView.image = [UIImage imageNamed:assistImageItem.assistImageName];
}


@end