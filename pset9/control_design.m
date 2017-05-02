[a,b,c,d]=linmod('nonsingularmodel1'); % get the matrices a,b,c,d from simulink model
G0=pck(a,b,c,d);nm=1;na=1;             % open-loop system, number of measurements and actuators 
[k,Gc]=h2syn(G0,nm,na)                 % get the optimal controller
[ak,bk,ck,dk] = unpck(k)               % get the state space matrices of the optimal controller

