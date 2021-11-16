// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type Point2D = Float64*Float64
type Point3D = Float64*Float64*Float64

func main(){
    let point1: Point2D = (0.5, 0.8)
    let point2: Point3D = (0.5, 0.8, 1.1)
    return 0
}

