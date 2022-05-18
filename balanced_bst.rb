class Node
    include Comparable

    attr_accessor :data :left_children :right_children

    def <=>(other)
        data <=> other.data
    end

    def initialize(data=nil, left_children=nil, right_children=nil)
        @data = data 
        @left_children = left_children
        @right_children = right_children
    end
end

class Tree
    attr_accessor :ary

    def initialize(ary)
        @ary = ary
    end
    
    def root(build_tree(@ary))
        @root = build_tree(@ary)
    end
    def root
        @root
    end

    def build_tree(ary, start=0, ending=ary.lenght-1)
        ary = ary.compact.sort.uniq

        return nil if start > ending
        mid = (start + ending)/2
        root = Node.new(ary[mid])

        root.left_children = build_tree(ary, start, mid-1)
        root.right_children = build_tree(ary, mid+1, ending)

        return root
    end

    def find(root, key)
        return root if root.nil? || root.value == key
        if root.value < key 
            find(root.right_children, key)
        else
            find(root.left_children, key)
        end
    end

    def insert(root, key)
        return root = Node.new(key) if root.nil?
        if root.value == key
            return root
        elsif root.value < key
            root.right_children = insert(root.right_children, key)
        else
            root.left_children = insert(root.left_children, key)
        end
        return root
    end

    def min_value_node(node)
        current = node
        while !current.left_children.nil? do 
            current = current. left_children
        end
        return current
    end

    def delete(root, key)
        return root if root.nil?
        
        if key < root.value
            root.left_children = delete(root.left_children, key)
        elsif key > root.value
            root.right_children = delete(root.right_children, key)
        else
            if root.left_children.nil?
                temp = root.right_children
                root = nil
                return temp
            elsif root.right_children.nil?
                temp = root.left_children
                root = nil
                return temp
            end

            temp = min_value_node(root.right_children)
            root.value = temp.value
            root.right_children = delete(root.right_children, temp.value)
        end

        return root
    end

    def level_order(root, result=[], level=0)
        unless block_given?
            return result unless root
      
            result << [] if result.length == level
            result[level] << root.value
            level_order(root.left_children, result, level+1)
            level_order(root.right_children, result, level+1)
        end
        return result unless root
    
        result << [] if result.length == level
        result[level] << root.value
        yield(root.value)
        level_order(root.left_children, result, level+1)
        level_order(root.right_children, result, level+1)
    end

    def inorder(root, result=[])
        if block_given?
            unless root.nil?
                inorder(root.left_children)
                yield(root.value)
                inorder(root.right_children)
            end
        else
            return result unless root
            inorder(root.left_children, result)
            result << root.value
            inorder(root.right_children, result)
        end
    end

    def preorder (root, result=[])
        if block_given?
            unless root.nil?
                yield(root.value)
                inorder(root.left_children)
                inorder(root.right_children)
            end
        else
            return result unless root
            result << root.value
            inorder(root.left_children, result)
            inorder(root.right_children, result)
        end
    end

    def postorder(root, result=[])
        if block_given?
            unless root.nil?
                inorder(root.left_children)
                inorder(root.right_children)
                yield(root.value)
            end
        else
            return result unless root
            inorder(root.left_children, result)
            inorder(root.right_children, result)
            result << root.value
        end
    end

end


    
      
                