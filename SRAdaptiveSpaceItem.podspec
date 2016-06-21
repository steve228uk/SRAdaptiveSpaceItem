Pod::Spec.new do |s|
  s.name             = "SRAdaptiveSpaceItem"
  s.version          = "1.0.1"
  s.summary          = "A Swift NSToolbarItem subclass which creates a space that will center the next toolbar item"

  s.description      = <<-DESC
A Swift NSToolbarItem subclass which creates a space that will center the next toolbar item.

This is a direct translation of TAAdaptiveSpaceItem.
                       DESC

  s.homepage         = "https://github.com/steve228uk/SRAdaptiveSpaceItem"
  s.license          = 'MIT'
  s.author           = { "Stephen Radford" => "steve228uk@gmail.com" }
  s.source           = { :git => "https://github.com/steve228uk/SRAdaptiveSpaceItem.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/steve228uk'

  s.osx.deployment_target = '10.10'

  s.source_files = 'SRAdaptiveSpaceItem.swift'

end
