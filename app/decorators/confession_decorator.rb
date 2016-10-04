class ConfessionDecorator
  attr_reader :confession

  def initialize(confession)
    @confession = confession
  end

  def method_missing (method_name, *args, &block)
    confession.send(method_name, *args, &block)
  end

  def respond_to_missing? (method_name, include_private = false)
    confession.respond_to?(method_name, include_private) || super
  end

end