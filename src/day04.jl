module Day04

using AdventOfCode2022


function day04(input::String = readInput(joinpath(@__DIR__, "data", "day04.txt")))
    sections = eachsplit(input, [',', '-', '\n'], keepempty=false)
    sections = [parse(Int, x) for x in sections]
    sections = reshape(sections, 4, size(sections)[1]÷4)

    score1 = 0
    score2 = 0
    for pair in eachcol(sections)
        a = pair[1]:pair[2]
        b = pair[3]:pair[4]
        score1 += a ⊆ b || b ⊆ a
        score2 += ~isempty(intersect(a, b))
    end

    [score1, score2]
end

end
