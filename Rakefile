require 'uglifier'
require 'version_bumper'

desc "Build Project"
task :build => :min do
  
end

desc "Coffeescript compile"
task :coffee do
  sh 'coffee -c -o build/ src/'
end

desc "Minify the compiled file"
task :min => :coffee do
  minContent = Uglifier.new.compile(File.read("build/CascadingDropDown.js"))
  outFile = File.open("build/CascadingDropDown.min.js", "w")
  outFile.puts(minContent)
  outFile.close
end