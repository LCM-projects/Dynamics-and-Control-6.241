function r = h04_3(a)

  A_dim = [2,2];

  function y_val = y0(t)
    y_val = sin(t) + a*sin(2*t);
  end

  function A_val = A(t)
    y_val = y0(t);
    A_val = [0,1;-cos(y_val), -0.1];
  end

  function M_dot_vec = odefun(t,M_vec)
    M = reshape(M_vec, A_dim);
    M_dot = A(t)*M;
    M_dot_vec = M_dot(:);    
  end


  M_init = eye(2);
  tspan = [0,2*pi];
  [t,M_vec_soln] = ode45(@(t,M_vec) odefun(t,M_vec), tspan, M_init(:));
  M_vec = M_vec_soln(end,:);
  M = reshape(M_vec, A_dim);
  E = eig(M);
  r = max(norm(E(1)),norm(E(2)));
end
