#!/usr/bin/env ruby

require 'fileutils'
require 'pathname'
require 'find'

directory = __dir__

project_root_dir = File.absolute_path("#{directory}/..")
puts "Project Root Directory: #{project_root_dir}"

source_dir = "#{project_root_dir}/VIPXcodeTemplates/Source"
build_dir = "#{project_root_dir}/Build"

def clean_directory(directory)
  if File.exist?(directory)
    Dir.children(directory).each { |c|
      FileUtils.remove_entry("#{directory}/#{c}")
    }
  else
    FileUtils.makedirs(directory)
  end
end

puts "Cleaning Build Directory: #{build_dir}"
clean_directory(build_dir)

puts "Copying Complete Templates to Build Directory: #{build_dir}"
templates_complete_dir = "#{source_dir}/Complete"
complete_templates =
  Dir.children(templates_complete_dir)
    .map { |p| "#{templates_complete_dir}/#{p}" }
    .select { |p| File.directory?(p) }
puts "Found Templates: #{complete_templates.map { |p| File.basename(p) }}"
complete_templates.each { |p|
  FileUtils.cp_r(p, build_dir)
}

templates_partial_dir = "#{source_dir}/Partial"

puts "Building Scene Template"
scene_template_name = "Scene.xctemplate"
scene_source_dir = "#{templates_partial_dir}/#{scene_template_name}"
scene_target_dir = "#{build_dir}/#{scene_template_name}"
FileUtils.cp_r(scene_source_dir, build_dir)

complete_templates.each { |p|
  Dir.children(p).each { |f|
    next unless f =~ /.*\.swift$/ && p !~ /.*Tests.*/
    full_path = "#{p}/#{f}"
    FileUtils.cp(full_path, scene_target_dir)
  }
}

puts "Building Toolbox Template"
toolbox_template_dir = "#{templates_partial_dir}/Toolbox.xctemplate"
toolbox_source_dir = "#{project_root_dir}/Toolbox/IOSToolbox/IOSToolbox"
toolbox_target_dir = "#{build_dir}/Toolbox.xctemplate"
FileUtils.cp_r(toolbox_template_dir, build_dir)

Find.find(toolbox_source_dir) do |p|
  next unless p =~ /.*\.swift$/
  FileUtils.cp(p, toolbox_target_dir)
end

target_dir = File.expand_path("~/Library/Developer/Xcode/Templates/File Templates/Clean Swift")
puts "Cleaning Xcode Templates Directory: #{target_dir}"
clean_directory(target_dir)
Dir.children(build_dir).each { |p|
  full_path = "#{build_dir}/#{p}"
  FileUtils.cp_r(full_path, target_dir)
}
