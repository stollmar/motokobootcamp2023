🙋 Questions
> 1. How much is the current memory capacity of a canister?

 Answer: 

Expand stable storage to 48GiB as per the proposal n° 92573 on date: 2022-11-21
Link to proposal: https://dashboard.internetcomputer.org/proposal/92573

> 2. What is the issue with the following code sample?

        actor {
            let counter : Nat = 0;
            public func increment_counter() : async () {
            counter := counter + 1;
            };
        }

Answer: 

let defines a static value, it cannot be modify 

> 3. What is the issue with the following code sample?

        actor {
        var message : Text = 0;

        public query func change_message(new_message : Text) : async () {
        message := new_message;
        return;
        };
  
        public query func see_message() : async Text {
            return(message);
        };
        }

Answer:

1) The variable is declared as type Text, but is not between a ""
2) The first function is a query, and it will always come back as the first variable and will not change to the original variable 

> 4. False or True: we can remove the keyword async for return argument of a query function since queries are faster to answer. 

Answer: 

False