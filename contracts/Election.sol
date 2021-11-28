pragma solidity >= 0.4.11;

contract Election {
    
    address deployed;
    // Schema of Candidate class
    struct Candidate {
        uint candidate_id;
        string candidate_name;
        uint candidate_no_of_votes;
    }

    mapping(address => bool) public voters;         //map to keep track of voters who already voted
    mapping(uint => Candidate) public candidates;  //to access candidates using index
    uint public no_of_candidates = 0;

    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
        addCandidate("Candidate 3");
    }

    function addCandidate (string memory _name) public {
        no_of_candidates ++;
        candidates[no_of_candidates] = Candidate(no_of_candidates, _name, 0);
    }

    function vote (uint _candidateId) public {
        
        require(!voters[msg.sender]);

        
        require(_candidateId > 0 && _candidateId <= no_of_candidates);

       
        voters[msg.sender] = true;


        candidates[_candidateId].candidate_no_of_votes ++;
    }
}
