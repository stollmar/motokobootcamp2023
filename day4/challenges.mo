import List "mo:base/List";
import Buffer "mo:base/Buffer";
import Array "mo:base/Array";
import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";
import Blob "mo:base/Blob";

actor {

// 1. Write a function unique that takes a list l of type List and returns a new list with all duplicate elements removed.

	let usernames = HashMap.HashMap<Principal, Text>(0, Principal.equal, Principal.hash);

	func unique<T>(l : List.List<T>, equal: (T,T) -> Bool) : List.List<T> {
		let buffer : Buffer.Buffer<T> = Buffer.fromArray<T>(List.toArray(l));
		let uniques	: Buffer.Buffer<T> = Buffer.Buffer<T>(buffer.size());
		for (b in buffer.vals()) {
			if (Buffer.contains(uniques, b, equal) == false) {
				uniques.add(b);
			};
		};
		return List.fromArray(Buffer.toArray<T>(buffer));	
	};

// 2. Write a function reverse that takes l of type List and returns the reversed list.

	func reverse<T>(l : List.List<T>) : List.List<T> {
		let a : [var T] = Array.thaw(List.toArray(l));
		if (a.size() == 0) {
			return l;
		};
		var index : Nat = a.size() - 1;
		List.iterate(l, func (x : T) {
			if (index >= 0) {
				a[index] := x;
				if (index > 0) index -= 1;
			}
		});
		return List.fromArray(Array.freeze(a));
	};
// 3. Write a function is_anonymous that takes no arguments but returns a Boolean indicating if the caller is anonymous or not.
	
	public shared ({caller}) func is_anynomous() : async Bool {
		return Principal.isAnonymous(caller);
	};

// 4. Write a function find_in_buffer that takes two arguments, buf of type Buffer and val of type T, and returns the optional index of the first occurrence of "val" in "buf".

	func find_in_buffer<T>(buf: Buffer.Buffer<T>, val: T, equal: (T,T) -> Bool) : ?Nat {
		var index : Nat = 0;
		for (b in buf.vals()) {
			if (equal(b, val)) {
				return ?index;
			};
			index += 1;
		};
		return null;
	};

// 5.Add a function called get_usernames that will return an array of tuples (Principal, Text) which contains all the entries in usernames.

	public shared ({ caller }) func add_username(name : Text) : async () {
		usernames.put(caller, name);
	};

	public shared ({ caller }) func get_usernames() : async [(Principal, Text)] {
		return Iter.toArray<(Principal, Text)>(usernames.entries());
	};
}