# IndexedString - an extension to String that allows you to use an integer subscript 

A string in Swift is a collection of extended grapheme clusters, each of which forms one human-readable character. 
In turn, each extended grapheme cluster is a collection of Unicode scalar values.

If a single character or extended grapheme cluster consisted of a single Unicode scalar value, then the String type would have a subscript that accepts an integer index. But since this collection may contain several Unicode scalar values that are combined with each other, there are situations when using an integer subscript may cause errors.

For this reason, the standard String type in Swift has a subscript that takes the `String.Index` type instead of `Int`. In order to access a character in a string by such an index, you have to write cumbersome and inconvenient constructions.

IndexedString is a Swift Package that contains the String extension. It will make your work with String more convenient. You will get the ability to use integer subscript. As a result, operations like cut, delete, replace part of a string are performed very conveniently. In addition, visual presentation of a collection of extended grapheme clusters in String is implemented.

### Advantages of IndexedString

- Access to the extended grapheme cluster, aka character by integer index.
- Convenient implementation of operations of insertion by index, cut, delete, replace part of a string.
- Visual presentation of the collection of extended grapheme clusters in a string and all Unicode value scalars that make up the string.
- All functionality of the String type remains unchanged.

### Limitations

- It is not possible to change the value by index, only get.

### Additional features of API String

```swift
public extension String {}

fromUnicodeScalars /* forms a string consisting of all Unicode scalar values in the string, e.g. "\u{63}\u{61}\u{66}\u{65}\u{301}". If you send this string to print, you will get café. */
extendedGraphemeClusters /* forms a visual representation of the extended grapheme clusters that make up the string, e.g. [\u{63}] - [\u{61}] - [\u{66}] - [\u{65}\u{301}]. */
subscript(index: Int) -> String /* returns an extended grapheme cluster (character) of String type by index. Checking the validity of the index, as in Array, is the responsibility of the programmer. If you enter an index outside the range (0..<count) or the string is empty, you will get a runtime error. */
firstIndex(of symbol: String) -> Int? /* returns the optional first index of an individual character of type String in the string. */
getSubstring(from index1: Int, to index2: Int) -> String /*  returns a string of type String cut from the original string between the specified indices. Checking the validity of the indices is the responsibility of the programmer. If you enter invalid indices or the string is empty, you will get a runtime error. */
removeSubrange(from index1: Int, to index2: Int) -> String /* deletes the part of the string between the specified indices and returns the cut part of the string of type String. Checking the validity of the indices is the responsibility of the programmer. If you enter invalid indices or the string is empty, you will get a runtime error. */
replaceSubrange(from index1: Int, to index2: Int, with str: String) -> String /* replaces the part of the string between the specified indices with a new one and returns the replaced part of the string of type String. Checking the validity of the indices is the responsibility of the programmer. If you enter invalid indices or the string is empty, you will get a runtime error. */
insert(by index: Int, str: String) /* inserts a new part of the string at the specified index. Checking the validity of the index, as in Array, is the responsibility of the programmer. If you enter an index outside the range (0..<count) or the string is empty, you will get a runtime error. */
splitIntoChunks(thick: Int) -> [String] /* converts a string into an array of strings of the specified size. If the string is not split into equal parts, the last element of the array contains the remaining part of the string, e.g. ["aa", "aa", "a"]. */
```

