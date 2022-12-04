module Day3

include("../Imports.jl")
using .Imports


function part1(file)

    function score(rucksack)
        rucksack = collect(rucksack)
        compartments = permutedims([rucksack[1:fld(end,2)] rucksack[fld(end,2)+1:end]])
        duplicate = Int(first(intersect(compartments[1,:], compartments[2,:])))
        if duplicate > 96
            return duplicate-96
        else 
            return duplicate-38
        end
    end

    rucksacks = list_of_strings(file)
    return sum(map(score, rucksacks))
end


function part2(file)

    function score(group)
        badge = Int(first(intersect(group...)))
        if badge > 96
            return badge-96
        else 
            return badge-38
        end
    end
    
    rucksacks = list_of_strings(file)
    rucksacks = map(collect, rucksacks)
    groups = permutedims(reshape(rucksacks, (3, fld(length(rucksacks),3))))
    return sum(map(score, eachrow(groups)))
    
end

export part1
export part2
end
