--
-- Copyright (C) 2018 CurlyMo & Niek
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/.
--

local M = {}

function M.check(parameters)
	if parameters['GET'] == nil and parameters['POST'] == nil then
		error("http action is missing a \"GET\" or \"POST\" statement");
	end

	if parameters['GET'] ~= nil and parameters['POST'] ~= nil then
		error("http action cannot have \"GET\" and \"POST\" statements at the same time");
	end
	
	if parameters['POST'] ~= nil and parameters['MIMETYPE'] == nil then
		error("http action \"POST\" request requires a \"MIMETYPE\" statement");
	end

	if parameters['POST'] ~= nil and parameters['PARAM'] == nil then
		error("http action \"POST\" request requires a \"PARAM\" statement");
	end

	if parameters['GET'] ~= nil and (#parameters['GET']['value'] ~= 1 or parameters['GET']['value'][2] ~= nil) then
		error("http action \"GET\" only takes one argument");
	end

	if parameters['POST'] ~= nil and (#parameters['POST']['value'] ~= 1 or parameters['POST']['value'][2] ~= nil) then
		error("http action \"POST\" only takes one argument");
	end
	
	if parameters['MIMETYPE'] ~= nil and (#parameters['MIMETYPE']['value'] ~= 1 or parameters['MIMETYPE']['value'][2] ~= nil) then
		error("http action \"MIMETYPE\" only takes one argument");
	end
	
	if parameters['PARAM'] ~= nil and (#parameters['PARAM']['value'] ~= 1 or parameters['PARAM']['value'][2] ~= nil) then
		error("http action \"PARAM\" only takes one argument");
	end
	
	return 1;
end

function M.callback(http)
	if http.getCode() == 200 then
		error("http action calling ".. http.getUrl() .. " succeeded, received \"" .. http.getData() .. "\"");
	else
		error("http action calling ".. http.getUrl() .. " failed with code " .. tostring(http.getCode()));
	end
end

function M.run(parameters)

	local httpobj = pilight.network.http();
	httpobj.setCallback("callback");

	if parameters['GET'] ~= nil then
		if parameters['PARAM'] ~=nil then
			httpobj.setUrl(parameters['GET']['value'][1] .. "?" .. parameters['PARAM']['value'][1]);
		else
			httpobj.setUrl(parameters['GET']['value'][1]);
		end
		httpobj.setMimetype("");
		httpobj.get();
	else
		httpobj.setUrl(parameters['POST']['value'][1]);
		httpobj.setMimetype(parameters['MIMETYPE']['value'][1]);
		httpobj.setData(parameters['PARAM']['value'][1]);
		httpobj.post();
	end
	
	return 1;
end

function M.parameters()
	return "POST", "GET", "DEVICE", "MIMETYPE", "PARAM";
end

function M.info()
	return {
		name = "http",
		version = "0.1",
		reqversion = "7.0",
		reqcommit = "94"
	}
end

return M;