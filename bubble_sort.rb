def bubble_sort(array)
    raise 'Only arrays allowed' unless array.instance_of?(Array)
    aux = nil
    times_to_repeat = array.length - 1
    times_to_repeat.times do 
        for i in 1...array.length do 
            if array[i - 1] > array[i]
                aux = array[i - 1] 
                array[i - 1] = array[i]
                array[i] = aux
            end
        end
    end
    return array
end


