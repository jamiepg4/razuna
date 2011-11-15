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
	<cfif session.hosttype EQ "F">
		Here you can rebuild your search index, backup and restore your database and more.<br><br>
		<cfinclude template="dsp_host_upgrade.cfm">
	<cfelse>
		<!--- Re-Index --->
		<div style="background-color:yellow;font-weight:bold;height:40px;padding:10px;">During a rebuild of the search index or while conducting a Backup operation your server might become unresponsive to any requests! Do these operation when no one is accessing your server.</div>
		<table border="0" cellpadding="0" cellspacing="0" width="100%" class="grid">
			<tr>
				<th>#defaultsObj.trans("admin_maintenance_searchsync")#</th>
			</tr>
			<tr class="list">
				<td>#defaultsObj.trans("admin_maintenance_desc")#
				<br /><br />
				<div id="thea"><a href="##" onclick="doreindexassets();">#defaultsObj.trans("admin_maintenance_do")#</a></div>
				<br />
				</td>
			</tr>
		</table>
		<!--- Database Cleaner --->
		<table border="0" cellpadding="0" cellspacing="0" width="100%" class="grid">
			<tr>
				<th>#defaultsObj.trans("admin_maintenance_db_cleaner")#</th>
			</tr>
			<tr class="list">
				<td>
				#defaultsObj.trans("admin_maintenance_db_cleaner_desc")#<br /><br />
				<a href="##" onclick="docleaner();">#defaultsObj.trans("admin_maintenance_db_cleaner_link")#</a>
				<br /><br />
				</td>
			</tr>
		</table>
		<!--- Backup --->
		<table border="0" cellpadding="0" cellspacing="0" width="100%" class="grid">
			<tr>
				<th>#defaultsObj.trans("admin_maintenance_backup_desc")#</th>
			</tr>
			<tr class="list">
				<td>#defaultsObj.trans("admin_maintenance_backup_desc2")#<br /><br />
				Save to: <input type="radio" name="tofiletype" id="tofiletype" value="sql" checked="checked"> SQL file <input type="radio" name="tofiletype" id="tofiletype" value="xml"> XML file <input type="button" name="backup" value="Export Now" class="button" onclick="dobackup();" style="margin-left:30px;"><div id="backup_progress"></div><div id="backup_dummy"></div></td>
			</tr>
		</table>
		
		<div id="dummy_maintenance"></div>
		<!--- Load Progress --->
		<script type="text/javascript">
			// Do Re-Index
			function doreindexassets(){
				window.open('#myself#c.admin_rebuild_do&v=#createuuid()#', 'winreindex', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=1,resizable=1,copyhistory=no,width=500,height=500');
			};
			// Do Backup
			function dobackup(){
				var tofiletype = $('input:radio[name=tofiletype]:checked').val();
				window.open('#myself#c.admin_backup&tofiletype=' + tofiletype, 'winbackup', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=1,resizable=1,copyhistory=no,width=500,height=500');
			};
			// Do Cleaner
			function docleaner(){
				window.open('#myself#c.admin_cleaner&v=#createuuid()#', 'wincleaner', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=1,resizable=1,copyhistory=no,width=800,height=600');
			};
			// Do Restore from filesystem
			function dorestore(backid){
				// Clear the value of the divs
				$("##restore_progress").html('');
				window.open('#myself#c.admin_restore&back_id=' + escape(backid), 'winrestore', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=1,resizable=1,copyhistory=no,width=500,height=500');
			};
		</script>
	</cfif>
</cfoutput>