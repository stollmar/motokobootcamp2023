🙋 Questions
> 1. Who controls the ledger canister?
Answer: 
    The NNS (Network Nervous System) Controls this canister, under the ID r7inp-6aaaa-aaaaa-aaabq-cai or NNS Root

> 2. What is the subnet of the canister with the id: mwrha-maaaa-aaaab-qabqq-cai? How much nodes are running this subnet?
Answer:
    The Subnet is: pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe
    The amount of Nodes runing on this subnet is: 16

Source: https://dashboard.internetcomputer.org/subnet/pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe

> 3. i have a neuron with 1O ICPs locked with a dissolve delay of 4 years - my neuron has been locked for 2 years. What is my expected voting power?

     The voting power of a locked neuron is determined by several factors:

    1) Principally, by its stake. 1 ICP = the power of 1 vote.
    2) Next, by its lock up duration, or dissolve delay. 6 months grants a 1.06x voting power bonus, and 8 years grants 2x. All other durations scale linearly between.
    3) Lastly, by its age, or length of time spent locked up without dissolving. 4 years grants a 1.25x bonus, multiplicative with any other bonuses. All other durations between 0 seconds and 4 years scale linearly between.

So base on this our equation shall be: "10 * 1.498 * 1.125 = 16,8525"

So your voting power is 16,8525

Source: https://internetcomputer.org/docs/current/tokenomics/nns/nns-staking-voting-rewards/#voting-power