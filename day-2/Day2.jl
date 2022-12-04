module Day2

include("../Imports.jl")
using .Imports

function part1(file)
    move_scores = Dict([
        ("X", 1),
        ("Y", 2),
        ("Z", 3),
    ])

    enemy_move_to_my_move = Dict([
        ("A", "X"),
        ("B", "Y"),
        ("C", "Z"),
    ])

    #My Moves
    # X: Rock
    # Y: Paper
    # Z: Scisors

    #Enemy Moves
    # A: Rock
    # B: Paper
    # C: Scisors

    function victory_score(my_move, enemy_move)
        #draw
        if enemy_move_to_my_move[enemy_move] == my_move
            return 3
        end
        #loss
        if my_move == "X" && enemy_move == "B"
            return 0
        end
        if my_move == "Y" && enemy_move == "C"
            return 0
        end
        if my_move == "Z" && enemy_move == "A"
            return 0
            #win
        else
            return 6
        end
    end


    rounds = list_of_strings(file)

    score = 0

    for round in rounds
        enemy_move = round[1:1]
        my_move = round[3:3]
        move = move_scores[my_move]
        victory = victory_score(my_move, enemy_move)
        score += move
        score += victory
    end

    return score
end


function part2(file)    
    victory_score = Dict([
        ("X", 0),
        ("Y", 3),
        ("Z", 6),
    ])

    move_scores_dict = Dict([
        ("A", 1),
        ("B", 2),
        ("C", 3),
    ])

    #Outcome
    # X: Lose
    # Y: Draw
    # Z: Win

    #Moves
    # A: Rock
    # B: Paper
    # C: Scisors

    function move_score(outcome, enemy_move)
        #draw
        if outcome == "Y"
            return move_scores_dict[enemy_move]
        end
        if outcome == "X" && enemy_move == "A" ||
           outcome == "Z" && enemy_move == "B"
            return 3
        end
        if outcome == "X" && enemy_move == "B" ||
           outcome == "Z" && enemy_move == "C"
            return 1
        end
        if outcome == "X" && enemy_move == "C" ||
           outcome == "Z" && enemy_move == "A"
            return 2
        end
    end


    rounds = list_of_strings(file)
    score = 0

    for round in rounds
        enemy_move = round[1:1]
        outcome = round[3:3]
        move = move_score(outcome, enemy_move)
        victory = victory_score[outcome]
        score += move
        score += victory
    end
    return score
end

export part1
export part2

end
