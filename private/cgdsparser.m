function [verbose, token] = cgdsparser(varargin)
% Parses varargin and returns values for 'verbose' and 'token'.
% Output:
%   - verbose = [true | false], optional argument. Default is false.
%   - token = data authentication token. Default is empty string.

p = inputParser;
addOptional(p, 'verbose', false);
addOptional(p, 'token', '');
parse(p,varargin{:})
verbose = p.Results.verbose;
token = p.Results.token;
end

