//
//  KBBulletinView.m
//  Ethereal
//
//  Created by Kevin Bradley on 2/1/22.
//  Copyright © 2022 nito. All rights reserved.
//

#import "KBBulletinView.h"

@interface KBBulletinView() {
    NSString *_bulletinTitle;
    NSString *_bulletinDescription;
    UIImage *_bulletinImage;
}

@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UILabel *descriptionLabel;
@property (nonatomic) UIImageView *imageView;
@property (nonatomic) NSTimer *hideTimer;

@end

@implementation KBBulletinView

- (UIImage *)bulletinImage {
    return _bulletinImage;
}

- (void)setBulletinImage:(UIImage *)bulletinImage {
    _bulletinImage = bulletinImage;
    _imageView.image = _bulletinImage;
}

+ (instancetype)bulletinWithTitle:(NSString *)title description:(NSString *)desc image:(UIImage * _Nullable)image {
    return [[KBBulletinView alloc] initWithTitle:title description:desc image:image];
}

- (instancetype)initWithTitle:(NSString *)title description:(NSString *)desc image:(UIImage *_Nullable)image {
    self = [super init];
    if (self) {
        _bulletinTitle = title;
        _bulletinDescription = desc;
        _bulletinImage = image;
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.backgroundColor = [UIColor clearColor];
    UIView *backgroundView = [[UIView alloc] init];
    [self addSubview:backgroundView];
    CGRect titleBoundingRect = [_bulletinTitle boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 34) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleFootnote]} context:nil];
    CGRect descBoundingRect = [_bulletinDescription boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 34) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont preferredFontForTextStyle:UIFontTextStyleCaption2]} context:nil];
    CGFloat titleBoundingWidth = titleBoundingRect.size.width;
    CGFloat descBoundingWidth = descBoundingRect.size.width;
    CGFloat boundingWidth = MAX(titleBoundingWidth, descBoundingWidth);
    //add width of the image view, its left margin and our space from that to this value + our trailing value and see if its bigger than our size
    CGFloat imageDimension = 70;
    CGFloat imageLeading = 25;
    CGFloat stackLeading = 15;
    CGFloat stackTrailing = 45;
    CGFloat width = imageDimension + imageLeading + stackTrailing + boundingWidth + stackLeading + 5;
    width = MAX(355, width);
    width = MIN(660, width);
    self.translatesAutoresizingMaskIntoConstraints = false;
    [self.heightAnchor constraintEqualToConstant:130].active = true;
    [self.widthAnchor constraintEqualToConstant:width].active = true;
    //[self autoConstrainToSize:CGSizeMake(width, 130)];
    //[backgroundView autoPinEdgesToSuperviewEdges];
    backgroundView.translatesAutoresizingMaskIntoConstraints = false;
    [backgroundView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = true;
    [backgroundView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = true;
    [backgroundView.topAnchor constraintEqualToAnchor:self.topAnchor].active = true;
    [backgroundView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = true;
    backgroundView.layer.masksToBounds = true;
    backgroundView.layer.cornerRadius = 27;
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurView.translatesAutoresizingMaskIntoConstraints = false;
    UIVibrancyEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
    UIVisualEffectView *vibrancyEffectView = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect];
    vibrancyEffectView.translatesAutoresizingMaskIntoConstraints = false;
    [backgroundView addSubview:blurView];
    //[blurView autoPinEdgesToSuperviewEdges];
    [blurView.leadingAnchor constraintEqualToAnchor:backgroundView.leadingAnchor].active = true;
    [blurView.trailingAnchor constraintEqualToAnchor:backgroundView.trailingAnchor].active = true;
    [blurView.topAnchor constraintEqualToAnchor:backgroundView.topAnchor].active = true;
    [blurView.bottomAnchor constraintEqualToAnchor:backgroundView.bottomAnchor].active = true;
    [backgroundView addSubview:vibrancyEffectView];
    //[vibrancyEffectView autoPinEdgesToSuperviewEdges];
    [vibrancyEffectView.leadingAnchor constraintEqualToAnchor:backgroundView.leadingAnchor].active = true;
    [vibrancyEffectView.trailingAnchor constraintEqualToAnchor:backgroundView.trailingAnchor].active = true;
    [vibrancyEffectView.topAnchor constraintEqualToAnchor:backgroundView.topAnchor].active = true;
    [vibrancyEffectView.bottomAnchor constraintEqualToAnchor:backgroundView.bottomAnchor].active = true;
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.translatesAutoresizingMaskIntoConstraints = false;
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    _descriptionLabel = [[UILabel alloc] init];
    _descriptionLabel.translatesAutoresizingMaskIntoConstraints = false;
    _descriptionLabel.textColor = [UIColor whiteColor];
    _descriptionLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
    _descriptionLabel.textColor = [UIColor colorWithWhite:1 alpha:0.6];
    _descriptionLabel.numberOfLines = 2;
    _descriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
    UIStackView *_myStackView = [[UIStackView alloc] initWithArrangedSubviews:@[_titleLabel, _descriptionLabel]];
    _myStackView.axis = UILayoutConstraintAxisVertical;
    _myStackView.translatesAutoresizingMaskIntoConstraints = false;
    [backgroundView addSubview:_myStackView];
    [_myStackView.trailingAnchor constraintEqualToAnchor:backgroundView.trailingAnchor constant:-stackTrailing].active = true;
    _imageView = [[UIImageView alloc] init];
    _imageView.translatesAutoresizingMaskIntoConstraints = false;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.translatesAutoresizingMaskIntoConstraints = false;
    //[_imageView autoConstrainToSize:CGSizeMake(imageDimension, imageDimension)];
    [_imageView.heightAnchor constraintEqualToConstant:imageDimension].active = true;
    [_imageView.widthAnchor constraintEqualToConstant:imageDimension].active = true;
    [backgroundView addSubview:_imageView];
    [_myStackView.leftAnchor constraintEqualToAnchor:_imageView.rightAnchor constant:stackLeading].active = true;
    //[_imageView autoCenterVerticallyInSuperview];
    [_imageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = true;
    [_myStackView.centerYAnchor constraintEqualToAnchor:_imageView.centerYAnchor].active = true;
    [_imageView.leftAnchor constraintEqualToAnchor:backgroundView.leftAnchor constant:imageLeading].active = true;
    [self _populateData];
    
}

- (void)_populateData {
    _titleLabel.text = _bulletinTitle;
    _descriptionLabel.text = _bulletinDescription;
    _imageView.image = _bulletinImage;
}


- (void)hideView {
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0.0;
        self.transform = CGAffineTransformScale(self.transform, 0.01, 0.01);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)showForTime:(CGFloat)duration {
    UIViewController *viewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    if (viewController) {
        self.alpha = 0;
        self.transform = CGAffineTransformScale(self.transform, 0.01, 0.01);
        [viewController.view addSubview:self];
        [self.rightAnchor constraintEqualToAnchor:viewController.view.rightAnchor constant:-80].active = true;
        [self.topAnchor constraintEqualToAnchor:viewController.view.topAnchor constant:60].active = true;
        __weak __typeof(self) weakSelf = self;
        //@weakify(self);
        [UIView animateWithDuration:0.3 animations:^{
            weakSelf.alpha = 1.0;
            weakSelf.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            weakSelf.hideTimer = [NSTimer scheduledTimerWithTimeInterval:duration repeats:false block:^(NSTimer * _Nonnull timer) {
                [self hideView];
            }];
        }];
    }
}

@end