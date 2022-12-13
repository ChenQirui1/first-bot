Pkg.add("Images")
using Random
using Images

@btime img = rand(2000,2000)
@btime imgg = Gray.(img)