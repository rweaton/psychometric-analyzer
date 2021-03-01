function toptitle(string)
% TOPTITLE
%
% Places a title over a set of subplots.
% Best results are obtained when all subplots are
% created and then toptitle is executed.
%
% Usage:
%            h = toptitle('title string')
%          

% Patrick Marchand (prmarchand@aol.com)

titlepos = [.5 1]; % normalized units.

ax = gca;
set(ax,'units','normalized');
axpos = get(ax,'position');

offset = (titlepos - axpos(1:2))./axpos(3:4);

text(offset(1),offset(2),string,'units','normalized',...
     'horizontalalignment','center','verticalalignment','middle');

% Make the figure big enough so that when printed the
% toptitle is not cut off nor overlaps a subplot title.
h = findobj(gcf,'type','axes');
set(h,'units','points');
set(gcf,'units','points')
figpos = get(gcf,'position');
set(gcf,'position',figpos + [0 0 0 15])
set(gcf,'units','pixels');
set(h,'units','normalized');
