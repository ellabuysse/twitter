//
//  ComposeViewController.m
//  twitter
//
//  Created by ellabuysse on 6/21/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"

@interface ComposeViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) NSString *userInput;
@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView.delegate = self;
    
    
    self.textView.layer.cornerRadius = 15;
    self.textView.layer.borderWidth = 1.0;
    self.textView.layer.borderColor = UIColor.blackColor.CGColor;
    self.textView.textContainerInset = UIEdgeInsetsMake(15, 15, 15, 15);

    // Do any additional setup after loading the view.
}

- (IBAction)close:(id)sender {
    [self.navigationController popViewControllerAnimated:(true)];
}

- (IBAction)postTweet:(id)sender{
    NSString *userInput = [self.textView text];
        
    [[APIManager shared]postStatusWithText:userInput completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error composing Tweet: %@", error.localizedDescription);
        }
        else{
            //[self.delegate didTweet:tweet];
            [self.navigationController popViewControllerAnimated:(true)];
            NSLog(@"Compose Tweet Success!");
        }
    }];
}


//- (void)textViewDidChange:(UITextView *)textView {

    //self.userInput = textView.text;
    //NSLog(@"userInput %@", self.userInput); //Just an example to show the variable updating
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
