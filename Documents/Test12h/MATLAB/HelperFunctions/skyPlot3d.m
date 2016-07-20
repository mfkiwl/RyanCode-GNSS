function [xx,yy,zz] = skyPlot3d(varargin)
%skyPlot3d Generate 3d SkyPlot.
% Inputs:
%           az(:,1) - Azimuths, degrees
%           el(:,1) - Elevations, degrees
%           PRNs
% Optional inputs:
%           N - divisions (default 30�)
%           Axes handle
% Based on:
%   SPHERE
%   Clay M. Thompson 4-24-91, CBM 8-21-92.
%   Copyright 1984-2002 The MathWorks, Inc. 
%   $Revision: 5.8.4.1 $  $Date: 2002/09/26 01:55:25 $
tic
error(nargchk(3,5,nargin));
[cax,args,nargs] = axescheck(varargin{:});

n = 30;
divs=6;
if nargs > 3, colorSpec = args{4}; end
az = args{1};
el= args{2};
prn=args{3};
az=(pi/2)-az.*(pi/180);
el=el.*(pi/180);

cosel = cos(el);% cosphi(1) = 0; cosphi(n+1) = 0;
sinaz = sin(az);% sintheta(1) = 0; sintheta(n+1) = 0;

satx = cosel.*cos(az);
saty = cosel.*sinaz;
satz = sin(el);

% -pi <= theta <= pi is a row vector.
% -pi/2 <= phi <= pi/2 is a column vector.
theta = (-n:2:n)/n*pi;
phi = (0:1:n)'/n*pi/2;
cosphi = cos(phi);% cosphi(1) = 0; cosphi(n+1) = 0;
sintheta = sin(theta);% sintheta(1) = 0; sintheta(n+1) = 0;

x = cosphi*cos(theta);
y = cosphi*sintheta;
z = sin(phi)*ones(1,n+1);

hold on;
plot3(satx,saty,satz,colorSpec);
% plot3(0,0,0,'r.');
text(satx(floor(length(satx)/2)),saty(floor(length(saty)/2)),satz(floor(length(satz)/2)),num2str(prn(1)),'color',colorSpec(2),'FontWeight','bold','FontSize',14);

if nargout == 0
    cax = newplot(cax);
    surf(x,y,z,'parent',cax);
    colormap bone;
    alpha(.4);
    shading interp;
    zlim([0 2]);
    axis(cax, 'off');
    view(0,60);
    
%     for i = 1:size(satx,1)
%         plot3([0 satx(i)]',[0 saty(i)]',[0 satz(i)]','r');
%         text(satx(i),saty(i),satz(i)+0.1,num2str(prn(i)),'color','r','FontWeight','bold','FontSize',12);
%     end
    for j=1:n+1
        xc(j)=cos((j-1)*2*pi/n);
        yc(j)=sin((j-1)*2*pi/n);
    end
    for i = 1:divs-1
        plot3(xc*cos(i*pi/(2*divs)),yc*cos(i*pi/(2*divs)),ones(1,n+1)*sin(i*pi/(2*divs)),'k:');
        text(0,-cos(i*pi/(2*divs)),sin(i*pi/(2*divs)),['  ',num2str(floor(i*90/divs))]);
    end
    tc = get(cax, 'xcolor');
    %--- Find spoke angles ----------------------------------------------------
    % Only divs lines are needed to divide circle into 12 parts
    th = (1:divs) * 2*pi / (2*divs);

    %--- Convert spoke end point coordinate to Cartesian system ---------------
    cst = cos(th); snt = sin(th);
    cs = [cst; -cst];
    sn = [snt; -snt];

    %--- Plot the spoke lines -------------------------------------------------
    line(sn, cs, 'linestyle', ':', 'color', tc, 'linewidth', 0.5, ...
        'handlevisibility', 'off');
    rt = 1.1;

    for i = 1:max(size(th))

        %--- Write text in the first half of the plot -------------------------
        text(rt*snt(i), rt*cst(i), int2str(i*30), ...
            'horizontalalignment', 'center', 'handlevisibility', 'off');

        if i == max(size(th))
            loc = int2str(0);
        else
            loc = int2str(180 + i*30);
        end

        %--- Write text in the opposite half of the plot ----------------------
        text(-rt*snt(i), -rt*cst(i), loc, ...
            'handlevisibility', 'off', 'horizontalalignment', 'center');
    end
else
    xx = x; yy = y; zz = z;
    
end
toc