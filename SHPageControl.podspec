Pod::Spec.new do | s |
    s.name = "SHPageControl"
    s.version = "1.0.0"
    s.summary = "分页控制"
    s.homepage = "https://github.com/CCSH/#{s.name}"
    s.license = "MIT"
    s.author = {"CCSH" => "624089195@qq.com"}
    s.platform = :ios
    s.source = {:git => "https://github.com/CCSH/#{s.name}.git", :tag => "#{s.version}"}
    s.source_files = "#{s.name}/*.{h,m}"
    s.dependency "SHExtension/UIView"

    #部分功能
    s.subspec 'NSString' do |ss|
        ss.source_files = "#{s.name}/NSString+SHExtension.{h,m}"
    end

end
