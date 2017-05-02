function GAM = compute_h_infty(a_temp, w_0_temp)
  % assign the global vars
  global a_tf w_0 
  a_tf = a_temp;
  w_0 = w_0_temp;
  [a,b,c,d]=linmod('ps9_prob3_b_model'); % get the matrices a,b,c,d from simulink model
  %%
  G0=pck(a,b,c,d);nm=1;na=1;             % open-loop system, number of measurements and actuators 
  gmin = 0.01;
  gmax = 100;
  tol = 0.01;
  [k,Gc, GAM]= hinfsyn(G0,nm,na,gmin,gmax,tol);               % get the optimal controller
  [ak,bk,ck,dk] = unpck(k);              % get the state space matrices of the optimal controller
end
