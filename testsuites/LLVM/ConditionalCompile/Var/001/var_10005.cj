// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT:scan builtin condition 'os' do not support ' linux'

@when[os == " linux"]
func main() {
    return 0
}
