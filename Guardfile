# Guardfile
# More info at https://github.com/guard/guard#readme

guard :foodcritic, cookbook_paths: '.' do
  watch(%r{attributes/.+\.rb$})
  watch(%r{providers/.+\.rb$})
  watch(%r{recipes/.+\.rb$})
  watch(%r{resources/.+\.rb$})
  watch(%r{templates/.+$})
  watch('metadata.rb')
end

guard :rubocop do
  watch(%r{.+\.rb$})
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end

guard :rspec,
  all_on_start: true,
  notification: false,
  cli: '--color --format nested --fail-fast' do

  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^recipes/(.+)\.rb$})    { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^providers/(.+)\.rb$})  { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^attributes/(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^templates/(.+)\.rb$})  { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^resources/(.+)\.rb$})  { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')     { 'spec' }
end
