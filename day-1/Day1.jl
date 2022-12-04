module Day1

include("../Imports.jl")
using .Imports


function part1(file)
    elves = list_of_type_2d(file, Int64, "\n\n", "\n")
    return max(map(sum, elves)...)
end

function part2(file)
    elves = list_of_type_2d(file, Int64, "\n\n", "\n")
    return sum(sort(map(sum, elves))[end-2:end])
end

export part1
export part2
end