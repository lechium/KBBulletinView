//
//  KBViewController.m
//  KBBulletinView
//
//  Created by lechium on 02/01/2022.
//  Copyright (c) 2022 lechium. All rights reserved.
//

#import "KBViewController.h"
#import <KBBulletinView/KBBulletinView.h>

@interface KBViewController ()

@end

@implementation KBViewController

- (IBAction)showSampleBulletin:(id)sender {
    KBBulletinView *bv = [KBBulletinView bulletinWithTitle:@"Controller with a really long title" description:@"Connected with a long and hopefully wrapping description." image:[[UIImage imageNamed:@"gamecontroller"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [bv showForTime:5];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
