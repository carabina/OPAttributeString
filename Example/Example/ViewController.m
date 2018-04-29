//
//  ViewController.m
//  Example
//
//  Created by ooops on 2018/4/27.
//  Copyright © 2018年 张强. All rights reserved.
//

#import "ViewController.h"
#import <OPAttributeString.h>
#import "DemoTableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView           *tableView;
@property(nonatomic, strong) NSArray<NSString *>    *titleArray;
@property(nonatomic, strong) UILabel                *demoLabel;

@end
NSString *CellID = @"CellID";
NSString *demoString = @"demo";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleArray = @[
                    @"常见金额整数小数设置",
                    @"首行 段落 缩进",
                    @"吟诗一首",
                    @"插入一张图片-图文混排",
                    @"你看到我的影子了么?",
                    @"文字凸出效果",
                    @"基线偏移 + 文字倾斜 + 拉伸",
                    @"文字书写方向",
                    @"后面追加字符串-属性字符串-图片"
                    ];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.demoLabel];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    cell.textLabel.text = _titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self selectedDemoAtIndex:indexPath.row];
}

- (void)selectedDemoAtIndex:(NSInteger)index {
    
    switch (index) {
        case 0: {
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"e"];
            [string addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 1)];
            
            NSString *despicableMe = @"1999.02";
            self.demoLabel.attributedText = [despicableMe make_Attribute:^(OPAttribute *make) {
                make.pattern(@".")
                .font([UIFont systemFontOfSize:20])
                .textColor([UIColor blueColor])
                .to(despicableMe.length - 3)
                .font([UIFont systemFontOfSize:18])
                .textColor([UIColor orangeColor])
                .from(despicableMe.length - 2)
                .font([UIFont systemFontOfSize:12])
                .textColor([UIColor redColor]);
            }];
            [self setRectWithFontSize:20 offset:CGPointMake(10, 0)];
        }
            break;
        case 1: {
            NSString *despicableMe = @"浅酒人前共,软玉灯边拥,回眸入抱总含情,痛痛痛,轻把郎推,渐闻声颤,微惊红涌,试与更番纵,全没些儿缝,这回风味忒颠犯,动动动,臂儿相兜,唇儿相凑,舌儿相弄.";
            self.demoLabel.attributedText = [despicableMe make_Attribute:^(OPAttribute *make) {
                make.firstLineHeadIndent(40);
                make.headIndent(20);
            }];
            
//            self.demoLabel.attributedText = despicableMe
//            .font([UIFont fontWithName:@"Courier New" size:12])
//            .textColor([UIColor redColor])
//            .backgroundColor([UIColor greenColor])
//            .append(@"append")
//            .textColor([UIColor lightGrayColor])
//            .append(@"AA").string;
            [self setRectWithFontSize:20 offset:CGPointMake(10, 10)];
        }
            break;
        case 2: {
            NSString *despicableMe = @"骚气(离骚还远)\n浅酒人前共,\n软玉灯边拥,\n回眸入抱总含情,\n痛痛痛,\n轻把郎推,\n渐闻声颤,\n微惊红涌,\n试与更番纵,\n全没些儿缝,\n这回风味忒颠犯,\n动动动,\n臂儿相兜,\n唇儿相凑,\n舌儿相弄.";
            self.demoLabel.attributedText = [despicableMe make_Attribute:^(OPAttribute *make) {
                
                make.pattern(@"骚气")
                .font([UIFont systemFontOfSize:20])
                .textColor([UIColor blackColor])
                .strikethroughColor([UIColor redColor])
                .strikethroughStyle(NSUnderlineStyleSingle);
                make
                .from(2)
                .font([UIFont systemFontOfSize:12])
                .strokeColor([UIColor orangeColor])
                .strokeWidth(2)
                .lineSpacing(2)
                .kern(3);
                make.pattern(@"离骚还远")
                .underlineColor([UIColor greenColor])
                .underlineStyle(NSUnderlineStyleSingle | NSUnderlinePatternDashDot)
                .offset(6);
            }];
            [self setRectWithFontSize:20 offset:CGPointMake(10, 10)];
        }
            break;
        case 3: {
            NSString *despicableMe = @"老司机";
            self.demoLabel.attributedText = [despicableMe make_Attribute:^(OPAttribute *make) {
                make.insert(@"\n");
                UIImage *ima = [UIImage imageNamed:@"old_sj"];
                make.insert(ima, 10000, CGRectMake(0, 0, 18, 18), AttachmentAlignmentNormal);
            }];
            [self setRectWithFontSize:20 offset:CGPointMake(10, 20)];
        }
            break;
        case 4: {
            self.demoLabel.attributedText = [self.titleArray[4] make_Attribute:^(OPAttribute *make) {
                make.shadow([UIColor greenColor], CGSizeMake(1, 1), 1);
            }];
            [self setRectWithFontSize:17];
        }
            break;
            
        case 5: {
            self.demoLabel.attributedText = [self.titleArray[5] make_Attribute:^(OPAttribute *make) {
                make.textEffectLetterPress(NSTextEffectLetterpressStyle);
            }];
            [self setRectWithFontSize:17];
        }
            break;
        case 6: {
            self.demoLabel.attributedText = [self.titleArray[6] make_Attribute:^(OPAttribute *make) {
                make.to(2).offset(5);
                make.pattern(@"倾斜").oblique(0.5);
                make.pattern(@"拉伸").expand(0.5).link(@"http://www.baidu.com");
            }];
            [self setRectWithFontSize:17 offset:CGPointMake(80, 0)];
        }
            break;
        case 7: {
            self.demoLabel.attributedText = [self.titleArray[7] make_Attribute:^(OPAttribute *make) {
                make.writingDirection(NSWritingDirectionRightToLeft | NSWritingDirectionOverride);
            }];
            [self setRectWithFontSize:17 offset:CGPointMake(80, 0)];
        }
            break;
        case 8: {
            NSMutableAttributedString *attributeString = @"e".backgroundColor([UIColor redColor]).string;
            
            UIImage *img = [UIImage imageNamed:@"old_sj"];
            
            self.demoLabel.attributedText = @"".append(@"_append")
            .append(attributeString)
            .append(@"\r\n")
            .append(img,CGRectMake(0, 0, 18, 18),AttachmentAlignmentNormal).string;
            [self setRectWithFontSize:20];
        }
            break;
            
        default:
            break;
    }
    self.demoLabel.center = CGPointMake(self.view.center.x, 160);
}

