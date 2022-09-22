# frozen_string_literal: true
require 'bundler/setup'

require "maxitest/autorun"
require 'mocha/minitest'

require 'time'
require 'prop'
require 'active_support/cache'
require 'active_support/cache/memory_store'
require 'active_support/notifications'

Minitest::Test.class_eval do
  def setup_fake_store
    Prop.cache = ActiveSupport::Cache::MemoryStore.new
  end

  def freeze_time(time = Time.now)
    @time = time
    Time.stubs(:now).returns(@time)
  end
end
