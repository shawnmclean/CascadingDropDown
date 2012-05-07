require 'uglifier'
require 'version_bumper'
require 'albacore'

desc "Build Project"
task :build => :nup do
  
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

desc "Create the nuspec file for creating the nuget package"
nuspec :nus => :min do |nuspec|
   nuspec.id="CascadingDropDown"
   nuspec.version = bumper_version.to_s
   nuspec.authors = "Shawn Mclean"
   nuspec.description = "JQuery plugin for cascading drop downs."
   nuspec.title = "CascadingDropDown"
   nuspec.language = "en-US"
   nuspec.projectUrl = "https://github.com/shawnmclean/CascadingDropDown"
   nuspec.working_directory = "build/"
   nuspec.output_file = "CascadingDropDown.nuspec"
   nuspec.file "*.js", "Scripts"
end

nugetpack :nup => :nus do |nuget|
   nuget.command     = "tools/NuGet.exe"
   nuget.nuspec      = "CascadingDropDown.nuspec"
   nuget.base_folder = "build/"
   nuget.output      = "build/"
end