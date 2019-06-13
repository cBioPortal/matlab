function cancerStudies = getcancerstudies(cgdsURL, varargin)
%GETCANCERSTUDIES Get cancer studies from the cBio CGDS portal.
%    A = GETCANCERSTUDIES(cgdsURL) loads a list of available cancer types
%    into A. cdgsURL points to the CGDS web API, typically
%    http://www.cbioportal.org/public-portal/.
%
%    The function returns a struct array with the following fields:
%    cancerTypeId, name, description.
%
%    Field names follow column names as returned by the web API.
%
%    A = GETCANCERSTUDIES(cgdsURL, 'verbose', [true | false], 'token', '<some token string>')
%      - set 'verbose' to false to run in silent mode or true to run in verbose mode. Default is false.
%      - set token to a valid token string for private portals.
%
%    See also getgeneticprofiles, getcaselists, getprofiledata,
%    getclinicaldata.

% parse input arguments
[verbose, token] = cgdsparser(varargin{:});

if ~strcmp(cgdsURL(end), '/') cgdsURL(end + 1) = '/'; end

cells  = urlgetcells([cgdsURL 'webservice.do?cmd=getCancerStudies'], verbose, token);

cancerStudies.cancerTypeId = cells(2:end, 1);
cancerStudies.name = cells(2:end, 2);
cancerStudies.description = cells(2:end, 3);
