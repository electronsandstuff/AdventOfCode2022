module Day02

using AdventOfCode2022

const part1_win_scores = [
    3 6 0
    0 3 6
    6 0 3
]

const part2_shape_scores = [
    3 1 2
    1 2 3
    2 3 1
]

function day02(input::String = readInput(joinpath(@__DIR__, "data", "day02.txt")))
    total_score1 = 0
    total_score2 = 0
    for round in split(input, '\n')
        try
            opponent_letter, my_letter = filter(x -> !isspace(x), round)
            oppenent_idx = Int(opponent_letter) - Int('A') + 1
            my_idx = Int(my_letter) - Int('X') + 1

            total_score1 += my_idx + part1_win_scores[oppenent_idx, my_idx]
            total_score2 += part2_shape_scores[oppenent_idx, my_idx] + 3*(my_idx - 1)
        catch
        end
    end
    [total_score1, total_score2]
end

end
