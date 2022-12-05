module Day1

include("../Imports.jl")
using .Imports


function part1(elves::Vector{Vector{Int64}})::Int
    return reduce((x,y) -> max.(x,y), map(sum, elves))
end

function part2(elves::Vector{Vector{Int64}})::Int
    return sum(sort(map(sum, elves))[end-2:end])
end

export part1
export part2
end