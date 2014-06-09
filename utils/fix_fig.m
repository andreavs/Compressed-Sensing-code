function fix_fig( h )
%FIX_FIG Summary of this function goes here
%   Detailed explanation goes here

axis_size = 20; 
label_size = 20; 
legend_size = 20;
title_size = 26; 
interpreter = 'latex'; 
fonttype = 'Abyssinica SIL';

c = findobj(h, 'Type', 'axes', 'Tag', '');
for i=1:(length(c))
    axeshandle = c(i);
    %axeshandle = get(currentchild,'CurrentAxes');
    set(axeshandle, 'Fontsize', axis_size);
    legendhandle = findobj(h, 'Type', 'axes', 'Tag', 'legend');
    set(legendhandle, 'fontsize', legend_size, 'interpreter', interpreter, 'fontname',fonttype)

    xaxishandle = get(axeshandle, 'XLabel');
    set(xaxishandle,'fontsize',label_size, 'interpreter', interpreter,'fontname',fonttype)
    yaxishandle = get(axeshandle, 'YLabel');
    set(yaxishandle,'fontsize',label_size, 'interpreter', interpreter,'fontname',fonttype)
    zaxishandle = get(axeshandle, 'ZLabel');
    set(zaxishandle,'fontsize',label_size, 'interpreter', interpreter,'fontname',fonttype)
    titlehandle = get(axeshandle, 'Title'); 
    set(titlehandle, 'fontsize', title_size, 'interpreter', interpreter,'fontname',fonttype);
    
end
set(h, 'position', [1000, 200, 700, 600])

end

