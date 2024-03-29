function mp_prob4()
%input 
yi = input('Initial height: ');
v = input('Velocity: ');
A = input('Angle in degrees: ');
ax = input('Acceleration in the x-component: ');
ay = input('Acceleration in the y-component: ');

if ay == 0
    error('Your acceleration in the y-component is invalid')
else
%%%%%%Calculation%%%%%%%%
vxi = v*cosd(A); %velocity in x
vyi = v*sind(A); %velocity in y

%%time based on y, ( y = vyi*t -(1/2)*ay*(t^2)); y= -yi
%use quadratic formula to get the time 
a = -(1/2)*ay;
b = vyi;
c = yi;
tfinal = roots([a, b, c]);
%get only the positive t
tf = max(tfinal); 

%distance
xmax = (vxi*tf)+(1/2)*(ax*(tf^2)); 
vx = vxi + ax*tf; %velocity in x
vy = vyi + ay*tf; %velocity in y
vf = sqrt(vx^2 + vy^2);
%create a time 0 - tf
t = linspace(0, tf,1000);
x = vxi.*t+(1/2)*ax.*t.^2;
y = yi + vyi.*t-(1/2)*ay.*t.^2;


plot(x,y)
xlabel 'x distance';
ylabel 'y distance';
axis equal
end