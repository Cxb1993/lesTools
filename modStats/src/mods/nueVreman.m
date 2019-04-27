function coeff = nueVreman(~, ~, ~, I1, I2, ~, ~, I5)

% DESCRIPTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Compute the reduced coefficient of the isotropized version of Vreman's eddy 
% viscosity model.
%
% INPUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% I1        double -- Combined invariant of the rate-of-strain and rate-of-
%               rotation tensors given by I1 = trace(S^2).
%
% I2        double -- Combined invariant of the rate-of-strain and rate-of-
%               rotation tensors given by I2 = trace(W^2).
%
% I5        double -- Combined invariant of the rate-of-strain and rate-of-
%               rotation tensors given by I5 = trace(S^2 W^2).
%
% OUTPUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% coeff     double -- Reduced model coefficient.
%
% LICENSE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Copyright (c) 2016-2019 Maurits H. Silvis
%
% This file is subject to the terms and conditions defined in
% the MIT License, which can be found in the file 'license.txt'
% that is part of this source code package.
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Compute the reduced model coefficient
% Compute the required invariants of G G^T
PGGT = I1 - I2;
QGGT = 1 / 4 * (I1 + I2)^2 + 4 * (I5 - 1 / 2 * I1 * I2);

% Store the denominator
den = PGGT;

% Store the numerator
num = QGGT;

% Analytically, both the numerator and denominator are nonnegative
% Check if the numerator and denominator are positive numerically
if num > 0 && den > 0
    % Yes, compute the reduced model coefficient, i.e., compute the model
    % coefficient without model constant and length scale
    coeff = sqrt(num / den);
else
    % No, set the reduced model coefficient to zero
    coeff = 0;
end

end
