import Trie "mo:base/Trie";
import Types "./Types";
import Principal "mo:base/Principal";
import Nat "mo:base/Nat";

shared actor class DAO(init : Types.BasicDaoStableStorage) = Self {
    stable var accounts = Types.accounts_fromArray(init.accounts);

    stable var next_proposal_id : Nat = 0;

    func account_get(id : Principal) : ?Types.Tokens = Trie.get(accounts, Types.account_key(id), Principal.equal);
    func account_put(id : Principal, tokens : Types.Tokens) {
        accounts := Trie.put(accounts, Types.account_key(id), Principal.equal, tokens).0;
    };
};
