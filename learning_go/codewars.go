import (
"strings"
)
/*
Write a function that takes in a string of one or more words, and returns the same string, but with all five or more letter words reversed (like the name of this kata).

Strings passed in will consist of only letters and spaces.
Spaces will be included only when more than one word is present.
*/

import "strings"

func SpinWords(str string) string {
  words := strings.Split(str, " ")
  for i, word := range words {
    if len(word) > 4 {
      words[i] = Reverse(word)
    }
  }
  return strings.Join(words, " ")
}

func Reverse(s string) (r string) {
    for _, c := range s {
        r = string(c) + r
    }
    return r
}


// Basically the same as the top rated solution besides my Reverse function


/*
Complete the method/function so that it converts dash/underscore delimited words into camel casing. The first word within the output should be capitalized only if the original word was capitalized (known as Upper Camel Case, also often referred to as Pascal case).
*/
func ToCamelCase(s string) string {
  words := strings.FieldsFunc(s, Delimiters)
  if len(words) == 0 { 
    return ""
  }
  res := words[0]
  for _, word := range words[1:] {
    res += strings.Title(word)
  }
  return res
}

func Delimiters(r rune) bool { 
  return r == '_' || r == '-'
}

// It seems like using regex is the better solution. I think it's fine that I used a separate function so I could swap the delimiters when needed


/*
Implement a method that accepts 3 integer values a, b, c. The method should return true if a triangle can be built with the sides of given length and false in any other case.
*/


func IsTriangle(a, b, c int) bool {
  return a + b > c && a + c > b && b + c > a && a > 0 && b > 0 && c > 0 
}

// Wordy and too long of a line but it's the solution


/*
More generally: given two speeds v1 (A's speed, integer > 0) and v2 (B's speed, integer > 0) and a lead g (integer > 0) how long will it take B to catch A?

The result will be an array [hour, min, sec] which is the time needed in hours, minutes and seconds (round down to the nearest second) or a string in some languages.

If v1 >= v2 then return nil, nothing, null, None or {-1, -1, -1} for C++, C, Go, Nim, Pascal, [-1, -1, -1] for Perl,[] for Kotlin or "-1 -1 -1".
*/


func Race(v1, v2, g int) [3]int {
  if v1 >= v2 {
    return [3]int{-1, -1, -1}
  }
  t := 0.0 - float64(g) / float64(v1 - v2)
  return [3]int{int(math.Floor(t)), int(math.Floor(math.Mod(t * 60, 60))), int(math.Floor(math.Mod(t * 3600, 60)))}
}

// Basically the right solution, just with a very messy looking time conversion


/*
Return the number (count) of vowels in the given string.

We will consider a, e, i, o, u as vowels for this Kata (but not y).

The input string will only consist of lower case letters and/or spaces.
*/


func GetCount(str string) (count int) {
  for _, vowel := range []string{"a", "e", "i", "o", "u"} {
    count += strings.Count(str, vowel)
  }
  return count
}


/*
Write a simple parser that will parse and run Deadfish.

Deadfish has 4 commands, each 1 character long:

i increments the value (initially 0)
d decrements the value
s squares the value
o outputs the value into the return array
Invalid characters should be ignored.
*/

func Parse(data string) []int{
  returnArray := []int{}
  value := 0
  commands := strings.Split(data, "")
  for _, command := range commands {
    switch command {
      case "i":
          value++
      case "d":
          value--
      case "s":
          value = value * value
      case "o":
          returnArray = append(returnArray, value)
    }
  }
  return returnArray
}

// Almost exactly the top solution, so I'm satisfied for this situation.