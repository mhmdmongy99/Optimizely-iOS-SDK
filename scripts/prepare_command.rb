puts Dir.pwd 
require 'xcodeproj'
require 'find'

project_path = []
Find.find('../../') do |path|
  project_path << path if path =~ /(?!Pods).*\.xcodeproj$/
end
puts project_path

project = Xcodeproj::Project.open(path_to_project)
main_target = project.targets.first
phase = main_target.new_shell_script_build_phase("Name of your Phase")
phase.shell_script = "do sth with ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/your.file"
project.save()