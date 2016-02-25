Pod::Spec.new do |s|
  s.name             = "Warg"
  s.version          = "0.1.2"
  s.summary          = "An acceibility UIView extension that makes icons and text visible on any background"

  s.description      = <<-DESC
  The Warg extension will give any UIView the ability to expose a displayable forground color
  based on the W3C accessibility technics for color and contrast : http://www.w3.org/WAI/ER/WD-AERT/#color-contrast
  DESC

  s.homepage         = "https://github.com/OMTS/Warg.git"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Iman Zarrabian" => "iman@omts.fr" }
  s.source           = { :git => "https://github.com/OMTS/Warg.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'Warg' => ['Pod/Assets/*.png']
  }
  
end
