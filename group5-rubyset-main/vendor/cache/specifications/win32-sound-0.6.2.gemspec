# -*- encoding: utf-8 -*-
# stub: win32-sound 0.6.2 ruby lib

Gem::Specification.new do |s|
  s.name = "win32-sound".freeze
  s.version = "0.6.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Daniel J. Berger".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDcDCCAligAwIBAgIBATANBgkqhkiG9w0BAQUFADA/MREwDwYDVQQDDAhkamJl\ncmc5NjEVMBMGCgmSJomT8ixkARkWBWdtYWlsMRMwEQYKCZImiZPyLGQBGRYDY29t\nMB4XDTE2MTIxMjAwMTQ1M1oXDTE3MTIxMjAwMTQ1M1owPzERMA8GA1UEAwwIZGpi\nZXJnOTYxFTATBgoJkiaJk/IsZAEZFgVnbWFpbDETMBEGCgmSJomT8ixkARkWA2Nv\nbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMVtTm/wETO8yKVKRPBO\nVgPRvE94iEfKryOb/tQrmhGhchG2ALqdw/r54cGJvLaXeItrYJ6N8pSE/FSnN5jM\nxugUhHBprPl+AsQ4E+IBy0dKwyU8XjFoVYzWvT1wnqwQdSazdgFCfQqb51QCgUIT\nPGGakKlyzCb3Mbq30is8+QlRrqXt/JbpkUZbQwUqCdAulMT4oyPBk/L+48pbVX0s\n4yj7YaVAqfGByAMTPXEmUS388lX+0xq8+GGir2Fuh0TpNW0ggr9BxprwqL0Mg4Oo\nYhM5L1y8Plolo8mOTN3+K8I3afZ0lD0BtwniVb6g+Ut/4aBjKy2+GyFwwNOu0gSj\ndesCAwEAAaN3MHUwCQYDVR0TBAIwADALBgNVHQ8EBAMCBLAwHQYDVR0OBBYEFJfg\nHmQ0uDU3Z9A9hB1lQMjr5VZSMB0GA1UdEQQWMBSBEmRqYmVyZzk2QGdtYWlsLmNv\nbTAdBgNVHRIEFjAUgRJkamJlcmc5NkBnbWFpbC5jb20wDQYJKoZIhvcNAQEFBQAD\nggEBACjRCHRP944MHIQJNCglZbDnZowybV2HxmG1uhnvRwrOjBA7CXemc+QSAL7K\n7eXC4FdojVEJrnU7ZxuCmfQU+fvkEQKOnah1osG1874aPiDlwtjHclpeqcDgTUI7\nA7CF+OXK8x7ksFx205ruhPHKaPYtwVG/W/J+y7Wx8yl9rvwUgRBL5cVzTBiEz+AB\nNRT7yoHXXfFXjuQWN1eHunSbNds2ZTGQd64yBCujb17Xdl+F9tu4klkTga3gxP3P\ny3zoX1VttxnIZBojRM/s2A7c2aubMH2SVbXMR3ccVkB9XbYKl1OvCe7q85xEHit2\nKbpico5nnyHqf7YSPmvZe8bCU94=\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2017-03-19"
  s.description = "    The win32-sound library provides an interface for playing various\n    sounds on MS Windows operating systems, including system sounds and\n    wave files, as well as querying and configuring sound related properties.\n".freeze
  s.email = "djberg96@gmail.com".freeze
  s.extra_rdoc_files = ["CHANGES".freeze, "README".freeze, "MANIFEST".freeze]
  s.files = ["CHANGES".freeze, "MANIFEST".freeze, "README".freeze]
  s.homepage = "http://github.com/djberg96/win32-sound".freeze
  s.licenses = ["Artistic 2.0".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "A library for playing with sound on MS Windows.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ffi>.freeze, [">= 0"])
      s.add_development_dependency(%q<test-unit>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<ffi>.freeze, [">= 0"])
      s.add_dependency(%q<test-unit>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<ffi>.freeze, [">= 0"])
    s.add_dependency(%q<test-unit>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