- (void)setRectWithFontSize:(CGFloat)fontSize {
    [self setRectWithFontSize:fontSize offset:CGPointZero];
}

- (void)setRectWithFontSize:(CGFloat)fontSize offset:(CGPoint)offset {
    NSString *string = [self.demoLabel.text stringByReplacingOccurrencesOfString:@"\\n" withString:@"\r\n"];
    CGSize size = [self sizeWithwidth:[UIScreen mainScreen].bounds.size.width string:string fontSize:fontSize];
    CGRect rect = self.demoLabel.frame;
    rect.size.width = size.width + offset.x;
    rect.size.height = size.height + offset.y;
    self.demoLabel.frame = rect;
}


- (CGSize)sizeWithwidth:(CGFloat)width string:(NSString *)string fontSize:(CGFloat)fontSize {
    CGSize size = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:(NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]} context:nil].size;
    //[string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:(NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin) context:nil];
    return size;
}


- (UITableView *)tableView {
    if (_tableView) return _tableView;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 400, [UIScreen mainScreen].bounds.size.width, 400)
                                              style:UITableViewStylePlain];
    [_tableView registerClass:[DemoTableViewCell class] forCellReuseIdentifier:CellID];
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, CGFLOAT_MIN)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    return _tableView;
}

- (UILabel *)demoLabel {
    if (_demoLabel) return _demoLabel;
    _demoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 200)];
    //_demoLabel.backgroundColor = [UIColor lightGrayColor];
    _demoLabel.numberOfLines = 0;
    _demoLabel.lineBreakMode = NSLineBreakByWordWrapping;
//    [_demoLabel sizeToFit];
    _demoLabel.textAlignment = NSTextAlignmentCenter;
    return _demoLabel;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
