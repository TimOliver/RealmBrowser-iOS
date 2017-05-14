Pod::Spec.new do |s|
  s.name     = 'RealmBrowserKit'
  s.version  = '0.0.1'
  s.license  =  { :type => 'MIT', :file => 'LICENSE' }
  s.summary  = 'An embeddable version of the Realm Browser that can be used to debug Realm databases in an on-device app'
  s.homepage = 'https://realm.io'
  s.author   = { 'Realm' => 'help@realm.io' }
  s.source   = { :git => 'https://github.com/realm-demos/realm-loginkit.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.platform = :ios, '9.0'
  s.dependency 'Realm'
  s.dependency 'TORoundedTableView'
  s.dependency 'TOSplitViewController'
  s.dependency 'TOPagerView'
  s.dependency 'TODocumentPickerViewController'
end