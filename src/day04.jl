module Day04

using AdventOfCode2022

parseline2(xs) = [parse(Int, x) for x in eachsplit(xs, [',', '-'])]

function day04(input::String = readInput(joinpath(@__DIR__, "data", "day02.txt")))
    sections = [parse(Int, x) for x in eachsplit(input, [',', '-', '\n'], keepempty=false)]
    sections = reshape(sections, 4, size(sections)[1]÷4)

    score1 = 0
    for pair in eachcol(sections)
        if max(pair[2] - pair[1], pair[4] - pair[3]) == (max(pair[2], pair[4]) - min(pair[1], pair[3]))
            score1 += 1
        end
    end

    score2 = 0
    for pair in eachcol(sections)
        if (pair[2] - pair[1] + 1) + (pair[4] - pair[3] + 1) > (max(pair[2], pair[4]) - min(pair[1], pair[3]) + 1)
            score2 += 1
        end
    end
    [score1, score2]
end

end
