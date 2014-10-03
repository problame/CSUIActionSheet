Pod::Spec.new do |s|

  s.name         = "CSUIActionSheet"
  s.version      = "0.0.2"
  s.summary      = "Congfigure UIActionSheet using a configuration object. Handle actions using blocks."

  s.description  = <<-DESC
                    CSUIActionSheets adds a configuration object to UIActionSheet.
                    Directly associate button-titles and actions using blocks. No mess with `buttonIndex`!
                   DESC

  s.homepage     = "https://github.com/problame//CSUIActionSheet"

  s.license      = { :type => 'MIT', :file => 'LICENSE.md' }

  s.author             = { "Christian Schwarz" => "me@cschwarz.com" }

  s.platform     = :ios, '7.0'

  s.source       = { :git => "https://github.com/problame/CSUIActionSheet.git", :tag =>s .version.to_s }

  s.source_files  = 'CSUIActionSheet'

  s.requires_arc = true

end
