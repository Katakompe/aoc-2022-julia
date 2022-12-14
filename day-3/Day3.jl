module Day3

include("../Imports.jl")
using .Imports
using Folds

#best: 875.5
function part1(rucksacks::Vector{SubString{String}})

    function score(rucksack::Vector{Char})
        compartments = permutedims([rucksack[1:fld(end,2)] rucksack[fld(end,2)+1:end]])
        duplicate = Int(first(intersect(compartments[1,:], compartments[2,:])))
        if duplicate > 96
            return duplicate-96
        else 
            return duplicate-38
        end
    end
    
    return Folds.sum(score, collect.(rucksacks))
end

#best: 558.1
function part2(rucksacks::Vector{SubString{String}})

    function score(group)
        badge = Int(first(intersect(group...)))
        if badge > 96
            return badge-96
        else 
            return badge-38
        end
    end
    
    rucksacks = collect.(rucksacks)
    groups = permutedims(reshape(rucksacks, (3, fld(length(rucksacks),3))))
    return Folds.sum(score, eachrow(groups))
    
end

export part1
export part2
end
