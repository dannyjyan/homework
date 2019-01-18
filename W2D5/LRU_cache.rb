require 'byebug'
class LRUCache
     
    def initialize(size=4)
        @cache = []
        @max_len = size
    end

    def count
      # returns number of elements currently in cache
      @cache.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      i = cache.find_index(el)
      cache.delete_at(i) if i 
      cache.push(el)
      cache.shift if count > max_len
      el
    end

    def show
      # shows the items in the cache, with the LRU item first
        cache
    end

    private
    # helper methods go here!
    attr_accessor :cache, :max_len
  end


