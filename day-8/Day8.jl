module Day8

include("../Imports.jl")
using .Imports
using DataStructures

using Folds

function isVisible(tree_grid::Matrix{Int64}, pos::CartesianIndex{2})
    max_idx = size(tree_grid)
    @inbounds max_left = CartesianIndices((pos[1]:pos[1], 1:pos[2]-1))
    @inbounds max_right = CartesianIndices((pos[1]:pos[1], pos[2]+1:max_idx[2]))
    @inbounds max_down = CartesianIndices((1:pos[1]-1, pos[2]:pos[2]))
    @inbounds max_up = CartesianIndices((pos[1]+1:max_idx[1], pos[2]:pos[2]))

    @inbounds return any([
        length(tree_grid[max_left]) > 0 ? maximum(tree_grid[max_left])<tree_grid[pos] : true,
        length(tree_grid[max_right]) > 0 ? maximum(tree_grid[max_right])<tree_grid[pos] : true,
        length(tree_grid[max_up]) > 0 ? maximum(tree_grid[max_up])<tree_grid[pos] : true,
        length(tree_grid[max_down]) > 0 ? maximum(tree_grid[max_down])<tree_grid[pos] : true
        ])

end

function scenic_score(tree_grid::Matrix{Int64}, pos::CartesianIndex{2})
    max_idx = size(tree_grid)
    @inbounds max_left = CartesianIndices((pos[1]:pos[1], 1:pos[2]-1))
    @inbounds max_right = CartesianIndices((pos[1]:pos[1], pos[2]+1:max_idx[2]))
    @inbounds max_up = CartesianIndices((1:pos[1]-1, pos[2]:pos[2]))
    @inbounds max_down = CartesianIndices((pos[1]+1:max_idx[1], pos[2]:pos[2]))

    @inbounds left_dist = findlast(tree_grid[max_left] .>= tree_grid[pos])
    @inbounds left_score = left_dist !== nothing ? abs(left_dist[2]-pos[2]) : pos[2]-1
    @inbounds right_dist = findfirst(tree_grid[max_right] .>= tree_grid[pos])
    @inbounds right_score = right_dist !== nothing ? right_dist[2] : max_idx[2] - pos[2]
    @inbounds up_dist = findlast(tree_grid[max_up].>= tree_grid[pos])
    @inbounds up_score = up_dist !== nothing ? abs(up_dist[1]-pos[1]) : pos[1]-1
    @inbounds down_dist= findfirst(tree_grid[max_down].>= tree_grid[pos])
    @inbounds down_score = down_dist !== nothing ? down_dist[1] : max_idx[1]-pos[1]
    return left_score * right_score * up_score * down_score
end

function part1(tree_grid::Matrix{Int})
  return sum(Folds.map(coords -> isVisible(tree_grid, coords), CartesianIndices(tree_grid)))
  
end

function part2(tree_grid::Matrix{Int})
    return Folds.maximum(coords -> scenic_score(tree_grid, coords),CartesianIndices(tree_grid))
end
#=
Result Day 8-1: 1736
Duration for part1: 46810.6 μs
  0.091047 seconds (87.81 k allocations: 35.355 MiB, 72.93% gc time)
Result Day 8-2: 268800
Duration for part2: 67252.4 μs
  0.010334 seconds (117.61 k allocations: 21.783 MiB)

=#

export part1
export part2

end
