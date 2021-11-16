// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@when[backend == "llvm"]
func main() {
    print("llvm\n")
    return 0
}

@when[backend == "panda"]
func main() {
    print("panda\n")
    return 0
}

@when[backend == "jet"]
func main() {
    print("jet\n")
    return 0
}

@when[backend == "js"]
func main() {
    print("js\n")
    return 0
}