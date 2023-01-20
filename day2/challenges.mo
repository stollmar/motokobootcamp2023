import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Char "mo:base/Char";
import Iter "mo:base/Iter";
import Buffer "mo:base/Buffer";

actor {

	// 1. Write a function average_array that takes an array of integers and returns the average value of the elements in the array.
	public func average_array(array: [Int]) : async Int {
		var tot: Int = 0;
		for (x in array.vals()) {
			tot += x;
		};
		return tot / array.size();
	};

	// 2. Character count: Write a function that takes in a string and a character, and returns the number of occurrences of that character in the string.
	public func count_character(t : Text, c : Text) : async Nat {
	    var count: Nat = 0;
		for (char in t.chars()) {
			if (Char.toText(char) == c) {
				count += 1;
			};
		};
    	return count;
	};

	// 3. Write a function factorial that takes a natural number n and returns the factorial of n.
	public func factorial(n : Nat) : async Nat {
      	if(n == 0){
      		return 1;
		} else {
			var result : Nat = 1;
			let iter = Iter.range(1, n);
			for(i in iter){
				result := result * i;
			};
			return result;
		}
	};



	// 4. Write a function number_of_words that takes a sentence and returns the number of words in the sentence.
    public func number_of_words(text : Text) : async Nat {
	    var count: Nat = 0;
		if (text.size() > 0) {
			count += 1;
		};
		for (nw in text.chars()) {
			if (nw == ' ') {
				count += 1;
			};
		};
		return count;
	};

	// 5. Write a function find_duplicates that takes an array of natural numbers and returns a new array containing all duplicate numbers. The order of the elements in the returned array should be the same as the order of the first occurrence in the input array.
	public func is_on_array(a: [Nat], n: Nat) : async Bool {
		var result : [Nat] = [];
		var i : Nat = 0;
		var treated : HashMap.HashMap<Nat, Nat> = HashMap.HashMap<Nat, Nat>(10, Nat.equal, Hash.hash);
		while(i < a.size()) {
			var j : Nat = i;
			while(j > 0) {
				j -= 1;
				if(a[i]==a[j]) {
				var check = treated.get(a[j]);
				switch(check) {
					case(?value) { 
					j := 0;
					};
					case(_) { 
					result := Array.append<Nat>(result, [a[j]]);
					treated.put(a[j], a[j]);
					j := 0;
					};
				};
				};
			};
			i += 1;
		};
		return result;

	};

	
	// 6. Write a function convert_to_binary that takes a natural number n and returns a string representing the binary representation of n.
	public func convert_to_binary(n : Nat) : async Text {
		var result : Text = "";
		var rest : Nat = 0;
		var number : Nat = n;
		loop {
			rest := number % 2;
			number := (number-rest)/2;
			result := Nat.toText(rest) # result;

			if(number < 2) {
				if(number == 1) {
				result := "1" # result;
				};
				return result;
			};
		};
	};
}