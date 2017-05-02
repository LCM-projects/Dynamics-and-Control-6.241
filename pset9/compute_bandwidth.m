function w_0_avg = compute_bandwidth(a)
  % global a_tf w_0;
  w_0_min = 0.1;
  w_0_max = 40;
  gamma_min = compute_h_infty(a, w_0_min);
  gamma_max = compute_h_infty(a, w_0_max);

  if (gamma_min > 1) || (gamma_max < 1)
    error('bad initial bounds')
  end

  tol = 0.01

  function [w_0_min, w_0_max, w_0_avg, gamma_avg] = bisect(w_0_min, w_0_max)
    w_0_avg = 1/2.0*(w_0_min + w_0_max);
    gamma_avg = compute_h_infty(a, w_0_avg);
    if gamma_avg <= 1
      w_0_min = w_0_avg;
    else
      w_0_max = w_0_avg;
    end
  end

  while(true)
    [w_0_min, w_0_max, w_0_avg, gamma_avg] = bisect(w_0_min, w_0_max);

    % termination criterion
    if abs(gamma_avg - 1) < tol
      break;
    end
  end


end
