# Remove the prefix from a string
@example "Remove the prefix from a string" { "Hello World" | str remove-prefix "Hello " }
export def "str remove-prefix" [prefix: string]: string -> string {
  if ($in | str starts-with $prefix) {
    $in | str substring ($prefix | str length)..
  } else {
    null
  }
}

# Remove the suffix from a string
@example "Remove the suffix from a string" { "Hello World" | str remove-prefix " World" }
export def "str remove-suffix" [suffix: string]: string -> string {
  if ($in | str ends-with $suffix) {
    $in | str substring ..(($in | str length) - ($suffix | str length) - 1)
  } else {
    null
  }
}

# Split a string at every occurrence of a separator
alias "str split" = split row

# Check if a string consists only of ASCII characters
@example "Check if a string consitsts only of ASCII characters" { "Hello World" | str is-ascii }
export def "str is-ascii" []: string -> bool {
  $in
  | split chars
  | each { |c| ($c | into binary | into int) in 0..128 }
  | all {}
}
