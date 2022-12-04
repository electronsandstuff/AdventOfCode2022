using AdventOfCode2022
using Test

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

@testset begin
    @test day02("A Y
    B X
    C Z") == [15, 12]
end

@testset begin
    @test day03("vJrwpWtwJgWrhcsFMMfFFhFp
    jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
    PmmdzqPrVvPwwTWBwg
    wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
    ttgJtRGJQctTZtZT
    CrZsJsPPZsGzwwsLwLmpwMDw") == [157, 70]
end

@testset begin
    @test day04("2-4,6-8
    2-3,4-5
    5-7,7-9
    2-8,3-7
    6-6,4-6
    2-6,4-8") == [2, 4]
end