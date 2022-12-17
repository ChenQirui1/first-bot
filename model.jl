using Pkg
Pkg.add("CSV")
Pkg.add("DataFrames")
Pkg.add("BenchmarkTools")
Pkg.add("GLM")
using CSV
using DataFrames
using Random
using GLM
using BenchmarkTools


df = CSV.read("Iris.csv", DataFrame)

#Declaring global varib
X = hcat(ones(150),Matrix(df[:,2:4])) #design matrix
#θ = Vector{Float64}(undef,size(X)[2])  
#rand!(θ,1:100)
y = df[:,5]

x = coef(lm(Term(:SepalLengthCm) ~ sum(Term.(Symbol.(names(df, Not(:SepalLengthCm))))),df)) 



