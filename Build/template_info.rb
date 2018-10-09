require 'plist'

class TemplateInfo
  include Plist::Emit

  attr_accessor :default_completion_name, :description, :kind, :options, :platforms, :sort_order, :summary

  def initialize(default_completion_name = nil, description = nil, kind = "Xcode.IDEKit.TextSubstitutionFileTemplateKind", options = [], platforms = ["com.apple.platform.iphoneos"], sort_order = 0)
    @default_completion_name = default_completion_name
    @description = description
    @kind = kind
    @options = options
    @platforms = platforms
    @sort_order = sort_order
    @summary = description
  end

  def to_plist_node
    # TODO map
    dict=Hash.new
    self.instance_variables.each do |name|
      value = self.instance_variable_get name
      key = name.to_s.delete_prefix("@").split('_').collect(&:capitalize).join
      dict[key] = value if !value.nil?
    end

    return Plist::Emit.dump(dict, false)
  end

end

class TemplateInfoBuilder

  def self.build
    builder = new
    yield(builder)
    builder.info
  end

  def initialize
    @info = TemplateInfo.new
  end

  def set_default_completion_name(name)
    @info.default_completion_name = name
  end

  def set_description(description)
    @info.description = description
  end

  def set_kind(kind)
    @info.kind = kind
  end

  def set_options(options)
    @info.options = options
  end

  def add_option(option)
    @info.options << option
  end

  def set_platforms(platforms)
    @info.platforms = platforms
  end

  def set_sort_order(order)
    @info.sort_order = order
  end

  def set_summary(summary)
    @info.summary = summary
  end

end
