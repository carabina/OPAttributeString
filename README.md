# OPAttributeString

[![CI Status](http://img.shields.io/travis/urm9ril/OPAttributeString.svg?style=flat)](https://travis-ci.org/urm9ril/OPAttributeString)
[![Version](https://img.shields.io/cocoapods/v/OPAttributeString.svg?style=flat)](http://cocoapods.org/pods/OPAttributeString)
[![License](https://img.shields.io/cocoapods/l/OPAttributeString.svg?style=flat)](http://cocoapods.org/pods/OPAttributeString)
[![Platform](https://img.shields.io/cocoapods/p/OPAttributeString.svg?style=flat)](http://cocoapods.org/pods/OPAttributeString)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* iOS 8.0 or later
* Xcode 7.3 or later

## Getting Started

OPAttributeString is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'OPAttributeString'
```

## How To Use

* Objective-C
``` objective-c
NSString *despicableMe = @"I know someone whoabccan fix that for you.";      
self.someLabel.attributedText = [despicableMe make_Attribute:^(OPAttribute *make) {
    make.font([UIFont fontWithName:@"Courier New" size:12]);
    make.textColor([UIColor redColor]);
    make.backgroundColor([UIColor greenColor]);
}];
```
or you can write like this.
``` objective-c
NSString *despicableMe = @"I know someone whoabccan fix that for you.";      
self.someLabel.attributedText = [despicableMe make_Attribute:^(OPAttribute *make) {
    make.font([UIFont fontWithName:@"Courier New" size:12])
    .textColor([UIColor redColor])
    .backgroundColor([UIColor greenColor]);
}];
```
or this minimalist writing 
```objective-c
NSString *despicableMe = @"I know someone whoabccan fix that for you.";
self.someLabel.attributedText = despicableMe.
font([UIFont fontWithName:@"Courier New" size:12])
.textColor([UIColor redColor])
.backgroundColor([UIColor greenColor])
.string;
```
now you can see it.

![Alt 20180426.png](https://github.com/urm9ril/Material/blob/master/OPAttributeString/20180426.png?raw=true)

## But most of the time , you want set a part attribute of string. there is some API can use.

#### from(index)

If the index parameter exceeds the string range, the correction processing rules are as follows:

(index < 0 || index > string.length) ? 0 : index;

``` objective-c
NSString *despicableMe = @"I know someone whoabccan fix that for you.";      
self.someLabel.attributedText = [despicableMe make_Attribute:^(OPAttribute *make) {
    make.from(0).font([UIFont systemFontOfSize:10]);
}];
```
![Alt 20180426_1.png](https://github.com/urm9ril/Material/blob/master/OPAttributeString/20180426_1.png?raw=true)

#### to(index)

the correction processing rules are as follows:

(index < 0 || index > string.length) ? string.length : index;


``` objective-c
NSString *despicableMe = @"I know someone whoabccan fix that for you.";      
self.someLabel.attributedText = [despicableMe make_Attribute:^(OPAttribute *make) {
    make.font([UIFont systemFontOfSize:10]);
    make.to(5).font([UIFont systemFontOfSize:17]);
}];
```
![Alt 20180426_2.png](https://github.com/urm9ril/Material/blob/master/OPAttributeString/20180426_2.png?raw=true)

#### fromTo(location,length)
the correction processing rules are as follows

location rules: same with from(index).

length rules: same with to(index).

``` objective-c
NSString *despicableMe = @"I know someone whoabccan fix that for you.";      
self.someLabel.attributedText = [despicableMe make_Attribute:^(OPAttribute *make) {
    make.font([UIFont systemFontOfSize:10]);
    make.to(5).font([UIFont systemFontOfSize:17]);
    make.fromTo(8,12).backgroundColor([UIColor orangeColor]);
}];
```
![Alt 20180426_3.png](https://github.com/urm9ril/Material/blob/master/OPAttributeString/20180426_3.png?raw=true)


#### range(NSRange)

use it like fromTo(location,length)
``` objective-c
NSString *despicableMe = @"I know someone whoabccan fix that for you.";      
self.someLabel.attributedText = [despicableMe make_Attribute:^(OPAttribute *make) {
    make.font([UIFont systemFontOfSize:10]);
    make.to(5).font([UIFont systemFontOfSize:17]);
    make.range(NSMakeRange(0,10)).backgroundColor([UIColor orangeColor]);
}];
```
![Alt 20180426_4.png](https://github.com/urm9ril/Material/blob/master/OPAttributeString/20180426_4.png?raw=true)

###### the correction processing rules are as follows
```objective-c
NS_INLINE BOOL rangeCheck(NSRange range, NSRange rangeContainer) {
    if(range.location < 0 || rangeContainer.location < 0 || rangeContainer.location > range.length) return false;
    return range.location <= rangeContainer.location && range.length >= rangeContainer.length;
}
```

#### rangeOf(somestring)

Use this function to find the range of characters or strings.
``` objective-c
NSString *despicableMe = @"I know someone whoabccan fix that for you.";      
self.someLabel.attributedText = [despicableMe make_Attribute:^(OPAttribute *make) {
    make.rangeOf(@"fix").strokeColor([UIColor blueColor]).strokeWidth(3);
}];
```
![Alt 20180426_5.png](https://github.com/urm9ril/Material/blob/master/OPAttributeString/20180426_5.png?raw=true)

#### insert(...)
this is a multi-parameter function, roughly as follows:

`first case: insert a string to source string`
```objective-c
NSString *despicableMe = @"I know someone whoabccan fix that for you.";
self.someLabel.attributedText = [despicableMe make_Attribute:^(OPAttribute *make) {
    // default insert a string to the end of source string
    make.insert(@"\n");
    // or you can specified a string and index to insert
    // the index parameter has rules same way to(index) used
    // so -1 means 'ooops' will be inserted to the end
    make.insert(@"ooops",-1);
}];
```
![Alt 20180426_6.png](https://github.com/urm9ril/Material/blob/master/OPAttributeString/20180426_6.png?raw=true)
`second case: insert a NSAttributedString to source string`
```objective-c
NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"e"];
[string addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 1)];

NSString *despicableMe = @"I know someone whoabccan fix that for you.";

self.someLabel.attributedText = [despicableMe make_Attribute:^(OPAttribute *make) {
    make.insert(string);
    make.insert(string,-1);
}];
```
![Alt 20180426_7.png](https://github.com/urm9ril/Material/blob/master/OPAttributeString/20180426_7.png?raw=true)

let us change the diffrent index paramters.
```objective-c
make.insert(string,0);
make.insert(string,-1);
```
then will display like this
![Alt 20180426_8.png](https://github.com/urm9ril/Material/blob/master/OPAttributeString/20180426_8.png?raw=true)

`third case: insert a UIImage to source string`
```objective-c
NSString *despicableMe = @"I know someone whoabccan fix that for you.";
            
self.demoLabel.attributedText = [despicableMe make_Attribute:^(OPAttribute *make) {
    UIImage *img = [UIImage imageNamed:@"old_sj"];
    make.insert(img, 0, CGRectMake(0, 0, 18, 18), AttachmentAlignmentNormal);
}];
```
![Alt 20180426_9.png](https://github.com/urm9ril/Material/blob/master/OPAttributeString/20180426_9.png?raw=true)

#### append(...)
you can use it like insert(...), the difference between inserting and appending, appending always adding characters or strings to the end of the source string.
```objective-c
NSMutableAttributedString *attributeString = @"e".backgroundColor([UIColor redColor]).string;

UIImage *img = [UIImage imageNamed:@"old_sj"];

self.demoLabel.attributedText = @"".append(@"_append")
.append(attributeString)
.append(@"\r\n")
.append(img,CGRectMake(0, 0, 18, 18),AttachmentAlignmentNormal).string;
```
![Alt 20180426_17.png](https://github.com/urm9ril/Material/blob/master/OPAttributeString/20180426_17.png?raw=true)

#### regex pattern
```objective-c
NSString *despicableMe = @"I know someone whoabccan fix that for you.";
            
self.demoLabel.attributedText = [despicableMe make_Attribute:^(OPAttribute *make) {
    make.pattern(@"o").strokeColor([UIColor redColor]).strokeWidth(-5);
}];
```
![Alt 20180426_10.png](https://github.com/urm9ril/Material/blob/master/OPAttributeString/20180426_10.png?raw=true)

`remove some char or string from source string, you can do it like by this way.`
```ojective-c
NSString *despicableMe = @"I know someone whoabccan fix that for you.";
            
self.demoLabel.attributedText = [despicableMe make_Attribute:^(OPAttribute *make) {
    // remove all char 'o' from source string.
    // defalut matching hole source string.
    make.removeE(@[@"o"]);
    // specified range
    make.removeE(@[@"o"],, NSMakeRange(0, 10));
    // mult-matching and specified range.
    make.removeE(@[@"e",@"o"], NSMakeRange(0, 10));
}];
```
![Alt 20180426_11.png](https://github.com/urm9ril/Material/blob/master/OPAttributeString/20180426_11.png?raw=true)
![Alt 20180426_12.png](https://github.com/urm9ril/Material/blob/master/OPAttributeString/20180426_12.png?raw=true)

replace some char or string from source string, you can do it like by this way.
range rule: rangeCheck c function
```ojective-c
NSString *despicableMe = @"I know someone whoabccan fix that for you.";
            
self.demoLabel.attributedText = [despicableMe make_Attribute:^(OPAttribute *make) {
    // matching the hole source string
    make.replace(@"o",@"O");
    // matching the hole source string in range
    make.replace(@"o",@"O",NSMakeRange(0, 8));
    // mult-matching the hole string with dictionary
    // dictionary's key will matching.
    // the dictionary key's matching value will be replaced by dictionary's value.
    // defalut matching hole source string.
    make.replaceE(@[@{@"e" : @"o"},@{@"y" : @"Y"}]);
    // in the same way ... in range
    make.replaceE(@[@{@"o" : @"0"},@{@"n" : @"u"}],NSMakeRange(0, 8));
}];
```
![Alt 20180426_13.png](https://github.com/urm9ril/Material/blob/master/OPAttributeString/20180426_13.png?raw=true)
![Alt 20180426_14.png](https://github.com/urm9ril/Material/blob/master/OPAttributeString/20180426_14.png?raw=true)
![Alt 20180426_15.png](https://github.com/urm9ril/Material/blob/master/OPAttributeString/20180426_15.png?raw=true)
![Alt 20180426_16.png](https://github.com/urm9ril/Material/blob/master/OPAttributeString/20180426_16.png?raw=true)

## Author

urm9ril, 348043793@qq.com

## License

All source code is licensed under the [MIT License](https://raw.githubusercontent.com/urm9ril/OPAttributeString/master/LICENSE).
