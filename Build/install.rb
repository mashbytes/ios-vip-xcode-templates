#!/usr/bin/env ruby

require 'fileutils'
require 'pathname'

require 'plist'

@directory = __dir__

toolbox_template_dir = "../Toolbox.xctemplate"
toolbox_dir = "ToolBox/IOSToolbox/IOSToolbox"

scene_target_dir = "../Scene.xctemplate"

template_scanner = DirectoryScanner.new("../VIPXcodeTemplates/Source")
template_scanner.scan { |d|
    if d.ends_with?(scene_target_dir)
      return
    end
    from = d
    to = scene_target_dir
    FileUtils.copy_entry(from, to)
    # name = d.split("/").last.split(".").first
}

toolbox_scanner = SourceFileScanner.new(toolbox_dir)
toolbox_scanner.scan { |f|
  from = f
  to = toolbox_template_dir
  FileUtils.copy_entry(from, to)
}
