module Kredis::Types
  def keyed(key, config: :shared)
    Proxy.new configured_for(config), namespaced_key(key)
  end

  def list(key, config: :shared)
    List.new configured_for(config), namespaced_key(key)
  end

  def unique_list(key, limit: nil, config: :shared)
    UniqueList.new configured_for(config), namespaced_key(key), limit: limit
  end

  def counter(key, expires_in: nil, config: :shared)
    Counter.new configured_for(config), namespaced_key(key), expires_in: expires_in
  end

  def mutex(key, expires_in: nil, config: :shared)
    Mutex.new configured_for(config), namespaced_key(key), expires_in: expires_in
  end
end

require "kredis/proxy"
require "kredis/types/list"
require "kredis/types/unique_list"
require "kredis/types/counter"
require "kredis/types/mutex"
