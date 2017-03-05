a_vec = 0.1*[0:20];

for i=1:length(a_vec)
  a = a_vec(i);
  r = h04_3(a);
  if (r > 1)
    disp('--------')
    a
    r
    disp('-------')
    disp('')
  end
  
end
