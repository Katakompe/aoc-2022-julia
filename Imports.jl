module Imports



    function list_of_strings(file)
        f = open(file)
        return readlines(f)
    end

    function list_of_type(file, type)
        f = open(file)
        lines = readlines(f)
        return map(l -> convert(type, l), lines)
    end

    function list_of_strings_2d(file, separator1, separator2)
        str = read(file, String)
        return map(v -> split(v, separator2) ,split(str, separator1))
    end

    function list_of_type_2d(file, type, separator1, separator2)
        str = read(file, String)
        str = str[end]== '\n' ? chop(str) : str        
        return map(v -> map(entry -> parse(type, String(entry)),split(v, separator2)) ,split(str, separator1))
    end

    export list_of_strings
    export list_of_strings_2d
    export list_of_type
    export list_of_type_2d
end