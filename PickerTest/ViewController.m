//
//  ViewController.m
//  PickerTest
//
//  Created by Lombardo on 08/11/13.
//  Copyright (c) 2013 Lombardo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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

- (IBAction)showPicker:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    // willMove called by addChild
    [self addChildViewController:picker];
    picker.view.frame = self.pickerView.bounds;
    picker.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.pickerView addSubview:picker.view];
    [picker didMoveToParentViewController:self];
    
    
    
    //[self presentViewController:picker animated:YES completion:nil];
    
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker willMoveToParentViewController:nil];
    [picker.view removeFromSuperview];
    // call automatically didMoveToParentViewController nil
    [picker removeFromParentViewController];
    
}
@end
