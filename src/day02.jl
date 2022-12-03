module Day02

using AdventOfCode2022

win_scores = [
    3 6 0
    0 3 6
    6 0 3
]

function day02(input::String = readInput(joinpath(@__DIR__, "data", "day02.txt")))
    total_score = 0
    for round in split(input, '\n')
        try
            opponent_shape, my_shape = filter(x -> !isspace(x), round)
            shape_score = Int(my_shape) - Int('W')
            win_score = win_scores[Int(opponent_shape) - Int('A') + 1, Int(my_shape) - Int('W')]
            total_score += shape_score + win_score
        catch
        end
    end
    [total_score]
end

end
