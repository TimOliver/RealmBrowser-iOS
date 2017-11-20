Pod::Spec.new do |s|
  s.name     = 'RealmBrowserKit'
  s.version  = '0.0.1'
  s.license  =  { :type => 'MIT', :file => 'LICENSE' }
  s.summary  = 'An embeddable version of the Realm Browser that can be used to debug Realm databases in an on-device app'
  s.homepage = 'https://timoliver.blog'
  s.author   = { 'Tim Oliver' => 'info@timoliver.com.au' }
  s.source   = { :git => 'https://github.com/timoliver/RealmBrowser-iOS.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.source_files = 'RealmBrowser/**/*.{h,m}'
  s.resources = "RealmBrowser/**/*.{xib}"
  s.platform = :ios, '8.0'
  s.dependency 'Realm'
  s.dependency 'TORoundedTableView'
  s.dependency 'TOSplitViewController'
  s.dependency 'TODocumentPickerViewController'
end