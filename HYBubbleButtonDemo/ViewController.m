//
//  ViewController.m
//  HYBubbleButtonDemo
//
//  Created by nathan on 15/7/5.
//  Copyright (c) 2015年 nathan. All rights reserved.
//

#import "ViewController.h"
#import "HYBubbleButton.h"

@interface ViewController (){
    NSTimer *_timer;
}

@property (weak, nonatomic) IBOutlet HYBubbleButton *bubbleButton;
@property (weak, nonatomic) IBOutlet HYBubbleButton *testButton;

- (IBAction)startGenerate:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.bubbleButton.maxLeft = 70;
    self.bubbleButton.maxRight = 120;
    self.bubbleButton.maxHeight = 320;
    self.bubbleButton.duration = 3;
    self.bubbleButton.images = @[[UIImage imageNamed:@"heart3"]];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(btnLong:)];
    longPress.minimumPressDuration = .5;
    [self.bubbleButton addGestureRecognizer:longPress];
}

- (IBAction)startGenerate:(id)sender
{
    [self heartSets];
}

- (void)heartSets
{
    [self buttonHeart];
    [self buttonHeart];
    [self buttonHeart];
}

- (void)buttonHeart
{
    [self.bubbleButton generateBubbleInRandom];
}

- (void)btnLong:(UILongPressGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan) {
        _timer = [NSTimer timerWithTimeInterval:.2 target:self selector:@selector(heartSets) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
    } else if ([gestureRecognizer state] == UIGestureRecognizerStateEnded){
        [_timer invalidate];
    }
}

@end
