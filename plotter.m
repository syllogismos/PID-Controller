function plotter(c)
k=decimal(c);
for i=1:30
    x(i)=k(i,1);
    y(i)=k(i,2);
    z(i)=k(i,3);
end
x=x';
scatter3 (x, y, z, 'DisplayName', 'kp, ki, kd'); figure(gcf);

end