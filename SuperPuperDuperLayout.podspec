Pod::Spec.new do |s|
    s.name = 'SuperPuperDuperLayout'
    s.version = '1.0.0'
    s.license = 'MIT'
    s.summary = 'Lightweight, elegant and safe wrapper over auto layout.'
    s.description = 'Lightweight, elegant and safe wrapper over auto layout. Inspired by Layout Anchors ( https://developer.apple.com/documentation/uikit/nslayoutanchor ) and SnapKit ( https://github.com/SnapKit/SnapKit ). Without overheads such as «extension UIView», «extension UILayoutGuide», «objc_setAssociatedObjectAssociatedObject», «objc_getAssociatedObject» etc.'
    s.homepage = 'https://github.com/SugarAndCandy/SuperPuperDuperLayout'
    s.authors = { 'Alexander Zolotarev' => 'berez.rosha@gmail.com' }
    s.social_media_url = 'https://twitter.com/zolotarev_s'
    s.source = { :git => 'https://github.com/SugarAndCandy/SuperPuperDuperLayout.git', :tag => s.version }
    s.ios.deployment_target = '8.0'
    s.source_files = 'Source/*.swift'
end
