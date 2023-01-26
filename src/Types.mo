import Result "mo:base/Result";
import Trie "mo:base/Trie";
import Principal "mo:base/Principal";
import Nat "mo:base/Nat";
import List "mo:base/List";

module {
    public type Result<T, E> = Result.Result<T, E>;
    public type Account = { owner : Principal; tokens : Tokens };
    public type Proposal = {
        id : Nat;
        votes_no : Tokens;
        voters : List.List<Principal>;
        state : ProposalState;
        timestamp : Int;
        proposer : Principal;
        votes_yes : Tokens;
        payload : ProposalPayload;
    };
    public type ProposalPayload = {
        method : Text;
        canister_id : Principal;
        message : Blob;
    };
    public type ProposalState = {
        #failed : Text;
        #open;
        #executing;
        #rejected;
        #succeeded;
        #accepted;
    };
    public type Tokens = { amount_e8s : Nat };

    public type BasicDaoStableStorage = {
        accounts : [Account];
        proposals : [Proposal];
        // system_params: Syste
    };

    public func account_key(t : Principal) : Trie.Key<Principal> = {
        key = t;
        hash = Principal.hash t;
    };
    public func accounts_fromArray(arr : [Account]) : Trie.Trie<Principal, Tokens> {
        var s = Trie.empty<Principal, Tokens>();
        for (account in arr.vals()) {
            s := Trie.put(s, account_key(account.owner), Principal.equal, account.tokens).0;
        };
        s;
    };
};
