Pod::Spec.new do |s|
s.name         = "YBStarView"
s.version      = "1.0.0"
s.summary      = "YBStarView Animation View"
s.description  = "Core Graphics "
s.homepage     = "https://github.com/kekeYe/YBStarView"
s.license      = 'MIT'
s.author       = { "kekeye" => "yebiniosdev@gmail.com" }
s.platform     = :ios, '7.0'
s.source       = { :git => "https://github.com/kekeYe/YBStarView.git" }
s.requires_arc = true
s.source_files = 'YBStarView/YBStarView/YBStarView/{Star}*.{h,m}'
s.frameworks   = 'QuartzCore'

end