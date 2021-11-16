// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output

@differentiable
record Point {
    let x: Float64
    let y: Float64
    let z: Float64

    @differentiable
    init(x1: Float64, y1: Float64, z1: Float64) {
        x = x1
        y = y1
        z = z1
    }
}

@differentiable
func f(x: Float64, y: Float64, z: Float64): Float64{
    var p = Point(x,y,z)
    while (x > 0.1){
        p.x
        p.y
        p.z
    }
    return x
}

func main(){
    return 0
}