Pod::Spec.new do |s|
  s.name         = "Idioms"
  s.version      = "0.2.0"
  s.summary      = "Swift idioms"
  s.description  = <<-DESC
    Set of extensions for common Swift types.
  DESC
  s.homepage     = "https://github.com/hectr/swift-idioms"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Hèctor Marquès" => "h@mrhector.me" }
  s.social_media_url   = "https://twitter.com/elnetus"
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/hectr/swift-idioms.git", :tag => s.version.to_s }
  s.source_files  = "Sources/Idioms/**/*"
  s.frameworks  = "Foundation"
end
