<!---
*
* Copyright (C) 2005-2008 Razuna
*
* This file is part of Razuna - Enterprise Digital Asset Management.
*
* Razuna is free software: you can redistribute it and/or modify
* it under the terms of the GNU Affero Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* Razuna is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU Affero Public License for more details.
*
* You should have received a copy of the GNU Affero Public License
* along with Razuna. If not, see <http://www.gnu.org/licenses/>.
*
* You may restribute this Program with a special exception to the terms
* and conditions of version 3.0 of the AGPL as described in Razuna's
* FLOSS exception. You should have received a copy of the FLOSS exception
* along with Razuna. If not, see <http://www.razuna.com/licenses/>.
*
--->
<cfoutput>
	<div id="tab_addassets">
		<ul>
			<li><a href="##addsingle" onclick="loadcontent('addsingle','#myself##xfa.addsingle#&folder_id=#folder_id#');">#defaultsObj.trans("header_add_asset")#</a></li>
			<!--- <li class="TabbedPanelsTab" tabindex="1">#defaultsObj.trans("header_add_asset_many")#</li> --->
			<cfif NOT application.razuna.isp>
				<li><a href="##addserver" onclick="showwindow('#myself##xfa.addserver#&folder_id=#folder_id#','#defaultsObj.trans("header_add_asset_server")#',800,2);">#defaultsObj.trans("header_add_asset_server")#</a></li>
			</cfif>
			<li><a href="##addemail" onclick="loadcontent('addemail','#myself##xfa.addemail#&folder_id=#folder_id#');">#defaultsObj.trans("header_add_asset_email")#</a></li>
			<li><a href="##addftp" onclick="loadcontent('addftp','#myself##xfa.addftp#&folder_id=#folder_id#');">#defaultsObj.trans("header_add_asset_ftp")#</a></li>
			<li><a href="##addlink" onclick="loadcontent('addlink','#myself##xfa.addlink#&folder_id=#folder_id#');">#defaultsObj.trans("link_tab_header")#</a></li>
		</ul>
		<div id="addsingle" style="padding:0px;margin:0px;">#defaultsObj.loadinggif("#dynpath#")#</div>
		<cfif NOT application.razuna.isp>
			<div id="addserver"><p><a href="##" onclick="showwindow('#myself##xfa.addserver#&folder_id=#folder_id#','#defaultsObj.trans("header_add_asset_server")#',800,2);">The content of your server will open in a new window.</a></p></div>
		</cfif>
		<div id="addemail">#defaultsObj.loadinggif("#dynpath#")#</div>
		<div id="addftp">#defaultsObj.loadinggif("#dynpath#")#</div>
		<div id="addlink">#defaultsObj.loadinggif("#dynpath#")#</div>
	</div>
	<!--- Activate the Tabs --->
<script language="JavaScript" type="text/javascript">
	jqtabs("tab_addassets");
	$("##tab_addassets").tabs('select', 0);
	loadcontent('addsingle','#myself##xfa.addsingle#&folder_id=#folder_id#');
	//loadcontent('addemail','#myself##xfa.addemail#&folder_id=#folder_id#');
	//loadcontent('addftp','#myself##xfa.addftp#&folder_id=#folder_id#');
</script>
</cfoutput>