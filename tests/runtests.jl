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