#!/usr/bin/env ruby

require 'fileutils'
require 'pathname'

@directory=__dir__

templates_dir="#{@directory}/VIPXcodeTemplates/Source"
scene_template="Scene.xctemplate"
scene_dir="#{templates_dir}/#{scene_template}"

def copy_templates_to_scene(source_dir, target_dir)
    Dir.chdir(source_dir) do
        templates=Dir.glob('*').select { |f|
            File.directory?(f) && f != "Scene.xctemplate"
        }
        templates.each { |t|
            template_dir="#{source_dir}/#{t}"
            puts "Copying #{template_dir} -> #{target_dir}"
            FileUtils.copy_entry(template_dir, target_dir)
        }
    end
end

def copy_toolbox_to_template
    src="#{@directory}/ToolBox/IOSToolbox/IOSToolbox"
    dest="#{@directory}/VIPXcodeTemplates/Source/ToolBox.xctemplate"

    Dir.chdir(src) do
        dirs=Dir.glob('*').select { |f| File.directory? f }
        dirs.each { |d|
            from="#{src}/#{d}"
            to="#{dest}/#{d}"
            puts "Copying #{from} -> #{to}"
            FileUtils.copy_entry(from, to)
        }
    end

end

copy_toolbox_to_template
