// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import math.*
from std import format.*

func A(i:Float64,j:Float64){
    var one : Float64 = 1.0
    var two : Float64 = 2.0
    return one/((i+j)*(i+j+one)/two+i+one)
}

func Au(u:Array<Float64>,v:Array<Float64>){
    for (i in 0..u.size()){
        var t : Float64 = 0.0
        for (j in 0..u.size()){
            t += A(Float64(i),Float64(j)) * u[j]
        }
        v[i] = t
    }
}

func Atu(u:Array<Float64>,v:Array<Float64>){
    for (i in 0..u.size()){
        var t : Float64 = 0.0
        for (j in 0..u.size()){
            t += A(Float64(j),Float64(i)) * u[j]
        }
        v[i] = t
    }
}


func AtAu(u:Array<Float64>,v:Array<Float64>,w:Array<Float64>){
    Au(u,w)
    Atu(w,v)
}

func spectralnorm(n:Int64){
    var u = Array<Float64>(n,1.0)
    var v = Array<Float64>(n,0.0)
    var w = Array<Float64>(n,0.0)
    var vv = 0.0
    var vBv = 0.0
    for (i in 0..10){
        AtAu(u,v,w)
        AtAu(v,u,w)
    }
    for (i in 0..n){
        vBv += u[i] * v[i]
        vv += v[i] * v[i]
    }
    return sqrt(vBv/vv)
}

func main(){
    var n = 5500
    print(spectralnorm(n).format("9.9").toString())
}
