class LinkedList
    attr_reader :head

    def initialize(head = nil)
      @head = head
    end
  
    def prepend(value)
      if head.nil?
        @head = value
      else
        old_head = @head
        @head = value
        value.next_node = old_head
      end
    end
  
    def append(value)
      if head.nil?
        @head = value
      else
        tail.next_node = value
      end
    end
  
    def tail
      pointer = head
      pointer = pointer.next_node until pointer.next_node.nil?
      pointer
    end
  
    def size
      return 0 if @head.nil?
  
      count = 1
      pointer = @head
      until pointer.next_node.nil?
        count += 1
        pointer = pointer.next_node
      end
      count
    end
  
    def at(index)
      return @head if index == 0
  
      counter = 0
      pointer = @head
      until pointer.next_node.nil?
        return pointer if counter == index
  
        counter += 1
        pointer = pointer.next_node
      end
    end
  
    def pop
      return if @head.nil?
  
      if @head.next_node.nil?
        @head = nil
      else
        @head = @head.next_node
      end
    end
  
    def contains?(search_term)
      return false if @head.nil?
  
      return true if @head.value == search_term
  
      pointer = @head
      until pointer.next_node.nil?
        return true if pointer.next_node.value == search_term
  
        pointer = pointer.next_node
      end
      false
    end
  
    def find(search_term)
      return nil if @head.nil?
  
      index = 0
      return index if @head.value == search_term
  
      pointer = @head
      until pointer.next_node.nil?
        index += 1
        return index if pointer.next_node.value == search_term
  
        pointer = pointer.next_node
      end
    end
  
    def to_s
      pointer = @head
      return "nil" if pointer.nil?
  
      return_string = ""
      return_string += "( #{pointer.value} ) -> "
  
      until pointer.next_node.nil?
        pointer = pointer.next_node
        return_string += "( #{pointer.value} ) -> "
      end
  
      return_string += "nil"
      return return_string
    end
end

class Node
    attr_accessor :value, :next_node

    def initialize(value = nil, next_node = nil)
      @value = value
      @next_node = next_node
    end

end 