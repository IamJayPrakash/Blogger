# frozen_string_literal: true

module RbVmomi
  class << self
    attr_writer :logger
  end

  def self.logger
    @logger ||= begin
      require 'logger'
      Logger.new($stderr)
    end
  end
end
