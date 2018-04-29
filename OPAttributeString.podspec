Pod::Spec.new do |s|
  s.name         = "OPAttributeString" # 项目名称
  s.version      = "0.0.1"        # 版本号 与 你仓库的 标签号 对应
  s.license      = "MIT"          # 开源证书
  s.summary      = "A Sample AttributeString Lib" # 项目简介

  s.homepage     = "https://github.com/urm9ril/OPAttributeString" # 你的主页
  s.source       = { :git => "https://github.com/urm9ril/OPAttributeString.git", :tag => "#{s.version}" }#你的仓库地址，不能用SSH地址
  s.source_files = "OPAttributeString/Classes/*.{h,m}" # 你代码的位置， OPAttributeString/*.{h,m} 表示 OPAttributeString 文件夹下所有的.h和.m文件
  #s.public_header_files = 'OPAttributeString/Classes/OPAttributeString.h'   #公开头文件地址
  s.requires_arc = true # 是否启用ARC
  s.platform     = :ios, "8.0" #平台及支持的最低版本
  s.frameworks   = "UIKit", "Foundation" #支持的框架
  # s.dependency = "AFNetworking" # 依赖库
 
  # User
  s.author             = { "BY" => "348043793@qq.com" } # 作者信息
  s.social_media_url   = "https://urm9ril.github.io/" # 个人主页

end