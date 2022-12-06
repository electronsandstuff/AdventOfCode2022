module Day03

using AdventOfCode2022

charscore(x) = Int(x) - (Int(x) <= Int('Z') ? Int('A') - 27 : Int('a') - 1)

function first_repeat(as, bs)  # Faster than set intersection
    for a in as; for b in bs
        if a == b
            return a
        end
    end; end
end

function day03(input::String = readInput(joinpath(@__DIR__, "data", "day03.txt")))
    rucksacks = [strip(x) for x in split(input, '\n') if !isempty(x)]

    score1 = 0
    for rucksack in rucksacks
        score1 += charscore(first_repeat(rucksack[1:length(rucksack)÷2], rucksack[length(rucksack)÷2+1:end]))
    end

    score2 = 0
     for a in zip(rucksacks[1:3:end], rucksacks[2:3:end], rucksacks[3:3:end])
        score2 += charscore(intersect(a...)[1])
    end 

    [score1, score2]
end

end
