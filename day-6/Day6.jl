module Day6

include("../Imports.jl")
using .Imports

#best: 285.3 μs
function part1(str::String)
    for i in 1:1:length(str)-3
        @inbounds if allunique(str[i:i+3])
            return i+3
        end
    end
end

#best: 644.6 μs
function part2(str::String)
    for i in 1:1:length(str)-13
        @inbounds if allunique(str[i:i+13])
            return i+13
        end
    end
end

function part1_old(str::String)
    return findfirst([allunique(str[i:i+3]) for i in 1:1:length(str)-3])+3 
end

function part2_old(str::String)
    return findfirst([allunique(str[i:i+13]) for i in 1:1:length(str)-13])+13
end

export part1
export part2_old

end
