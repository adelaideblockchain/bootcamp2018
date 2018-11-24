pragma solidity ^0.4.24;

contract Election {

	struct Candidate {
		string name;
		uint voteCount;
	}

	struct Voter {
		//Have they alreayd voted
		bool voted;
		//Who they voted for
		uint voteIndex;
		uint weight; 
	}

	//Keeping track of the owner of the contract as they will have special rights to authorize voters
	address public owner;
	string public name;

	//Mapping to store voters information && a dynamically sized array -> [] of candidates taht wiil be initialised on construction
	mapping(address => Voter) public voters;
	Candidate[] public candidates;

	//Keeping time of when election ends by using an interger timestamp
	uint public auctionEnd;

	event ElectionResults(string name, uint voteCount);

	//initialising list of candidates --> Name of election, duration, name of candidates ( string[] candidateNames Nested array is not yet
	//implemented as function in solidity cannot accept or return 2D arrays, as under the hood string[] --> 2D array of bytes32)
	function Election(string _name, uint durationMinutes, string candidate1, string candidate2){

		//Set the action end variable from when the conteract is deployed to when it is set to end in mins
		// 'now' is a global variable which is an alias to block.timestamp. It returns a unix timestamp corresponding to ther block creation time
		owner = msg.sender;
		name = _name;
		auctionEnd = now + (durationMinutes * 1 minutes); //--> Solidity has many time units: minutes, days, months


		//Defining candidate objects 
		candidates.push(Candidate(candidate1,0));
		candidates.push(Candidate(candidate2,0));

	}

	//authorise function thta allows owner of contract to give voting rights to any address
	function authorise(address voter){
		require(msg.sender == owner);
		require(!voters[voter].voted);

		//voters[voter] = Voter(false,0); //When initialsing with false and 0, these are already the preset of the mapping
										//The implication being that anyone would be able to participate in the election --> weight field

		//This will allow for the votes to only count fo rusers we allocate with the weight of 1
		voters[voter].weight= 1;
 
	}

	//Now to define the vote function to allow any authorise voter to... Vote!
	//Anyone can access the list of candidates since we have made them public

	function vote(uint voteIndex){

		//First, checking if the time to vote has not passed
		require(now < auctionEnd);
		//Check is sender has not already voted before
		require(!voters[msg.sender].voted);

		//We then record the vote and set a flag to make sure the voter 
		//can no longer clal vote without an exception
		voters[msg.sender].voted = true;
		voters[msg.sender].voteIndex = voteIndex;

		//The last step is to increase the vote count to the specified candiatte by the 
		//amount of weight given to the voter --> Still allows anyone to vote, but only auth. voters will have weight
		candidates[voteIndex].voteCount += voters[msg.sender].weight;
	}


	//End function for the owner to end the election  --> Wanna mamke sure owner cant end prior to time having passed
	function end(){
		//Requires the message sender to be the owner
		require(msg.sender == owner);
		//Requires that the time passed be greater than that of the election set time
		require(now >= auctionEnd);

		//Announce the results which will include the candidate name and how many votes they got
		for(uint i=0; i<candidates.length; i++){
			ElectionResults(candidates[i].name, candidates[i].voteCount);
		}
	}
}