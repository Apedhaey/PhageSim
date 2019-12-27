
@testset "updating phages" begin

    grid = rand(1:100, 50, 50)
    R = regions(grid)
    nphages = sum(grid)

    # check mass balances
    @test sum(updatephages!(grid, R)) == nphages


    @test_throws AssertionError updatephages!(grid, R, pdecay=1.2)
    @test sum(updatephages!(grid, R, pdecay=0.5)) < nphages
    @test sum(updatephages!(grid, R, poissonapprox=true, pdecay=1)) == 0
end
