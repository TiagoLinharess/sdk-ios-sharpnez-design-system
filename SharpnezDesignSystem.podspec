Pod::Spec.new do |spec|
  spec.name         = 'SharpnezDesignSystem'
  spec.version      = '3.0.0'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/TiagoLinharess/sdk-ios-sharpnez-design-system.git'
  spec.authors      = { 'Tiago Linhares' => 'tiagolinharessouza@gmail.com' }
  spec.summary      = 'This is a software development kit'
  spec.source       = { :git => 'https://github.com/TiagoLinharess/sdk-ios-sharpnez-design-system.git', :tag => '3.0.0' }
  spec.platforms    = { :ios => "18.0" }
  spec.swift_version = '5.8.1'
  spec.resources    = 'SharpnezDesignSystem/SharpnezDesignSystem/Resources/Fonts/*.ttf'
  spec.source_files = 'SharpnezDesignSystem/SharpnezDesignSystem/**/*.swift'
  spec.framework    = 'SystemConfiguration'
end
