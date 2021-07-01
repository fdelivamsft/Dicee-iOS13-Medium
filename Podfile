platform :ios, '13.0'

target 'Dicee-iOS13' do
  use_frameworks!

  pod 'PKHUD', '~> 5.0'
  
  pod 'AppCenter'

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
        config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
        config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
      end
    end
  end
end
