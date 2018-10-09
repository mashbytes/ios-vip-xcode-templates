#!/usr/bin/env ruby

require 'fileutils'
require 'pathname'

require 'plist'

directory = __dir__

project_root_dir = File.absolute_path("#{directory}/..")
puts "Project Root Directory: #{project_root_dir}"

source_dir = "#{project_root_dir}/VIPXcodeTemplates/Source"
templates_partials_dir = "#{source_dir}/Partial"
templates_complete_dir = "#{source_dir}/Complete"

build_dir = ""

toolbox_source_dir = "#{project_root_dir}/Toolbox"

#
# toolbox_template_dir = "../Toolbox.xctemplate"
# toolbox_dir = "ToolBox/IOSToolbox/IOSToolbox"
#
# scene_target_dir = "../Scene.xctemplate"
#
# template_scanner = DirectoryScanner.new("../VIPXcodeTemplates/Source")
# template_scanner.scan { |d|
#     if d.ends_with?(scene_target_dir)
#       return
#     end
#     from = d
#     to = scene_target_dir
#     FileUtils.copy_entry(from, to)
#     # name = d.split("/").last.split(".").first
# }
#
# toolbox_scanner = SourceFileScanner.new(toolbox_dir)
# toolbox_scanner.scan { |f|
#   from = f
#   to = toolbox_template_dir
#   FileUtils.copy_entry(from, to)
# }
