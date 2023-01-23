> 1.Is the heap memory saved when upgrading a canister? How much heap memory does a canister has?

Answer:
	It does not. A canister has 4gb of Heap Memory

> 2.How much accounts can a unique Principal own?

Answer: 
	A single Principal may have control over an (almost) unlimited number of Accounts.


> 3.Can we safely upgrade a canister from interface A to interface B?

Interface A

	actor {
	public func greet(surname : Text, firstname : Text) : async Text {
    return "Hello" # firstname # surname # " !";
	};
	}
	```motoko
	
Interface B

	```motoko
	actor {
	public func greet(firstname : Text) : async Text {
    return "Hello" # firstname # " !";
	};
	}

Answer:
	Yes, its possible due to the fact of this code holding 0 information behind it