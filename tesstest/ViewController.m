//
//  ViewController.m
//  tesstest
//
//  Created by 袴田彰礼 on 2014/05/05.
//  Copyright (c) 2014年 袴田彰礼. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // language are used for recognition. Ex: eng. Tesseract will search for a eng.traineddata file in the dataPath directory; eng+ita will search for a eng.traineddata and ita.traineddata.
    
    //Like in the Template Framework Project:
    // Assumed that .traineddata files are in your "tessdata" folder and the folder is in the root of the project.
    // Assumed, that you added a folder references "tessdata" into your xCode project tree, with the ‘Create folder references for any added folders’ options set up in the «Add files to project» dialog.
    // Assumed that any .traineddata files is in the tessdata folder, like in the Template Framework Project
    
    //Create your tesseract using the initWithLanguage method:
    // Tesseract* tesseract = [[Tesseract alloc] initWithLanguage:@"eng+ita"];
    
    // set up the delegate to recieve tesseract's callback
    // self should respond to TesseractDelegate and implement shouldCancelImageRecognitionForTesseract: method
    // to have an ability to recieve callback and interrupt Tesseract before it finishes
    
    Tesseract* tesseract = [[Tesseract alloc] initWithLanguage:@"eng+ita"];
    tesseract.delegate = self;
    NSLog("test");
    
    [tesseract setVariableValue:@"0123456789" forKey:@"tessedit_char_whitelist"]; //limit search
    [tesseract setImage:[UIImage imageNamed:@"image_sample.jpg"]]; //image to check
    [tesseract recognize];
    
    NSLog(@"%@", [tesseract recognizedText]);
    
    tesseract = nil; //deallocate and free all memory
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
