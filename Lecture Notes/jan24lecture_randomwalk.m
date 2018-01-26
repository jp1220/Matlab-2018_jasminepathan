%randomwalk
nsteps=20;
timepoints=0:.1:2;

forwardspeed=0.03;
noise=0.8;
stepsize=5;

footposition(1)=0;
for i=2:length(timepoints)
    footposition(i)=footposition(i-1) + ...
    forwardspeed + ...
    (noise*randn(1,1));

if footposition(i)>=stepsize
    footposition(i:length(timepoints))=0;
    i=length(timepoints)+1;
end
end

plot(timepoints, footposition)
