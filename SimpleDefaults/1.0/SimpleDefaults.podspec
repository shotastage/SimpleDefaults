Pod::Spec.new do |s|
    s.name         = "SimpleDefaults"
    s.version      = "1.0"
    s.summary      = "Simple UserDefaults handler"
    s.homepage     = "https://github.com/shotastage/SimpleDefaults"
    s.license      = "MIT"
    s.author       = { "Shota Shimazu" => "hornet.live.mf@gmail.com" }
   
    s.platform     = :ios, "10.0"
  
    s.source       = { :git => "https://github.com/shotastage/SimpleDefaults.git", :tag => "#{s.version}" }
    s.source_files = 'SimpleDefaults/*.{swift, h, m}'
end
