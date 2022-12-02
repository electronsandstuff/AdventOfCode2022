using AdventOfCode2022
using Test

function day01(input::String = readInput(joinpath(@__DIR__, "data", "day01.txt")))
    out = [[0]]
    for w in split(input, '\n')
        if length(w) > 0
            push!(last(out), parse(Int, w))
        else
            push!(out, [0])
        end
    end
    out = [sum(x) for x in out]

    [maximum(out), sum(sort(out, rev=true)[1:3])]
end

@testset begin
@test day01("1000
2000
3000

4000

5000
6000

7000
8000
9000

10000") == [24000, 45000]
end

day01()