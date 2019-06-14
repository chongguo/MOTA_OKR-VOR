function canvasParams = fitcanvas(npnts)

% default number of control points is 10
if nargmin<1
    npnts = 10;
end

canvasPosition=[1921, 361, 1280, 697]; % need to be configured for your own monistor
close all
hf = figure('color','k');
ha = axes(hf,'Position',[0 0 1 1],'color','k');
xlim(ha,[0 1]);
ylim(ha,[0 1]);
set(hf,'menubar','none','NumberTitle','off');
set(hf,'Position',canvasPosition);
[x0,y0] = ginputc(npnts,'Color','w','ShowPoints', true, 'ConnectPoints', true);
[ellipse_t0, X0] = fit_ellipse(x0,y0,ha);

[x1,y1] = ginputc(npnts,'Color','w','ShowPoints', true, 'ConnectPoints', true);
[ellipse_t1,X1] = fit_ellipse(x1,y1,ha);

canvasParams.T0 = ellipse_t0;
canvasParams.T1 = ellipse_t1;
canvasParams.X0 = X0;
canvasParams.X1 = X1;

hold on; 
hline = plot(0,0);
for i= 1:360
    delete(hline)
    hline = plot(ha,[X0(1,i) X1(1,i)],[X0(2,i) X1(2,i)],'w-','LineWidth',2);
    pause(.1)
end