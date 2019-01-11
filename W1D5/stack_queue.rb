class Stack
    def initialize
      # create ivar to store stack here!
      @stack = []
    end

    def push(el)
      # adds an element to the stack
      @stack << el
    end

    def pop
      # removes one element from the stack
      @stack.delete_at(-1)
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @stack[-1]
    end
end

class Queue
    def initialize
      # create ivar to store stack here!
      @queue = []
    end

    def enqueue(el)
      # adds an element to the queue
      @queue = [el] + @queue
    end

    def dequeue
      # removes one element from the queue
      @queue.delete_at(0)
    end

    def peek
      # returns, but doesn't remove, the top element in the queue
      @queue[0]
    end
end

class Map
    def initialize 
        @map = []
    end 
    def set(key,value)
        index = key?(key)
        if index 
            @map[index] = [key, value]
        else 
            @map << [key,value]
        end
    end   
    
    def get(key) 
        key?(key) 
    end 

    def show 
        @map 
    end 

    def delete(key)
        index = key?(key)
        return index unless index 
        @map.delete_at(index)
    end 

    private 
    def key?(key) # returns index of the key if true, nil otherwise
        @map.each_with_index do |kv,i|
            k,v = kv 
            return i if k == key 
        end 
        nil 
    end 
end