% /*
%   * ################################################################
%   *
%   * ProActive Parallel Suite(TM): The Java(TM) library for
%   *    Parallel, Distributed, Multi-Core Computing for
%   *    Enterprise Grids & Clouds
%   *
%   * Copyright (C) 1997-2011 INRIA/University of
%   *                 Nice-Sophia Antipolis/ActiveEon
%   * Contact: proactive@ow2.org or contact@activeeon.com
%   *
%   * This library is free software; you can redistribute it and/or
%   * modify it under the terms of the GNU Affero General Public License
%   * as published by the Free Software Foundation; version 3 of
%   * the License.
%   *
%   * This library is distributed in the hope that it will be useful,
%   * but WITHOUT ANY WARRANTY; without even the implied warranty of
%   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
%   * Affero General Public License for more details.
%   *
%   * You should have received a copy of the GNU Affero General Public License
%   * along with this library; if not, write to the Free Software
%   * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
%   * USA
%   *
%   * If needed, contact us to obtain a release under GPL Version 2 or 3
%   * or a different license than the AGPL.
%   *
%   *  Initial developer(s):               The ProActive Team
%   *                        http://proactive.inria.fr/team_members.htm
%   *  Contributor(s):
%   *
%   * ################################################################
%   * $$PROACTIVE_INITIAL_DEV$$
%   */
function [ok, msg]=TestObjectArguments(nbiter,timeout)
if ~exist('timeout', 'var')
    if ispc()
        timeout = 200000;
    else
        timeout = 80000;
    end
end
if ~exist('nbiter', 'var')
    nbiter = 1;
end
for kk=1:nbiter
    disp('-------------------------------------');
    disp(['------------------------Iteration '  num2str(kk)]);
    disp('...... Testing PAsolve with Object arguments');
    disp('..........................1 PAwaitFor');
    d=dummy(55);
    resl = PAsolve(@dummyfunc,{d});
    val=PAwaitFor(resl,timeout)

    if val.field2 == 22
        disp('..........................1 ......OK');
        ok=true;
        msg = [];
    else
        disp('..........................1 ......KO');
        ok=false;
        msg = 'TestObjectArguments::wrong value for val.field2';
    end
end