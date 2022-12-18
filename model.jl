using Pkg
Pkg.add("DataFrames")
Pkg.add("BenchmarkTools")
Pkg.add("GLM")
using DataFrames
using Random
using GLM
using BenchmarkTools
include("image.jl")

design_matrix = ProcessingDesignMatrix("George_W_Bush","top")

y_matrix = ProcessingDesignMatrix("George_W_Bush","bot")

df = DataFrame(design_matrix,:auto)

df[!,"y"] = y_matrix[:,1]

#x = coef(lm(Term(:SepalLengthCm) ~ sum(Term.(Symbol.(names(df, Not(:SepalLengthCm))))),df)) 
print("Starting regression...")
x = coef(lm(Term(:y) ~ sum(Term.(Symbol.(names(df, Not(:y))))),df))
println(x)
print("Finished regression!")

#y_matrix[:,1]