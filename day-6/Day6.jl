module Day6

include("../Imports.jl")
using .Imports


function part1(str::String)
    return findfirst([allunique(str[i:i+3]) for i in 1:1:length(str)-3])+3 
end

function part2(str::String)
    return findfirst([allunique(str[i:i+13]) for i in 1:1:length(str)-13])+13
end

export part1
export part2

end
