# frozen_string_literal: true

require_relative './vmodl_helper'

namespace :vmodl do
  desc 'Verify vmodl.db'
  task :verify do
    VmodlHelper.verify!
  end

  desc 'Generate vmodl.db'
  task :generate do
    VmodlHelper.generate!
  end
end
