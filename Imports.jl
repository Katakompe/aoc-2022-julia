module Imports



    function list_of_strings(str)::Vector{SubString{String}} 
    
        return split(str, "\n")
    end

    function list_of_type(str, type)
        lines = split(str, "\n")
        return map(l -> convert(type, l), lines)
    end

    function list_of_strings_2d(str, separator1, separator2)::Vector{Vector{SubString{String}}}
        return map(v -> split(v, separator2) ,split(str, separator1))
    end

    function list_of_type_2d(str::String, type::Type, separator1::String, separator2::String)
        str = str[end]== '\n' ? chop(str) : str        
        return map(v -> map(entry -> parse(type, String(entry)),split(v, separator2)) ,split(str, separator1))
    end

    export list_of_strings
    export list_of_strings_2d
    export list_of_type
    export list_of_type_2d
end