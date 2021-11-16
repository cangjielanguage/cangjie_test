// DEPENDENCE: ../src 
// EXEC: %compiler %cmp_opt -c src/directory_0/directory_1/a.cj -o a.%middle
// EXEC: %compiler %cmp_opt -c src/directory_0/directory_1/b.cj -o b.%middle  
// EXEC: %compiler %cmp_opt -c src/directory_0/c.cj -o c.%middle  
// EXEC: %compiler %cmp_opt %f   a.%middle b.%middle c.%middle -o %output
// EXEC: %run %run_opt %output %run_args


func main() {
    return 0
}