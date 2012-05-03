desc "Build Project"
task :build => :min do
  
end

desc "Coffeescript compile"
task :coffee do
  sh 'coffee -c -o build/ src/'
end

desc "Minify the compiled file"
task :min => :coffee do
  sh 'uglifyjs build/CascadingDropDown.js > build/CascadingDropDown.min.js'
end