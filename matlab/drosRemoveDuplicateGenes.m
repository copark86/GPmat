function r = drosRemoveDuplicateGenes(drosexp, r0),

% DROSREMOVEDUPLICATEGENES Remove duplicate probes from ranking.
% FORMAT
% DESC Remove duplicate probes from ranking.
% ARG drosexp : the drosexp data structure from drosLoadData
% ARG r0 : the initial ranking
% RETURN ranking : cleaned ranking
%
% SEEALSO : drosLoadData, drosScoreTFTargetList
%
% COPYRIGHT : Antti Honkela, 2009

% DISIMRANK

[B, I, J] = unique(drosexp.fbgns(r0), 'first');
r = r0(sort(I));

J = strcmp(drosexp.fbgns(r), 'NA');
r = r(~J);
