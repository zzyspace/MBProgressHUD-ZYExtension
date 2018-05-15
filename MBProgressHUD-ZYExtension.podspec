Pod::Spec.new do |s|
  s.name     = 'MBProgressHUD-ZYExtension'
  s.version  = '1.0.1'
  s.license  = 'MIT'
  s.summary  = 'Easy way to use MBProgressHUD'
  s.homepage = 'https://github.com/zzyspace/MBProgressHUD-ZYExtension.git'
  s.source   = { :git => 'https://github.com/zzyspace/MBProgressHUD-ZYExtension.git', :tag => "#{s.version}" }
  s.authors = { 'Ryan' => '551854173@qq.com' }
  s.platform = :ios, '8.0'
  s.frameworks = 'Foundation'
  s.dependency 'MBProgressHUD'
  s.source_files = '*.{h,m}'
  s.resource = 'MBProgressHUD-ZYExtension.bundle'
end
