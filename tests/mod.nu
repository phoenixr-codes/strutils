use std/assert
use ../strutils ["str remove-prefix" "str remove-suffix" "str is-ascii"]

assert equal ("Hello Nushell" | str remove-prefix "Hello ") "Nushell"
assert equal ("Hello Nushell" | str remove-suffix " Nushell") "Hello"
assert ("Hello Nushell" | str is-ascii)
assert not ("Liebe Grüße" | str is-ascii)
