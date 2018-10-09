class TemplateInfoOption
  include Plist::Emit

  attr_accessor :default, :description, :identifier, :name, :not_persisted, :required, :type

  def initialize(default = nil, description = nil, identifier = nil, name = nil, not_persisted = true, required = true, type = "text")
    @default = default
    @description = description
    @identifier = identifier
    @name = name
    @not_persisted = not_persisted
    @required = required
    @type = type
  end

  # def to_plist_node
  #   return "<Information Property List>#{self.defancify}</Information Property List>"
  # end

end

class TemplateInfoOptionBuilder

  def self.build
    builder = new
    yield(builder)
    builder.info
  end

  def initialize
    @option = TemplateInfoOption.new
  end

  def set_default(default)
    @option.default = default
  end

  def set_description(description)
    @option.description = description
  end

  def set_identifier(identifier)
    @option.identifier = identifier
  end

  def set_name(name)
    @option.name = name
  end

  def set_not_persisted(not_persisted)
    @option.not_persisted = not_persisted
  end

  def set_requried(required)
    @option.required = required
  end

  def set_type(type)
    @option.type = type
  end

end
