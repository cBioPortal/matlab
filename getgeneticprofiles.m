function geneticProfiles = getgeneticprofiles(cgdsURL, cancerTypeId, varargin)
%GETGENETICPROFILES Get genetic profiles from the cBio CGDS portal.
%    A = GETGENETICPROFILES(cgdsURL, cancerTypeId) loads a list of
%    available genetic profiles into A. cdgsURL points to the CGDS web API,
%    typically http://www.cbioportal.org/public-portal/. cancerTypeId is
%    the cancer type ID, as returned by the getcancertypes function.
%
%    The function returns a struct array with the following fields:
%    geneticProfileId, geneticProfileName, geneticProfileDescription,
%    cancerTypeId, geneticAlterationType.
%
%    Field names follow column names returned by the web API.
%
%    A = GETGENETICPROFILES(cgdsURL, cancerTypeId, 'verbose', [true | false], 'token', '<some token string>')
%      - set 'verbose' to false to run in silent mode or true to run in verbose mode. Default is false.
%      - set token to a valid token string for private portals
%
%    See also getcancertypes, getcaselists, getprofiledata,
%    getclinicaldata.

[verbose, token] = cgdsparser(varargin{:});
if ~strcmp(cgdsURL(end), '/') cgdsURL(end + 1) = '/'; end

cells  = urlgetcells([cgdsURL 'webservice.do?cmd=getGeneticProfiles&cancer_type_id=' cancerTypeId], verbose, token);

geneticProfiles.geneticProfileId = cells(2:end, 1);
geneticProfiles.geneticProfileName = cells(2:end, 2);
geneticProfiles.geneticProfileDescription = cells(2:end, 3);
geneticProfiles.cancerTypeId = cells(2:end, 4);
geneticProfiles.geneticAlterationType = cells(2:end, 5);
