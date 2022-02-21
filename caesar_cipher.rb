def caesar_cipher(string, key)
    fixed_key = key
    while fixed_key > 26 do
        fixed_key -= 26
    end
    ciphered_array = []
    splited_string_in_acsii = string.bytes
    splited_string_in_acsii.each do |n|
        if (n >= 65 && n <= 90)
            n + fixed_key > 90 ? ciphered_array.push((n + fixed_key) - 26) : ciphered_array.push(n + fixed_key)
        elsif (n >= 97 && n <= 122)
            n + fixed_key > 122 ? ciphered_array.push((n + fixed_key) - 26) : ciphered_array.push(n + fixed_key)
        else
            ciphered_array.push(n)
        end
    end
    ciphered_array.pack('c*')
end
