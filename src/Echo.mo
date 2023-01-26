actor Echo {

    stable var counter = 0;

    public query func say(phrase : Text) : async Text {
        return phrase;
    };

    public query func get() : async Nat {
        return counter;
    };

    public func set(n : Nat) : async () {
        counter := n;
    };

    public func inc() : async () {
        counter += 1;
    };
};
