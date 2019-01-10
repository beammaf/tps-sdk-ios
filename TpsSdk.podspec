Pod::Spec.new do |s|
    s.name              = 'TpsSdk'
    s.version           = '0.0.1'
    s.summary           = 'Ticketless Parking SDK Provided by Beam UAE'
    s.homepage          = 'http://beamuae.app/'
    s.dependency 'Moya/ReactiveSwift', '~> 12.0'
    s.dependency 'Moya/RxSwift', '~> 12.0'
    s.dependency 'RxCocoa'
    s.dependency 'RxBlocking'



    s.author            = { 'Name' => 'developer@beamuae.app' }
    s.license           = { :type => 'MIT', :file => 'LICENSE' }

    s.platform          = :ios
    s.source            = { :git => 'https://github.com/beammaf/tps-sdk-ios.git',:branch => 'CocoaPods'}

    s.ios.deployment_target = '11.0'
    s.ios.vendored_frameworks = 'TpsSdk.framework', 'ReactiveMoya.framework', 'RxMoya.framework'
    s.requires_arc = true
end
