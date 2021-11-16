// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    return 0;
}

internal var a : (Float32*Enum8) = (-19.0, Enum8.defaultValue);
internal var b : (Float32*Enum8) = (-19.0, Enum8.defaultValue);

enum Enum8{
    defaultValue |
    enumValue183 (Float32*Enum8)
}
