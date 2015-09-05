Gem::Specification.new do |s|
  s.name    = 'nmatrix-rowcol'
  s.version = '0.2.0'
  s.date    = '2015-09-05'
  s.author  = 'Geoff Buesing'
  s.email   = 'gbuesing@gmail.com'
  s.summary = 'Arbitrary row/column selection for NMatrix'
  s.license = 'MIT'
  s.homepage = 'https://github.com/gbuesing/nmatrix-rowcol'

  s.add_dependency 'nmatrix'

  s.files = ['lib/nmatrix-rowcol.rb', 'lib/nmatrix/rowcol.rb']
end