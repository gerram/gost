//
//  GERDetailSiteViewController.m
//  gost
//
//  Created by George Malushkin on 21/07/16.
//  Copyright © 2016 George Malushkin. All rights reserved.
//

#import "GERDetailSiteViewController.h"
#import <WebKit/WebKit.h>

@interface GERDetailSiteViewController () <UIWebViewDelegate, WKNavigationDelegate>
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) WKWebView *webViewWK;
@property (nonatomic, copy) NSString *siteName;
@property (nonatomic, copy) NSString *siteUrl;
@end

@implementation GERDetailSiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // UIWebView or MKWebView
    if (SYSTEM_VERSION_LESS_THAN(@"8.0"))
    {
        self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        self.webView.scalesPageToFit = YES;
        [self.webView setTranslatesAutoresizingMaskIntoConstraints: NO];
        self.webView.delegate = self;
        // Fast scrolling
        self.webView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
        
        [self.view addSubview:self.webView];
        
        self.webView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    else
    {
        self.webViewWK = [[WKWebView alloc] initWithFrame:self.view.bounds];
        self.webViewWK.navigationDelegate = self;
        
        [self.view addSubview:self.webViewWK];
        
        self.webViewWK.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self updateUI];
}

- (void)updateUI
{
    if (self.siteName.length > 0)
    {
        self.title = self.siteName;
    }
    else
    {
        self.title = @"Without name";
    }
    
    NSURLRequest *request = nil;
    if (self.siteUrl != nil)
    {
        request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.siteUrl]];
    }
    else
    {
        request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://render.ru"]];
    }
    
    if (self.webViewWK != nil)
    {
        [self.webViewWK loadRequest:request];
    }
    else
    {
        [self.webView loadRequest:request];
    }
}

- (void)setupWithURL:(NSString *)siteUrl siteName:(NSString *)siteName
{
    self.siteName = siteName;
    self.siteUrl = siteUrl;
}

@end
