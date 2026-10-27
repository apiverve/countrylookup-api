Pod::Spec.new do |s|
  s.name             = 'APIVerveCountryLookup'
  s.version          = '1.2.3'
  s.summary          = 'Country Lookup matches any country name or ISO code to its official names, ISO 3166 codes, capitals, region, languages, and flag emoji.'
  s.description      = <<-'DESC'
Country Lookup matches any country name or ISO code to its official names, ISO 3166 codes, capitals, region, languages, and flag emoji. Paid plans add coordinates and major cities.

This iOS/macOS SDK provides a convenient way to access the Country Lookup from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/countrylookup?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/countrylookup-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveCountryLookup/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
